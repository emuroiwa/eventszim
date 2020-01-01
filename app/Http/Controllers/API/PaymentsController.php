<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Paynow\Payments\Paynow;

class PaymentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->Paynow();
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
            '5214',
            '5534bfbf-30d3-408a-876e-14ea26b00ad9',
            'http://example.com/gateways/paynow/update',

            // The return url can be set at later stages. You might want to do this if you want to pass data to the return url (like the reference of the transaction)
            'http://example.com/return?gateway=paynow'
        );

        # $paynow->setResultUrl('');
        # $paynow->setReturnUrl('');

        $payment = $paynow->createPayment('Invoice 2', 'emuroiwa@gmail.com');

        $payment->add('Sadza and Beans', 1.85);

        $response = $paynow->send($payment);
       // $response = $paynow->sendMobile($payment, '0771111111', 'ecocash');
        if($response->success()) {
            print_r('success');
            // Or if you prefer more control, get the link to redirect the user to, then use it as you see fit
            $link = $response->redirectUrl();

            $pollUrl = $response->pollUrl();


            // Check the status of the transaction
            $status = $paynow->pollTransaction($pollUrl);

        }
    }
}
