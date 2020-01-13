<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Customer;
use App\Payments;
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
        
        $this->validate($request,[
            'fullname' => 'required|max:255',
            'contact' => 'required|max:50',
            'email_ticket' => 'required|email',
            'confirm_email' => 'required|email',
            'payment_type' => 'required',
       
        ]);
        
            return Customer::create([
                'user_id' => $request['user_id'],
                'order_id' => $request['order_id'],
                'fullname' => $request['fullname'],
                'contact' => $request['contact'],
                'email' => $request['email_ticket'],
                'payment_type' => $request['payment_type'],
                'gender' => $request['gender'],
            
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
}
