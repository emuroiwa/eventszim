<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
</head>
<style>
    #watermark {
        position: fixed;
        top: 45%;
        width: 100%;
        text-align: center;
        opacity: .3;
        {{--  transform: rotate(10deg);  --}}
        transform-origin: 50% 50%;
        z-index: -1000;
 
      }
      #logo-watermark {

        text-align: center;
        opacity: .3;
        {{--  transform: rotate(10deg);  --}}
        transform-origin: 50% 50%;
        z-index: -1000;
      }
    #footer-img {
        position: fixed;
        bottom: 0;
        width: 100%;
        text-align: right;
        {{--  transform: rotate(10deg);  --}}
        transform-origin: 50% 50%;
        z-index: -1000;
        font-size: 20px;
      }
    .header{
        font-size: 12px;
    }
    .floatedTable {
        float:left;
    }
    .general-width{
        width: 49.9%;
    }
    td {
        /* border-bottom: 1px solid #ddd; */
        margin: 5px;
    }
    body{
        font-family: "Google Sans", Roboto, arial, sans-serif;
        font:12px  "Google Sans", Roboto, arial, sans-serif;
    }
    * {
        box-sizing: border-box;
    }
    .container{
        min-height: 297mm;
    }
    .leave{
        padding-top: 150px;
    }
    footer {
        display: flex;
        justify-content: center;
        padding: 5px;
        /* background-color: #45a1ff; */
        /* color: #fff; */
    }
    .ytd-row{
        padding-top: 175px;
    }
    .column {
        float: left;
        width: 33.33%;
        padding-top: 2px;
        max-height: 200px;
        /* Should be removed. Only for demonstration */
    }
    /* Clear floats after the columns */
    
    .row:after {
        content: "";
        display: table;
        clear: both;
    }
    tr.border_bottom td {
        border-top:1pt solid black;
        border-bottom:1pt solid black;
      }
</style>

<body>
    {{--  watermark  --}}
    {{--  <div id="watermark">
        <img style="width: 30px;" height="20px" src="{{ public_path('img/logo.png') }}">
        {{ env('APP.APP_NAME') }}
    </div>  --}}
    {{--  Footer image  --}}
    <div id="footer-img">
        <img style="width: 90px;" height="40px" src="{{ public_path('img/logo.png') }}">

    </div>
    {{--  Header  --}}
    <div class="container1">
        {{--  container  --}}
        <div class="container">
            <br>
            {{$ticketNo = 0}}
            @foreach ($data1 as $ticketdetail)
                <table cellspacing="0" style="width: 90%;  border-bottom: 1px solid black; margin-bottom:15px">
                    <thead>
                        <tr style="height: 20px">
                            <td width="60%" height="20px">
                                <img style="width: 300px;" height="260px" src="{{ public_path($ticketdetail->event_ticket_img) }}">
                            </td>
                            <td width="40%">
                                <h3>{{ $ticketdetail->description }}</h3>
                                <h3>{{ $ticketdetail->event_name }}</h3>
                                <p>{{ $ticketdetail->fullname }}<br>
                                {{ $ticketdetail->contact }}<br>
                                {{ $ticketdetail->marathon_type }}<br>
                                {{ $ticketdetail->marathon_pickup }}</p>
                                <div id="logo-watermark">
                                    <img style="width: 30px;" height="20px" src="{{ public_path('img/logo.png') }}">
                                    <p> Have your ticket ready for scanning </p>
                                    <h4> T and Cs Apply</h4>
                                </div>
                                
                            </td>
                            <td width="20%"  align="right">
                                <div class="qr-code">
                                    {!!DNS2D::getBarcodeHTML($ticketdetail->order_ref.$ticketNo, "QRCODE")!!}
                                    <h3>ADMIT ONE</h3>
                                    <small>{{ $ticketdetail->order_ref.$ticketNo }}</small>
                                </div>
                            </td>
                        
                        </tr>
                    </thead>
                </table>
                {{$ticketNo++}}
            @endforeach
        </div>
    </div>

</body>

</html>