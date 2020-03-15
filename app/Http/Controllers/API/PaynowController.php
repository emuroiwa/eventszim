<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Paynow\Payments\Paynow;
use App\Orders;
use App\Payments;
use App\PaymentDetails;
use App\Customer;
use App\PriceSubCategory;
use DB;

class PaynowController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    public function index()
    {

    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $userID = $request['user_id'];
        $paymentRef = time();
        $paynow = new Paynow(
            '8915',
            'bf2d3b2c-f35e-4341-ba30-7dd8d5949323',
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef,
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef
        );

        $payment = $paynow->createPayment($paymentRef, $request['email_ticket']);

        $orders = Orders::Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
                        ->Join('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
                        ->select(DB::raw('COALESCE(price_zwl * orders.quantity,0) as total_zwl,event_name'))
                        ->where('user_id','=',$userID)
                        ->where('orders.status','=',0)
                        ->orderby('orders.id', 'DESC')->get();

        $total = 0.0;
        foreach( $orders as $r) {
            $payment->add($r->event_name, $r->total_zwl);
            $total += $r->total_zwl;
        }
        
        if ($request['payment_type'] == 'paynow') {
            $response = $paynow->send($payment);
        } else {
            $response = $paynow->sendMobile($payment, $request['contact'], $request['payment_type']);
            // wait 33 sec for customer to input mobile money password
            sleep(33);

        }

        if ($response->success()) {

            $link = $response->redirectUrl();
            $pollUrl = $response->pollUrl();
            $status = $paynow->pollTransaction($pollUrl);

            //set order IDs in orders and customers table
            Orders::where('user_id', $request['user_id'])
            ->where('status', 0)
            ->update( array('status'=>1, 'reference'=>$paymentRef) );

            Customer::where('user_id', $request['user_id'])
            ->where('order_id', '11111')
            ->update( array('order_id'=>$paymentRef) );

            PaymentDetails::create([
                'user_id' => $request['user_id'],
                'fullname' => $request['fullname'],
                'order_id' =>$paymentRef,
                'contact' => $request['contact'],
                'email' => $request['email_ticket'],
            ]);

            //create payment record
            Payments::create([
                'order_ref' => $paymentRef,
                'amount' => $total,
                'currency' => 'ZWL',
                'paygate' => 'paynow',
                'status' => 0,
                'pollURL'=>  $pollUrl,
            ]);
            
            if ($request['payment_type'] == 'paynow')
            {
                return $link;
            }else
            {
                return $this->CheckMobilePayment($paymentRef);
            } 


        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return $this->CheckPayment($id);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
   
    public function CheckMobilePayment($paymentRef)
    {
        $paynow = new Paynow(
            '8915',
            'bf2d3b2c-f35e-4341-ba30-7dd8d5949323',
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef,
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef
        );

        $pollUrl = "";
        $currentStatus = "";
        $transactions = Payments::where('order_ref','=',$paymentRef)->get();
        
        foreach ($transactions as $r) {
            $pollUrl = $r->pollURL;
            $currentStatus = $r->status;
        }
         // Check the status of the transaction
        $status = $paynow->pollTransaction($pollUrl);
        $paynowStatues = array("awaiting delivery", "paid", "delivered");
        
         if ((in_array($status->status(), $paynowStatues))) {

            Orders::where('reference', $paymentRef)
            ->where('status', 1)
            ->update( array('status'=>2) );

            Payments::where('order_ref', $paymentRef)
            ->where('status', 0)
            ->update( array('status'=>1));
            
            $this->updateStock($paymentRef);
            return 'payments?z14ea26b00ad9='. $paymentRef;
                     
         } else {
             //cancelled transactins
            Orders::where('reference', $paymentRef)
            ->where('status', 1)
            ->update( array('status'=>3) );
            
            Payments::where('order_ref', $paymentRef)
            ->where('status', 0)
            ->update( array('status'=>2));
            return 'payments?z14ea26b00ad9='. $paymentRef;
         }
    }
    public function CheckPayment($paymentRef)
    {
        $paynow = new Paynow(
            '8915',
            'bf2d3b2c-f35e-4341-ba30-7dd8d5949323',
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef,
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef
        );

        $pollUrl = "";
        $currentStatus = "";
        $transactions = Payments::where('order_ref','=',$paymentRef)->get();
        
        foreach ($transactions as $r) {
            $pollUrl = $r->pollURL;
            $currentStatus = $r->status;
        }
         // Check the status of the transaction
        $status = $paynow->pollTransaction($pollUrl);
        $paynowStatues = array("awaiting delivery", "paid", "delivered");
        
         if ((in_array($status->status(), $paynowStatues))) {

            Orders::where('reference', $paymentRef)
            ->update( array('status'=>2) );

            Payments::where('order_ref', $paymentRef)
                ->update( array('status'=>1));
            
            $this->updateStock($paymentRef);

            return ['message'=>'done'];
            
         } else {
             //cancelled transactins
            Orders::where('reference', $paymentRef)
            ->update( array('status'=>3) );
            
            Payments::where('order_ref', $paymentRef)
            ->update( array('status'=>2));

            return ['message'=>'cancel'];
           
         }
    }
    public function updateStock($paymentRef)
    {
        $orders = PriceSubCategory::Join('orders', 'orders.category_id', '=', 'price_sub_categories.id')
                    ->select(DB::raw('SUM(orders.quantity) as quantity_sold,price_sub_categories.id,price_sub_categories.quantity'))
                    ->where('orders.reference','=',$paymentRef)
                    ->where('orders.status','=',2)
                    ->groupBy(DB::raw('price_sub_categories.id,price_sub_categories.quantity'))
                    ->orderby('orders.id', 'DESC')
                    ->get();
                
                foreach ($orders as $r) {
                    if ($r->quantity_sold >= $r->quantity) 
                    {
                        PriceSubCategoryController::where('id', $r->id)
                            ->update( array('status'=>'sold_out') );
                    }
                }

    }

    public function checkStock($paymentRef)
    {
        $orders = Orders::select('description','price_sub_categories.status AS ticketStatus')
                    ->Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
                    ->where('reference','=',$paymentRef)
                    ->orderby('orders.id', 'DESC')
                    ->get();
                $soldOut = [];
                foreach ($orders as $r) {
                    if ($r->ticketStatus != 'sale') 
                    {
                        $soldOut = $r->description . " Tickets have been sold out, Click ok and remove the ticket";
                    }
                    
                }
                if ($soldOut)
                {
                    return $soldOut;
                }
                else
                {
                    return 'success';
                }

    }
   
}
