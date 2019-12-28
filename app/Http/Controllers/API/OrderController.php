<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Orders;

class OrderController extends Controller
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

        Orders::create([
            'employee' => $request['employee'],
            'units' => $request['units'],
            'units_type' => $request['units_type'],
            'amount' => $request['amount'],
            'percentage' => $request['percentage'],
            'months' => $request['months'],
            'transaction' => $request['transaction'],
            'company' => getUserPref('company'),
            'payslip_defination' => $request['payslip_defination'],
            'tax_period' => getUserPref('tax_period'),
            'start_date_payment' => $request['start_date_payment'],
            'calculated_on_table' => $request['calculated_on_table'],
            'calculated_on_id' => $request['calculated_on_id'],
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
        //
    }
}
