<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', function () {
    return view('welcome');
});
Auth::routes();
//Route::get('{path}','HomeController@index')->where( 'path', '([A-z\d]+)?' );
Route::get('/email', function () {
    return view('email.ticket');
});
Route::get('paynow/{id}', 'PaynowController@show')->name('paynow');
Route::get('{path}','HomeController@index')->where( 'path', '([A-z\d]+)?' );

