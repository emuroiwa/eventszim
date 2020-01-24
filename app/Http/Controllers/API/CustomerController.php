<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Customer;
use App\Payments;
use App\PaymentDetails;
use App\Orders;
use Illuminate\Support\Str;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        if($request['ticketDetails']){
            foreach($request['ticketDetails'] as $r){
                Customer::create([
                    'user_id' => $request['user_id'],
                    'fullname' => $r['fullname'],
                    'contact' => $r['contact'],
                    'order_id' => '11111',
                    'marathon_type' => $r['category'],
                    'marathon_pickup' => $r['pack'],
                    'tshirtsize' => $r['tshirtsize'],
                    'gender' => $r['gender'],
                    'event_id' => $r['event_id'],
                
                ]);
            }

        }else{

            $this->validate($request,[
                'fullname' => 'required|max:255',
                'contact' => 'required|max:50',
                'email_ticket' => 'required|email',
                'confirm_email' => 'required|email',
                'payment_type' => 'required',
           
            ]);
                    
            Customer::create([
                'user_id' => $request['user_id'],
                'order_id' => '11111',
                'fullname' => $request['fullname'],
                'contact' => $request['contact'],
                'email' => $request['email_ticket'],
                'payment_type' => $request['payment_type'],
                'gender' => $request['gender'],
            
            ]);
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
        return Customer::where('user_id','=',$id)
        ->latest('id')->first();
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
    public function checkMarathonDetails($user_id){

        $customers = Customer::select('*')
        ->where('user_id','=',$user_id)
        ->where('order_id','=','11111')
        ->count('id');

        $marathonTickets = Orders::Join('customers', 'customers.event_id', '=', 'orders.category_id')
        ->leftJoin('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->leftJoin('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->leftJoin('event_types', 'zim_events.event_type_id', '=', 'event_types.id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->select('*')
        ->where('orders.user_id','=',$user_id)
        ->where('orders.status','=',0)
        ->where('event_types.event_type','=','marathon')
        ->sum('orders.quantity');
      // print_r($marathonTickets);
        if($marathonTickets ==""){
            return 'true';
        }else{
            return 'false';
        }
    }
}
