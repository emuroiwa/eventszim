<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Ticketbook Email</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<style>
	.customers {
		font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		border-collapse: collapse;
		width: 100%;
	}
	
	.customers td, .customers th {
		border: 1px solid whitesmoke;
		padding: 8px;
	}
	
	.customers th {background-color: grey;}
	
	
	.customers th {
		padding-top: 12px;
		padding-bottom: 12px;
		text-align: left;
		background-color: ;
		
	}
	  
	  .gm58-td {
		color: red; font-family: "Trebuchet MS", Arial, Helvetica, sans-serif; font-size: 16px;
	  }
</style>
<body style="margin: 0; padding: 0;">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">	
		<tr>
			<td style="padding: 10px 0 30px 0;">
				<table align="center" border="0" cellpadding="0" cellspacing="0" width="850" style="border: 1px solid #cccccc; border-collapse: collapse;">
					<tr>
						<td align="center">
		
							<img src="https://ticketbook.co.zw/img/email/emailheader.jpg" alt="Ticketbook" width="100%" height="230" style="display: block;"/>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff" style="padding: 40px 30px 40px 30px;">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">

								<tr>
									<td style="color: #153643; font-family: Arial, sans-serif; font-size: 14px;">
										<b>Hi {{ $data2["client_name"] }} </b>
									</td>
								</tr>
								<tr>
									<td style="padding: 20px 0 0 0; color: #153643; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;">
											Thank you for using Ticketbook, 
											@if(isset($data1))
												<b>kindly find attached your tickets.</b>
											@endif
									</td>
								</tr>
								@if(isset($data1))
									<tr>
										<td style="padding: 20px 0 30px 0; color: #153643; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;">
											
											The total cost of the transaction has been debited from your account. Details of your booking appear below. Please check all details carefully, especially dates, times, venues and quantities. If the ticket details are incorrect, please phone our call centre on  +263774366481.
										</td>
									</tr>
								@endif
								<tr>
									<td>
									
										@if(isset($data1))
											{{--  <table border="1" style="border: 1px solid black;" class="customers" cellpadding="0" cellspacing="0" width="100%">
												<tr  bgcolor="#ee4c50">
													<th>Ticket Reference</th>
													<th>Marathon</th>
													<th>Fullname</th>
													<th>Contact</th>
													<th>Race</th>
													<th>Race Pickup</th>
													<th>Race Category</th>
													<th>Cost</th>

												</tr>
												@foreach($data1 as $ticketdetail)
													<tr>
														<td>{{ $ticketdetail->order_ref }}</td>
														<td>{{ $ticketdetail->event_name }}</td>
														<td>{{ $ticketdetail->fullname }}</td>
														<td>{{ $ticketdetail->contact }}</td>
														<td>{{ $ticketdetail->marathon_type }}</td>
														<td>{{ $ticketdetail->marathon_pickup }}</td>
														<td>{{ $ticketdetail->description }}</td>
														<td>{{ $ticketdetail->price_zwl }}</td>
										
												
													</tr>
												@endforeach
											</table>  --}}
										@else	
											<p style="padding: 20px 0 30px 0; color: #153643; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;">
												You made an attempt to purchase a ticket(s). However on this specific attempt we did not receive the payment. Please ignore this email if you later made a payment as another email will follow with your ticket(s).
											</p>
										@endif
									</td>
								</tr>
								<td style="padding: 20px 0 30px 0; color: red; font-family: Arial, sans-serif; font-size: 9px; line-height: 20px;">
									PLEASE NOTE: Tickets booked cannot be cancelled, changed or refunded.
								</td>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ee4c50" style="padding: 30px 30px 30px 30px;">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td style="color: #ffffff; font-family: Arial, sans-serif; font-size: 14px;" width="75%">
										&reg; HypeNation Investments Private LTD<br/>
									
									</td>
									<td align="right" width="25%">
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td style="font-family: Arial, sans-serif; font-size: 12px; font-weight: bold;">
													<a href="http://www.twitter.com/ticketbookzw" style="color: #ffffff;">
														<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/tw.gif" alt="Twitter" width="38" height="38" style="display: block;" border="0" />
													</a>
												</td>
												<td style="font-size: 0; line-height: 0;" width="20">&nbsp;</td>
												<td style="font-family: Arial, sans-serif; font-size: 12px; font-weight: bold;">
													<a href="http://www.twitter.com/ticketbookzw" style="color: #ffffff;">
														<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/fb.gif" alt="Facebook" width="38" height="38" style="display: block;" border="0" />
													</a>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								
							</table>
						</td>
						<tr>
							<td style="padding: 20px 20px 30px 20px; color: grey; font-family: Arial, sans-serif; font-size: 8px; line-height: 20px;">
								Disclaimer: 1) Confidentiality: This email, sent from INFO@TICKETBOOK.CO.ZW to {{ $data2["email"] }}   , is confidential and may contain privileged or copyright information. You may not present this message to another party without consent from the sender If you are not {{ $data2["email"] }}  please notify INFO@TICKETBOOK.CO.ZW and delete this email, and you are notified that disclosing, copying, distributing or taking any action in reliance on the contents of this information is strictly prohibited. 2) Liability: This email is not a binding agreement and does not conclude an agreement without the express confirmation by the sender's superior or a director of the Company. 3) Viruses: The Company does not certify that this email is free of viruses or defects. 4) Requested: The Company does not consent to its employees sending un-asked for emails which contravene the law. In the event that you feel this email is such, please notify the Company in order for the appropriate corrective action to be taken. 5) Advice: Any views or opinions presented in this email are solely those of the author and do not necessarily represent those of the company. Any actions taken on the basis of this email are at the reader's own risk. 6) Other: The sender of this email is expressly required not to make any defamatory statements. Any such communication is contrary to company policy and outside the scope of the employment of the individual concerned. The company will not accept any liability in respect of such communication, and the employee responsible will be personally liable for any damages or other liability arising.
							</td>
						</tr>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>