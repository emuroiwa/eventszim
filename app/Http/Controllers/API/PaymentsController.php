<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DateTime;
use PDF;
use Mail;
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
    public function sendmail(Request $request){
        $data["email"]=$request['email'];
        $data["subject"]=$request['subject'];
        $data["client_name"]=$request['client_name'];
        $data["from_email"]=$request['email'];
        print_r($data);
        // $dataPDF = getPayslipDetails($request['employee'],'current');
        //  $data['PDFcaption']=$dataPDF->employee_number.$dataPDF->last_names;
        //print_r($data);
        // $pdf = PDF::loadView('reports.payslip.payslip', $dataPDF);

        try{
            Mail::send('email.emailbody', $data, function($message)use($data) {
            $message->to($data['email'], $data["client_name"])
            ->subject($data["subject"])
            ->from($data['from_email']);
            //->attachData($pdf->output(), "Payslip_GM58.pdf");
            });
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
