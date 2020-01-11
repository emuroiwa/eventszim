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
        <img style="width: 30px;" height="20px" src="{{ public_path('img/gm58.png') }}">
        {{ env('APP.APP_NAME') }}
    </div>
    {{--  Footer image  --}}
    <div id="footer-img">
        <img style="width: 90px;" height="40px" src="{{ public_path('img/gm58payroll.png') }}">

    </div>
    {{--  Header  --}}
    <div class="container1">
        <div class="header">
            <div class="row">
                <div class="column">
                    <p><b>{{$company->trading_name}}</b>
                        <br/> {{$company->address}} {{$company->street}},
                        <br/> {{$company->suburb}}
                        <br/> {{$company->city}}
                    </p>
                </div>
                <div class="column">
                    <b>Payment Date</b> {{$payPeriod->pay_date}}
                </div>
                <div class="column">
                    <img style="width: 50px;float: right" height="50px" src="{{ public_path('img/logo.png') }}">
    
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <table>
                        <tr>
                            <td>
                                <b>Employee</b>
                            </td>
                            <td>
                                {{$employee->first_names}} {{$employee->last_names}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Job title</b>
                            </td>
                            <td>
                                {{$employee->job_title}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Emp Number</b>
                            </td>
                            <td>
                                {{$employee->employee_number}}
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <b>Email</b>
                            </td>
                            <td>
                                {{$employee->email}}
                            </td>
                        </tr>
                        
                    </table>
                </div>

                <div class="column">
                    <table>
                        <tr>
                            <td>
                                <b>ID/Passport Number</b>
                            </td>
                            <td>
                                {{$employee->id_number}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Employeed From</b>
                            </td>
                            <td>
                                {{$employee->doa}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Grade</b>
                            </td>
                            <td>
                                {{$employee->grade}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Rate Per hour</b>
                            </td>
                            <td>
                                {{$hoursRate->rate_per_hour}}
                            </td>
                        </tr>
                        
                    </table>
                </div>
                <div class="column">
                    <table>
                        <tr>
                            <td>
                                <b>Bank</b>
                            </td>
                            <td>
                                <b>{{$employee->bank}}</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Account Number</b>
                            </td>
                            <td>
                                {{$employee->account_number}}
                            </td>
                        </tr>
                                            
                    </table>
                </div>
            </div>
        </div>
        {{--  container  --}}
        <div class="container">
            <br>
            <table cellspacing="0" style="width: 99.7%;  border-bottom: 1px solid black;  border-top: 1px solid black;">
                <thead>
                    <tr style="height: 20px">
                        <td width="30%" height="20px"><b>Earnings</b></td>
                        <td width="10%"><b>Units</b></td>
                        <td width="10%"  align="right"><b>Amount</b></td>
                        <td width="30%"><b>Deductions</b></td>
                        <td width="10%"><b>Opening Balance</b></td>
                        <td width="10%"  align="right"><b>Amount</b></td>
                    </tr>
                </thead>
            </table>
            {{--  Earnings  --}}
            <table  class="floatedTable general-width">
                <tbody>
                    {{$sum_earnings = 0}}
                    @foreach ($transactions as $transaction)
                            @if ($transaction->transaction=="earnings")
                                <tr>
                                    <td width="30%">{{ $transaction->default_description }}</td>

                                    @if ($transaction->units_type=="" || $transaction->name=="bonus" )
                                        <td width="10%"></td>
                                    @else 
                                        <td width="10%">{{ number_format($transaction->units,2) }}</td>
                                    @endif

                                    <td width="10%" align="right">{{ number_format($transaction->amount,2) }}</td>
                                </tr>
                                {{$sum_earnings+=$transaction->amount}}
                            @endif
                    @endforeach
                    @if ($rows_earnings<$rows_deductions)
                        @for ($i = 0; $i < $rows_deductions-$rows_earnings; $i++)     
                            <tr>
                                <td>&nbsp; </td>
                                <td>&nbsp; </td>
                                <td>&nbsp; </td>
                            </tr>
                        @endfor
                    @endif
                    <tr style="background-color: #eeeeee;">
                        <td><b>Total Earnings</b></td>
                        <td></td>
                        <td align="right"><b>{{ number_format($sum_earnings,2) }}</b></td>
                        
                    </tr>

                    <tr>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                    </tr>

                     {{--  Fringe Benefits  --}}
                        {{--  blank row  --}}
                    <tr>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                    </tr>
                    <tr  class="border_bottom">
                            <td><b>Company contributions</b></td>
                            <td></td>
                            <td><b>Amount</b></td>
                    </tr>

                    @foreach ($transactions as $transaction)
                        @if ($transaction->transaction=="company_contributions")
                            <tr>
                                <td width="30%">{{ $transaction->default_description }}</td>
                                <td width="10%"></td>
                                <td width="10%" align="right">{{ number_format($transaction->amount,2) }}</td>
                            </tr>
                        @endif
                    @endforeach
                    <tr  class="border_bottom">
                        <td><b>Fringe Benefits</b></td>
                        <td></td>
                        <td><b>Amount</b></td>
                    </tr>
                    @foreach ($transactions as $transaction)
                        @if ($transaction->transaction=="fringe_benefits")
                            <tr>
                                <td width="30%">{{ $transaction->default_description }}</td>
                                <td width="10%"></td>
                                <td width="10%" align="right">{{ number_format($transaction->amount,2) }}</td>
                            </tr>
                        @endif
                    @endforeach
                  
                </tbody>
            </table>
            {{--  Deductions  --}}
            <table  class="floatedTable general-width">
                <tbody>
                          
                    {{$sum_deductions = 0 }}
                    @foreach ($transactions as $transaction)
                        @if ($transaction->transaction=="deductions")
                            <tr>
                                <td width="30%">{{ $transaction->default_description }}</td>
                                <td width="10%"> </td>
                                <td width="10%" align="right">{{ number_format($transaction->amount,2) }}</td>
                            </tr>
                            {{$sum_deductions+=$transaction->amount}}
                                </tr>
                            @endif
                    @endforeach
                    
                    {{--  blank row  --}}

                    @if ($rows_earnings > $rows_deductions)
                        @for ($i = 0; $i < $rows_earnings-$rows_deductions; $i++)     
                            <tr>
                                <td>&nbsp; </td>
                                <td>&nbsp; </td>
                                <td>&nbsp; </td>
                            </tr>
                        @endfor
                    @endif
                    
                    <tr style="background-color: #eeeeee;">
                        <td><b>Total Deductions</b></td>
                        <td></td>
                        <td align="right"><b>{{ number_format($sum_deductions,2) }}</b></td>
                        
                    </tr>
                     <tr style="background-color: #A9A9A9;">
                        <td width="30%"><b>Net pay</b></td>
                        <td width="10%"></td>
                        <td width="10%" align="right"><b>{{ number_format($sum_earnings-$sum_deductions,2) }}</b></td>
                        
                    </tr>
        
                    {{--  YTD totals  --}}
                        {{--  blank row  --}}
                    <tr>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                    </tr>

                    <tr  class="border_bottom">
                        <td><b>YTD Totals</b></td>
                        <td></td>
                        <td><b>Amount</b></td>
                        
                    </tr>

                    {{$sum_ytd_earnings = 0 }}
                    {{$sum_ytd_company_contributions = 0 }}
                    {{$sum_ytd_tax = 0 }}
                    {{$sum_ytd_fringe = 0 }}
                    @foreach ($YTDTotals as $YTDTotal)
                        @if ($YTDTotal->transaction=="earnings")
                            {{$sum_ytd_earnings+=$YTDTotal->totals}}
                        @endif
                        @if ($YTDTotal->transaction=="company_contributions")
                            {{$sum_ytd_company_contributions+=$YTDTotal->totals}}
                        @endif
                        @if ($YTDTotal->name=="paye")
                            {{$sum_ytd_tax+=$YTDTotal->totals}}
                        @endif
                        @if ($YTDTotal->transaction=="fringe_benefits")
                            {{$sum_ytd_fringe+=$YTDTotal->totals}}
                        @endif

                    @endforeach
                        <tr>
                            <td width="30%"><b>Taxable earnings</b></td>
                            <td width="10%"> </td>
                            <td width="10%" align="right"><b>{{ number_format($sum_ytd_earnings,2) }}</b></td>
                        </tr>
                        <tr>
                            <td width="30%"><b>Taxable Company contributions</b></td>
                            <td width="10%"></td>
                            <td width="10%" align="right"><b>{{ number_format($sum_ytd_company_contributions,2) }}</b></td>
                        </tr>
                        <tr>
                            <td width="30%"><b>Taxable Fringe benefits</b></td>
                            <td width="10%"></td>
                            <td width="10%" align="right"><b>{{ number_format($sum_ytd_fringe,2) }}</b></td>
                        </tr>
                        <tr>
                            <td width="30%"><b>Tax paid</b></td>
                            <td width="10%"></td>
                            <td width="10%" align="right"><b>{{ number_format($sum_ytd_tax,2) }}</b></td>
                        </tr>

                        {{--  Leave Data --}}
                    <tr>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                        <td>&nbsp; </td>
                    </tr>

                    <tr  class="border_bottom">
                        <td><b>Leave type</b></td>
                        <td></td>
                        <td><b> Balance</b></td>
                        
                    </tr>
                    <tr>
                        <td width="30%"><b>Annual Leave</b></td>
                        <td width="10%"></td>
                        <td width="10%">{{$leaveTaken[0]->closing_balance}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>

</html>