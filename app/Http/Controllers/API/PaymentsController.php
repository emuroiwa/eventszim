<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMailable;
use Paynow\Payments\Paynow;
use App\Orders;
use App\Payments;
use DateTime;
use PDF;
// use Mail;
use File;
use DB;


class PaymentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       // $this->Paynow();
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
    public function getTicketDetails($id)
    {
       $nonMarathon = Orders::Join('payments', 'payments.order_ref', '=', 'orders.reference')
        ->Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->Join('zim_events', 'zim_events.id', '=', 'price_sub_categories.event_id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->leftJoin('event_infos', 'event_infos.event_id', '=', 'zim_events.id')
        ->leftJoin('event_types', 'event_types.event_id', '=', 'zim_events.id')
        ->select(DB::raw('"" AS cid,orders.id,payments.order_ref,event_name,"" AS  fullname,
                            "" AS  contact,"" AS  marathon_type,"" AS  marathon_pickup,
                            COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,
                            orders.quantity, price_sub_categories.description,price_usd,price_zwl,start_date,end_date,event_name,venue,town,event_img'))
        ->where('payments.order_ref','=',$id)
        ->where('payments.status','=',1)
        ->where('event_types.event_type','<>','marathon');

        return Orders::leftJoin('customers', 'customers.order_id', '=', 'orders.reference')
        ->Join('payments', 'payments.order_ref', '=', 'orders.reference')
        ->Join('price_sub_categories', 'price_sub_categories.id', '=', 'customers.event_id')
        ->Join('zim_events', 'zim_events.id', '=', 'price_sub_categories.event_id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->leftJoin('event_infos', 'event_infos.event_id', '=', 'zim_events.id')
        ->select(DB::raw('customers.id AS cid,orders.id,payments.order_ref,event_name,customers.fullname,
                            customers.contact,customers.marathon_type,customers.marathon_pickup,
                            COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,
                            orders.quantity, description,price_usd,price_zwl,start_date,end_date,event_name,venue,town,event_img'))
        ->where('payments.order_ref','=',$id)
        ->where('payments.status','=',1)
        ->union($nonMarathon)
        ->groupBy(DB::raw('customers.id'))
        ->get();
             
     }

    public function sendmail(Request $request)
    {
        $data["email"] = $request['email'];
        $data["subject"] = $request['subject'];
        $data["client_name"] = $request['client_name'];
        $data["from_email"] = 'admin@ticketbook.co.zw';
        $data["email_type"] = $request['email_type'];
        $data["order_id"] = $request['order_id'];

        if ($request['email_type'] == "success") {
            $dataPDF = $this->getTicketDetails($request['order_id']);
            $pdf = PDF::loadView('email.ticket', ["data1"=>$dataPDF]);
            $data['PDFcaption']=$request['client_name'].$request['subject'];
        }
       
        try {
            if ($request['email_type'] == "success") {
                Mail::send('email.emailbody', ["data1"=>$dataPDF, "data2"=>$data], function($message)use($data,$pdf) {
                $message->to($data['email'], $data["client_name"])
                ->subject($data["subject"])
                ->from($data['from_email'])
                ->attachData($pdf->output(), "Tickets.pdf");
                });
            } else {
               Mail::send('email.emailbody', ["data2"=>$data], function($message)use($data) {
                $message->to($data['email'], $data["client_name"])
                ->subject($data["subject"])
                ->from($data['from_email']);
                }); 
            }
        } catch (JWTException $exception) {
            $this->serverstatuscode = "0";
            $this->serverstatusdes = $exception->getMessage();
        }
        if (Mail::failures()) {
             $this->statusdesc  =   "Error sending mail";
             $this->statuscode  =   "0";

        } else {
           $this->statusdesc  =   "Message sent Succesfully";
           $this->statuscode  =   "1";
        }
        return response()->json(compact('this'));
    }
    public function CheckPayment($paymentRef)
    {
        $paynow = new Paynow(
            env('PAYNOW_INTEGRATION_ID', '5214'),
            env('PAYNOW_INTEGRATION_KEY', '5534bfbf-30d3-408a-876e-14ea26b00ad9'),
            env('PAYNOW_RETURN_URL', 'http://209.97.129.235/payments?z14ea26b00ad9='.$paymentRef),
            'http://209.97.129.235/payments?z14ea26b00ad9='.$paymentRef
        );
        $pollUrl = "";
        $transactions = Payments::where('order_ref','=',$paymentRef)->get();
        
        foreach ($transactions as $r) {
            $pollUrl = $r->pollURL;
        }
         // Check the status of the transaction
        $status = $paynow->pollTransaction($pollUrl);
         if (true) {
             //success
            Orders::where('reference', $paymentRef)
            ->where('status', 1)
            ->update( array('status'=>2));

            Payments::where('order_ref', $paymentRef)
            ->where('status', 0)
            ->update( array('status'=>1));

            return true;
            
         } else {
             //cancelled transactins
            Orders::where('reference', $paymentRef)
            ->where('status', 1)
            ->update( array('status'=>3) );
            
            Payments::where('order_ref', $paymentRef)
            ->where('status', 0)
            ->update( array('status'=>2));

            return false;

         }
    }
    
}
