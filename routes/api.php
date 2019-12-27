<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources(['events' => 'API\EventsController']);
Route::apiResources(['locations' => 'API\EventLocationController ']);
Route::apiResources(['pricecategory' => 'API\PriceCategoryController']);
Route::apiResources(['eventinfo' => 'API\EventInfoController']);
Route::get('findEvents', 'API\EventsController@search');
