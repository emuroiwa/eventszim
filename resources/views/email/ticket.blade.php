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
        font-size: 20px;
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
    <div id="watermark">
        <img style="width: 30px;" height="20px" src="{{ public_path('img/logo.png') }}">
        {{ env('APP.APP_NAME') }}
    </div>
    {{--  Footer image  --}}
    <div id="footer-img">
        <img style="width: 90px;" height="40px" src="{{ public_path('img/gm58payroll.png') }}">

    </div>
    {{--  Header  --}}
    <div class="container1">
        {{--  container  --}}
        <div class="container">
            <br>
            <table cellspacing="0" style="width: 99.7%;  border-bottom: 1px solid black;  border-top: 1px solid black;">
                <thead>
                    <tr style="height: 20px">
                        <td width="60%" height="20px">
                            <img style="width: 30px;" height="20px" src="{{ public_path('img/slide/mobile/ppc_marathon_mobile.jpg') }}">
                        </td>
                        <td width="20%">
                            <h1>VIP Access</h1>
                        </td>
                        <td width="20%"  align="right">
                            {!!DNS2D::getBarcodeHTML("1578163443", "QRCODE")!!}
                        </td>
                       
                    </tr>
                </thead>
            </table>
        </div>
    </div>

</body>

</html>