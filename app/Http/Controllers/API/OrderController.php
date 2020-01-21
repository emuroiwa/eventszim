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
        ->select(DB::raw('orders.id,COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,orders.quantity, description,price_usd,price_zwl,start_date,end_date,event_name,venue,town,price_sub_categories.id as catID'))
        ->where('user_id','=',$value)
        ->where('orders.status','=',0)
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
        $results = Orders::where('category_id','=',$request['category_id'])
        ->where('user_id','=',$request['user_id'])
        ->where('status','=',0)
        ->get();
        // print_r(is_null($results));
        // return true;
        if(count($results)){
            $order_id = "";
            $newQuantity = 0;

            foreach($results as $r){
                $newQuantity = $r->quantity;
                $order_id = $r->id;
            }
            $newQuantity = $request['quantity'];
            Orders::where('id', $order_id)
            ->update( array('quantity'=>$newQuantity));

        }else{

            Orders::create([
                'category_id' => $request['category_id'],
                'quantity' => $request['quantity'],
                'user_id' => $request['user_id'],
                'status' => 0,
            
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
        
        return Orders::leftJoin('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->leftJoin('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->leftJoin('event_types', 'zim_events.event_type_id', '=', 'event_types.id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->select(DB::raw('orders.id,COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,orders.quantity, price_sub_categories.description,price_usd,price_zwl,start_date,end_date,event_name,venue,town,event_type,price_sub_categories.id as catID'))
        ->where('user_id','=',$id)
        ->where('orders.status','=',0)
        ->orderby('orders.id', 'DESC')->get();
    }
    public function marathon($id)
    {
        
        return Orders::leftJoin('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->leftJoin('zim_events', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->leftJoin('event_types', 'zim_events.event_type_id', '=', 'event_types.id')
        ->leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
        ->select(DB::raw('orders.id,COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,orders.quantity, price_sub_categories.description,price_usd,price_zwl,start_date,end_date,event_name,venue,town,event_type,price_sub_categories.id as catID'))
        ->where('user_id','=',$id)
        ->where('orders.status','=',0)
        ->whereNotIn('price_sub_categories.id', function ($query) use ($id){
            $query->select('event_id')->from('customers')
            ->where('user_id','=',$id);
        })
        ->orderby('orders.id', 'DESC')->get();
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
        //print_r($request['status']);
       
        if($request['status'] == 1){
            Orders::where('user_id', $id)
            ->where('status', 0)
            ->update( array('status'=>1) );
        }else{
            Orders::where('user_id', $id)
            ->where('status', 0)
            ->update( array('status'=> $request['status']));
        }
        

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
    public function cartItems($id){
       
        return Orders::Join('price_sub_categories', 'price_sub_categories.id', '=', 'orders.category_id')
        ->select(DB::raw('COALESCE(price_usd * orders.quantity,0) as total_usd,COALESCE(price_zwl * orders.quantity,0) as total_zwl,orders.quantity, description,price_usd,price_zwl1'))
        ->where('user_id','=',$id)
        ->where('orders.status','=',0)
        ->count();
    }
    
}
