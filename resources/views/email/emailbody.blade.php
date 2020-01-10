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
				<table align="center" border="0" cellpadding="0" cellspacing="0" width="700" style="border: 1px solid #cccccc; border-collapse: collapse;">
					<tr>
						<td align="center">
		
							<img src="{{url('/img/email/emailheader.jpg')}}" alt="Creating Email Magic" width="100%" height="230" style="display: block;"/>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff" style="padding: 40px 30px 40px 30px;">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">

								<tr>
									<td style="color: #153643; font-family: Arial, sans-serif; font-size: 14px;">
										<b>Hi </b>
									</td>
								</tr>
								<tr>
									<td style="padding: 20px 0 30px 0; color: #153643; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;">
											Thank you for using Ticketbook,
									</td>
								</tr>
								<tr>
									<td style="padding: 20px 0 30px 0; color: #153643; font-family: Arial, sans-serif; font-size: 14px; line-height: 20px;">
										The total cost of the transaction has been debited from your account. Details of your booking appear below. Please check all details carefully, especially dates, times, venues and quantities. If the ticket details are incorrect, please phone our call centre on 0861 915 4000 (calls charged at 65 cent per minute).
									</td>
								</tr>
								<tr>
									<td>
										<table border="0" class="customers" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<th>Ticket Reference</th>
												<th>Ticket Details</th>
												<th>Number of tickets</th>
												<th>Cost</th>

											</tr>
											<tr>
												<td  class="gm58-td">Ticket Reference</td>
												<td class="gm58-td">Ticket Details</td>
												<td class="gm58-td">Number of tickets</td>
												<td class="gm58-td">Cost</td>

											</tr>
										</table>
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
										&reg; GM58 Investments PTY LTD<br/>
									
									</td>
									<td align="right" width="25%">
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td style="font-family: Arial, sans-serif; font-size: 12px; font-weight: bold;">
													<a href="http://www.twitter.com/" style="color: #ffffff;">
														<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/tw.gif" alt="Twitter" width="38" height="38" style="display: block;" border="0" />
													</a>
												</td>
												<td style="font-size: 0; line-height: 0;" width="20">&nbsp;</td>
												<td style="font-family: Arial, sans-serif; font-size: 12px; font-weight: bold;">
													<a href="http://www.twitter.com/" style="color: #ffffff;">
														<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/fb.gif" alt="Facebook" width="38" height="38" style="display: block;" border="0" />
													</a>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>