<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\ZimEvents;
use DB;
use Response;

class EventsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return ZimEvents::Join('event_infos', 'event_infos.event_id', '=', 'zim_events.id')
        // ->Join('price_sub_categories', 'price_sub_categories.event_id', '=', 'zim_events.id')
        // ->orderby('zim_events.id', 'DESC')
        // ->get();
        
        $tableIds = DB::select( DB::raw("SELECT *,zim_events.id AS event_id FROM 	`zim_events` INNER JOIN `event_infos` ON `event_infos`.`event_id` = `zim_events`.`id`  ORDER BY `zim_events`.`id` DESC"));
        $jsonResult = array();

        for($i = 0;$i < count($tableIds);$i++)
        {
            $jsonResult[$i]["catergory_id"] = $tableIds[$i]->catergory_id;
            $jsonResult[$i]["event_name"] = $tableIds[$i]->event_name;
            $jsonResult[$i]["start_date"] = $tableIds[$i]->start_date;
            $jsonResult[$i]["end_date"] = $tableIds[$i]->end_date;
            $jsonResult[$i]["popular_rank"] = $tableIds[$i]->popular_rank;
            $jsonResult[$i]["discounts"] = $tableIds[$i]->discounts;
            $jsonResult[$i]["ticket_collection"] = $tableIds[$i]->ticket_collection;
            $jsonResult[$i]["refund_cancel"] = $tableIds[$i]->refund_cancel;
            $jsonResult[$i]["exchange_upgrade"] = $tableIds[$i]->exchange_upgrade;
            $jsonResult[$i]["duration"] = $tableIds[$i]->duration;
            $jsonResult[$i]["gps"] = $tableIds[$i]->gps;
            $jsonResult[$i]["event_details"] = $tableIds[$i]->event_details;
            $jsonResult[$i]["is_slider"] = $tableIds[$i]->is_slider;
            $jsonResult[$i]["event_img"] = $tableIds[$i]->event_img;
            $jsonResult[$i]["youtube"] = $tableIds[$i]->youtube;
            $jsonResult[$i]["instagram"] = $tableIds[$i]->instagram;
            $jsonResult[$i]["twitter"] = $tableIds[$i]->twitter;
            $jsonResult[$i]["id"] = $tableIds[$i]->event_id;
            $id = $tableIds[$i]->event_id;
            $jsonResult[$i]["price_categories"] = DB::select( DB::raw("SELECT * FROM `price_sub_categories` WHERE event_id = $id"));
        }

        return Response::json(array(
                    'error'     =>  false,
                    'events'    =>  $jsonResult),
                    200
            );

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
        
          
        $tableIds = DB::select( DB::raw("SELECT *,zim_events.id AS event_id FROM 	`zim_events` INNER JOIN `event_infos` ON `event_infos`.`event_id` = `zim_events`.`id` WHERE zim_events.id = $id   ORDER BY `zim_events`.`id` DESC"));
        $jsonResult = array();

        for($i = 0;$i < count($tableIds);$i++)
        {
            $jsonResult[$i]["catergory_id"] = $tableIds[$i]->catergory_id;
            $jsonResult[$i]["event_name"] = $tableIds[$i]->event_name;
            $jsonResult[$i]["start_date"] = $tableIds[$i]->start_date;
            $jsonResult[$i]["end_date"] = $tableIds[$i]->end_date;
            $jsonResult[$i]["popular_rank"] = $tableIds[$i]->popular_rank;
            $jsonResult[$i]["discounts"] = $tableIds[$i]->discounts;
            $jsonResult[$i]["ticket_collection"] = $tableIds[$i]->ticket_collection;
            $jsonResult[$i]["refund_cancel"] = $tableIds[$i]->refund_cancel;
            $jsonResult[$i]["exchange_upgrade"] = $tableIds[$i]->exchange_upgrade;
            $jsonResult[$i]["duration"] = $tableIds[$i]->duration;
            $jsonResult[$i]["gps"] = $tableIds[$i]->gps;
            $jsonResult[$i]["event_details"] = $tableIds[$i]->event_details;
            $jsonResult[$i]["is_slider"] = $tableIds[$i]->is_slider;
            $jsonResult[$i]["event_img"] = $tableIds[$i]->event_img;
            $jsonResult[$i]["youtube"] = $tableIds[$i]->youtube;
            $jsonResult[$i]["instagram"] = $tableIds[$i]->instagram;
            $jsonResult[$i]["twitter"] = $tableIds[$i]->twitter;
            $jsonResult[$i]["id"] = $tableIds[$i]->event_id;
            $id = $tableIds[$i]->event_id;
            $jsonResult[$i]["price_categories"] = DB::select( DB::raw("SELECT * FROM `price_sub_categories` WHERE event_id = $id"));
        }

        return Response::json(array(
                    'error'     =>  false,
                    'events'    =>  $jsonResult),
                    200
            );



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
    public function search(){
        if ($search = \Request::get('q')) {
        //     ZimEvents::Join('event_infos', 'event_infos.event_id', '=', 'zim_events.id')
        // ->Join('price_sub_categories', 'price_sub_categories.event_id', '=', 'zim_events.id')
        // ->where('zim_events.id','=',$id)
        // ->orderby('zim_events.id', 'DESC')
        // ->get();
            $events = ZimEvents::leftJoin('event_locations', 'event_locations.event_id', '=', 'zim_events.id')
            ->select(DB::raw('DATE_FORMAT(start_date, "%M %d %Y") as start_date'),'event_name','zim_events.id','venue','town')
                ->where(function($query) use ($search){
                $query->where('event_name','LIKE',"%$search%")
                        ->orWhere('popular_rank','LIKE',"%$search%");
            })->get();
        }else{
            $events = ZimEvents::latest()->get();
        }

        return $events;

    }
}
