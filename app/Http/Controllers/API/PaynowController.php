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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        $paynow = new Paynow(
            env('PAYNOW_INTEGRATION_ID', '5214'),
            env('PAYNOW_INTEGRATION_KEY', '5534bfbf-30d3-408a-876e-14ea26b00ad9'),
            env('PAYNOW_RETURN_URL', 'http://localhost:9091/paynow?id=cvalue'),

            // The return url can be set at later stages. You might want to do this if you want to pass data to the return url (like the reference of the transaction)
            'http://localhost:9091/paynow?id=cvalue'
        );

        $paynow->setResultUrl('http://localhost:9091/paynow?id=cvalue');
        # $paynow->setReturnUrl('');
        
        $payment = $paynow->createPayment('Invoice', 'emuroiwa@gmail.com');

        $orders = Orders::Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->Join('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->select(DB::raw('COALESCE(price_zwl * orders.quantity,0) as total_zwl,event_name'))
        ->where('user_id','=','cvalue')
        ->where('orders.status','=',0)
        ->orderby('orders.id', 'DESC')->get();
        foreach($orders as $r){
            $payment->add($r->event_name, $r->total_zwl);
        }
        $response = $paynow->send($payment);
        //print_r($response);
       // $response = $paynow->sendMobile($payment, '0771111111', 'ecocash');
        if($response->success()) {
            // Or if you prefer more control, get the link to redirect the user to, then use it as you see fit
            $link = $response->redirectUrl();

            $pollUrl = $response->pollUrl();
            //print_r($response);

            // Check the status of the transaction
            $status = $paynow->pollTransaction($pollUrl);
            return $link;

        }
    }
}
