<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Paynow\Payments\Paynow;
use App\Orders;
use App\Payments;
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
            env('PAYNOW_INTEGRATION_ID', '5214'),
            env('PAYNOW_INTEGRATION_KEY', '5534bfbf-30d3-408a-876e-14ea26b00ad9'),
            env('PAYNOW_RETURN_URL', 'http://209.97.129.235/payments?z14ea26b00ad9='.$paymentRef),

            // The return url can be set at later stages. You might want to do this if you want to pass data to the return url (like the reference of the transaction)
            'http://209.97.129.235/payments?z14ea26b00ad9='.$paymentRef
        );

        
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
            $response = $paynow->sendMobile($payment, '0771111111', 'ecocash');
        }
        //print_r($response);
       // 
        if($response->success()) {
            // Or if you prefer more control, get the link to redirect the user to, then use it as you see fit
            $link = $response->redirectUrl();

            $pollUrl = $response->pollUrl();
            //print_r($response);

            Orders::where('user_id', $request['user_id'])
            ->where('status', 0)
            ->update( array('status'=>1, 'reference'=>$paymentRef) );
            
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
    public function CheckPayment($paymentRef){
        $paynow = new Paynow(
            env('PAYNOW_INTEGRATION_ID', '5214'),
            env('PAYNOW_INTEGRATION_KEY', '5534bfbf-30d3-408a-876e-14ea26b00ad9'),
            env('PAYNOW_RETURN_URL', 'http://209.97.129.235/payments?z14ea26b00ad9='.$paymentRef),

            // The return url can be set at later stages. You might want to do this if you want to pass data to the return url (like the reference of the transaction)
            'http://209.97.129.235/payments?z14ea26b00ad9='.$paymentRef
        );
        $pollUrl = "";

        $transactions = Payments::where('order_ref','=',$paymentRef)
        ->get();
        foreach($transactions as $r){
            $pollUrl = $r->pollURL;
        }
         // Check the status of the transaction
         $status = $paynow->pollTransaction($pollUrl);
         print_r($status);
         if($status->paid()) {
            return true;
         }else{
            return false;
         }
    }
   
}
