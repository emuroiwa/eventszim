<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Customer;
use App\Payments;
use App\PaymentDetails;
use App\Orders;

class MarathonController extends Controller
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
        $marathonTickets = Orders::leftJoin('customers', function($join){
            $join->on('customers.event_id', '=', 'orders.category_id')
                 ->where('customers.order_id', '=', 11111);
        })       ->leftJoin('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->leftJoin('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->leftJoin('event_types', 'zim_events.event_type_id', '=', 'event_types.id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->select('orders.quantity','zim_events.event_name','price_sub_categories.description','orders.category_id AS catID','customers.user_id')
        ->where('orders.user_id','=',$id)
        ->where('orders.status','=',0)
        ->where('event_types.event_type','=','marathon')
        ->get();
        return $marathonTickets;
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

        $marathonTickets = Orders::leftJoin('customers', function($join){
            $join->on('customers.event_id', '=', 'orders.category_id')
                 ->where('customers.order_id', '=', 11111);
        })->leftJoin('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->leftJoin('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->leftJoin('event_types', 'zim_events.event_type_id', '=', 'event_types.id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->select('orders.category_id','customers.user_id')
        ->where('orders.user_id','=',$user_id)
        ->where('orders.status','=',0)
        ->where('event_types.event_type','=','marathon')
        ->whereNull('customers.user_id')
        ->orderby('orders.user_id', 'DESC')->get();
        //print_r($marathonTickets);
        $needMarathon = "";
        foreach($marathonTickets as $r){
            if($r->user_id == ""){
                $needMarathon = 'true';
            }else{
                $needMarathon = 'false';
            }
        }
        return $needMarathon;
      // print_r($marathonTickets);
        
    }
}
