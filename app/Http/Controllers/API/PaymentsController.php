<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMailable;
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
    public function getTicketDetails($id){
    
            
        return Payments::Join('orders', 'orders.reference', '=', 'payments.order_ref')
        ->Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->Join('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->select(DB::raw('orders.id,COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,orders.quantity, description,price_usd,price_zwl,start_date,end_date,event_name,venue,town'))
        ->where('payments.order_ref','=',$id)
        ->where('payments.status','=',1)
        ->orderby('orders.id', 'DESC')->get();
             
     }

    public function sendmail(Request $request){
        $data["email"] = $request['email'];
        $data["subject"] = $request['subject'];
        $data["client_name"] = $request['client_name'];
        $data["from_email"] = $request['email'];
        $data["email_type"] = $request['email_type'];
        $data["order_id"] = $request['order_id'];

        if($request['email_type'] == "success"){
            $dataPDF = $this->getTicketDetails($request['order_id']);
            $data['PDFcaption']=$request['client_name'].$request['subject'];
           print_r($data);
           //$pdf = PDF::loadView('email.ticket', $dataPDF);
   
        }
       
        try{
            if($request['email_type'] == "success"){
                Mail::send('email.emailbody', $data, function($message)use($data) {
                $message->to($data['email'], $data["client_name"])
                ->subject($data["subject"])
                ->from($data['from_email']);
               // ->attachData($pdf->output(), $data["subject"].".pdf");
                });
            }else{
               Mail::send('email.emailbody', $data, function($message)use($data) {
                $message->to($data['email'], $data["client_name"])
                ->subject($data["subject"])
                ->from($data['from_email']);
                }); 
            }
        }catch(JWTException $exception){
            $this->serverstatuscode = "0";
            $this->serverstatusdes = $exception->getMessage();
        }
        if (Mail::failures()) {
             $this->statusdesc  =   "Error sending mail";
             $this->statuscode  =   "0";

        }else{

           $this->statusdesc  =   "Message sent Succesfully";
           $this->statuscode  =   "1";
        }
        return response()->json(compact('this'));
    }
    
}
