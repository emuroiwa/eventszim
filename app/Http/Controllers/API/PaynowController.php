<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Paynow\Payments\Paynow;
use App\Orders;
use App\Payments;
use App\PaymentDetails;
use App\Customer;
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
       return $this->Paynow();
    }

    // 5214
    //
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $userID = $request['user_id'];
        // $paymentRef = sha1(time());
        $paymentRef = time();
        $paynow = new Paynow(
            '5214',
            '5534bfbf-30d3-408a-876e-14ea26b00ad9',
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef,

            // The return url can be set at later stages. You might want to do this if you want to pass data to the return url (like the reference of the transaction)
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef
        );

       // print_r($paynow);
        $payment = $paynow->createPayment($paymentRef, $request['email_ticket']);
       // $payment = $paynow->createPayment('Invoice', 'emuroiwa@gmail.com');

        $orders = Orders::Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->Join('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->select(DB::raw('COALESCE(price_zwl * orders.quantity,0) as total_zwl,event_name'))
        ->where('user_id','=',$userID)
        ->where('orders.status','=',0)
        ->orderby('orders.id', 'DESC')->get();
        $total = 0.0;
        foreach($orders as $r){
            $payment->add($r->event_name, $r->total_zwl);
            $total += $r->total_zwl;
        }
        if($request['payment_type'] == 'paynow'){
            $response = $paynow->send($payment);
        }else{
            $response = $paynow->sendMobile($payment, $request['ecocash'], 'ecocash');
        }
        //print_r($response);
       // 
        if($response->success()) {
            // Or if you prefer more control, get the link to redirect the user to, then use it as you see fit
            $link = $response->redirectUrl();
            
            $pollUrl = $response->pollUrl();
            //print_r($response);
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

            return $link;

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
    public function Paynow(){
        //require_once('./paynow/vendor/autoload.php');
       // require_once base_path('vendor\paynow\php-sdk\autoload.php');
       
    }
    // '5214',
    //'5534bfbf-30d3-408a-876e-14ea26b00ad9',
    public function CheckPayment($paymentRef){
        $paynow = new Paynow(
            '5214',
            '5534bfbf-30d3-408a-876e-14ea26b00ad9',
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef,

            // The return url can be set at later stages. You might want to do this if you want to pass data to the return url (like the reference of the transaction)
            'http://ticketbook.co.zw/payments?z14ea26b00ad9='.$paymentRef
        );
        $pollUrl = "";

        $transactions = Payments::where('order_ref','=',$paymentRef)
        ->get();
        foreach($transactions as $r){
            $pollUrl = $r->pollURL;
        }
         // Check the status of the transaction
        $status = $paynow->pollTransaction($pollUrl);
        $paynowStatues = array("awaiting delivery", "paid", "delivered");
        
         if((in_array($status->status(), $paynowStatues))) {
             //success
            //print_r(in_array($status->status(), $paynowStatues));
            Orders::where('reference', $paymentRef)
            ->where('status', 1)
            ->update( array('status'=>2) );

            Payments::where('order_ref', $paymentRef)
            ->where('status', 0)
            ->update( array('status'=>1));

            return ['message'=>'done'];
            
         }else{
             //cancelled transactins
            Orders::where('reference', $paymentRef)
            ->where('status', 1)
            ->update( array('status'=>3) );
            
            Payments::where('order_ref', $paymentRef)
            ->where('status', 0)
            ->update( array('status'=>2));

            return ['message'=>'cancel'];


         }
    }
   
}
