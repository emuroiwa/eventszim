<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\ZimEvents;

class EventsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ZimEvents::Join('event_infos', 'event_infos.event_id', '=', 'zim_events.id')
        ->Join('price_sub_categories', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->orderby('zim_events.id', 'DESC')
        ->get();

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
        return ZimEvents::Join('event_infos', 'event_infos.event_id', '=', 'zim_events.id')
        ->Join('price_sub_categories', 'price_sub_categories.event_id', '=', 'zim_events.id')
        ->where('zim_events.id','=',$id)
        ->orderby('zim_events.id', 'DESC')
        ->get();
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
