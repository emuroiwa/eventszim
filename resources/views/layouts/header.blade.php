<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>



    @include('meta::manager',
    [
        'title'         => 'Ticketbook Online tickets and events',
        'referrer'      =>  'origin',
        'description'   => 'Ticketbook offers the most secure and reliable ticketing and e-commerce platform in Zimbabwe.Ecocash,Telecash,Vpayments,Visa and Mastercard are all Accepted.PPC Matopos Marathon Ticketbook, Old Mutual Zimbabwe Marathon, PPC Matopos Marathon Ticketbook',
        'keywords'      =>  'PPC Matopos Marathon,webtickets, PPC Matopos Marathon Ticketbook, webticket, online ticketing, online tickets, e-tickets, etickets, ticket, tickets, ticketing, buy tickets, ticket system, sell tickets, ticketing system, ticketing agent, ticket agent, ticket sales agent, rapid tickets, itickets, ClicknPay,Ticketing,Ticket,e-commerce,e-ticketing,event,music,events,ClicknPay Zimbabwe,clicknpay, ticketing , event accreditation, ticketing partner',
    ])
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta name="apple-mobile-web-app-title" content="ticketbook">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

       <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <link rel="icon" href="{{ url('img/favicon.ico') }}">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <!-- Styles -->
    
</head>
<body>
   
