<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    @include('meta::manager',
    [
        'title'         => 'Ticketbook Online tickets and events',
        'description'   => 'This is my example description',
        'keywords'      =>  'webtickets, webticket, online ticketing, online tickets, e-tickets, etickets, ticket, tickets, ticketing, buy tickets, ticket system, sell tickets, ticketing system, ticketing agent, ticket agent, ticket sales agent, rapid tickets, itickets, clicknpay, quicket, nutickets, events, tours',
    ])
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <link rel="shortcut icon" href="{{ asset('img/logo.png') }}">
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    @include('layouts.nav')  
