<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    @include('meta::manager',
    [
        'title'         => 'Ticketbook Online tickets and events',
        'description'   => 'Ticketbook offers the most secure and reliable ticketing and e-commerce platform in Zimbabwe.Ecocash,Telecash,Vpayments,Visa and Mastercard are all Accepted.',
        'keywords'      =>  'webtickets, webticket, online ticketing, online tickets, e-tickets, etickets, ticket, tickets, ticketing, buy tickets, ticket system, sell tickets, ticketing system, ticketing agent, ticket agent, ticket sales agent, rapid tickets, itickets, ClicknPay,Ticketing,Ticket,e-commerce,e-ticketing,event,music,events,ClicknPay Zimbabwe,clicknpay, ticketing , event accreditation, ticketing partner',
    ])
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">

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
   
