<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Orders;
use Illuminate\Support\Str;
use Cookie;
use DB;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $request = new \Illuminate\Http\Request;
        $value = $request->cookie('eventszim_session');
        return Orders::Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->Join('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->select(DB::raw('orders.id,COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,orders.quantity, description,price_usd,price_zwl,start_date,end_date,event_name,venue,town'))
        ->where('user_id','=',$value)
        ->orderby('orders.id', 'DESC')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       

        $response = new \Illuminate\Http\Response('Hello World');

        //Call the withCookie() method with the response method
        $response->withCookie(cookie('gm58_orders', Str::random(10),60));
        $value = $request->cookie('eventszim_session');
        print_r($value);

        Orders::create([
            'category_id' => $request['category_id'],
            'quantity' => $request['quantity'],
            'user_id' => $value,
            'status' => 0,
         
        ]);

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
            $Orders = Orders::findOrFail($id);
            $Orders->delete();
    }
    public function cartItems(){
        $request = new \Illuminate\Http\Request;
        $value = $request->cookie('eventszim_session');
        return Orders::Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->select(DB::raw('COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,orders.quantity, description,price_usd,price_zwl'))
        ->where('user_id','=',$value)
        ->count();
    }
}
