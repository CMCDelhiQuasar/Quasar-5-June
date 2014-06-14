<%@page import="com.cmcdelhi.quasar.paymentDetails.FullFeePayment"%>
<%@page import="com.cmcdelhi.quasar.payMode.OnlineMode"%>
<%@page import="com.cmcdelhi.quasar.payMode.CardMode"%>
<%@page import="javax.smartcardio.Card"%>
<%@page import="com.cmcdelhi.quasar.payMode.ChequeMode"%>
<%@page import="com.cmcdelhi.quasar.payMode.DDMode"%>
<%@page import="com.cmcdelhi.quasar.payMode.CashMode"%>
<%@page import="com.cmcdelhi.quasar.payMode.Note"%>
<%@page import="com.cmcdelhi.quasar.payMode.PaymentMode"%>
<%@page import="com.cmcdelhi.quasar.paymentDetails.RegistrationPayment"%>
<%@page
	import="com.cmcdelhi.quasar.paymentDetails.InstallmentPayment,
	com.cmcdelhi.quasar.student.Student,
	java.util.List,com.cmcdelhi.quasar.paymentDetails.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#box {
	/*background-color: #F7F7F9; */
	background: linear-gradient(0deg, #FFFFFF 8%, #EBF3FA 75%);
	background: -moz-linear-gradient(0deg, #FFFFFF 8%, #EBF3FA 75%);
	background: -webkit-linear-gradient(0deg, #FFFFFF 8%, #EBF3FA 75%);
	background: -o-linear-gradient(0deg, #FFFFFF 8%, #EBF3FA 75%);
	padding: 20px;
	margin: 20px 0px;
	width: 700px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	padding: 4px;
	margin: 4px;
	overflow: hidden;
	margin: 4px;
	border: 1.5px solid #1568b4;;
	font-family: sans-serif;
	font-size: medium;
	font-weight: bolder;
}
</style>
<sj:head jqueryui="true" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quasar Student Information</title>

</head>
<body>

	<h2>Welcome to student info page...</h2>

	<center>
		<s:set name="x" value="student" />

		<div id="box">
			<!-- Table for Student Basic  and546874561 Fee Details -->
			<table border="0" width="100%">
				<tr>
					<td width="45%"><div>
							<table border="0" width="100%">
								<tr bgcolor="#EBF3FA">
									<td align="left">BasicDetails</td>
								</tr>
								<tr>
									<td width="50%">Name</td>
									<td style="font-weight: bold;"><s:property value="#x.name" /></td>
								</tr>
								<tr>
									<td width="50%">EmailID</td>
									<td style="font-weight: bold;"><s:property
											value="#x.emailId" /></td>
								</tr>
								<tr>
									<td width="50%">Contact Number</td>
									<td style="font-weight: bold;"><s:property
											value="#x.contactNumber" /></td>
								</tr>

							</table>
						</div></td>
					<td width="45%" align="left"><div>
							<table border="0" width="100%">
								<tr bgcolor="#EBF3FA">
									<td>Fee Details</td>
								</tr>
								<tr>
									<td>Course Fee</td>
									<td style="font-weight: bold;"><s:property
											value="#x.feeDetails.courseFees" /></td>
								</tr>
								<tr>
									<td>Service Tax</td>
									<td style="font-weight: bold;"><s:property
											value="#x.feeDetails.serviceTax" /></td>
								</tr>
								<tr>
									<td>Fine</td>
									<td style="font-weight: bold;"><s:property
											value="#x.feeDetails.fine" /></td>
								</tr>
								<tr>
									<td>Discount Available</td>
									<td style="font-weight: bold;"><s:property
											value="#x.feeDetails.discountAvailable" /></td>
								</tr>
								<tr>
									<td>Total Fee</td>
									<td style="font-weight: bold;"><s:property
											value="#x.feeDetails.totalFee" /></td>
								</tr>

							</table>
						</div></td>
					<td width="10%" align="right">Icons <a
						style="text-decoration: none;"
						href="getPDF?emailid=<s:property value="#x.emailId"/>">Print</a>
					</td>
				</tr>
			</table>

			<%
				Student stu = (Student) request.getAttribute("student");

				for (Payment p : stu.getPaymentsList()) {
			%>
			<!-- Table for Payment Details -->
			<!--Every payment will have a specific table -->
			<table width="100%" border="0">
				<tr bgcolor="#EBF3FA">

					<%
						String paymentType = "";
							String paymentId = "";
							String paymentStatus = "";

							if (p instanceof RegistrationPayment) {

								RegistrationPayment rp = (RegistrationPayment) p;

								paymentType = "Registration Payment";
								paymentId = "" + rp.getPaymentID();
								paymentStatus = "" + rp.getPaymentStatus();

							} else if (p instanceof FullFeePayment) {
								FullFeePayment ffp = (FullFeePayment) p;

								paymentType = "Fullfee Payment";
								paymentId = "" + ffp.getPaymentID();
								paymentStatus = "" + ffp.getPaymentStatus();

							} else if (p instanceof InstallmentPayment) {

								InstallmentPayment ip = (InstallmentPayment) p;

								paymentType = "Installment Payment";
								paymentId = "" + ip.getPaymentID();
								paymentStatus = "" + ip.getPaymentStatus();

							} else {

							}
					%>


					<td align="left"><%=paymentType%> , <%=paymentId%></td>
					<td align="right"><%=paymentStatus%> <a
						href="perpareDuePayment?paymentId=<%=p.getPaymentID()%>">PAY
							NOW </a></td>
				</tr>
				<tr>
					<td><div>

							<%
								String proposedAmount = "";
									String depositedAmount = "";
									String proposedDate = "";
									String paymentDate = "";

									proposedAmount = "" + p.getPaymentDetails().getProposedAmount();
									depositedAmount = ""
											+ p.getPaymentDetails().getDepositedAmount();
									proposedDate = "" + p.getPaymentDetails().getProposedDate();
									if (p.getPaymentDetails().getPaymentDate() != null) {
										paymentDate = "" + p.getPaymentDetails().getPaymentDate();
									} else {
										paymentDate = "N/A";
									}
							%>
							<table width="100%" border="0">
								<tr>
									<td width="50%">Proposed Amount</td>
									<td style="font-weight: bold;"><%=proposedAmount%></td>
								</tr>
								<tr>
									<td>Proposed Date</td>
									<td style="font-weight: bold;"><%=depositedAmount%></td>
								</tr>
								<tr>
									<td>Paid Amount</td>
									<td style="font-weight: bold;"><%=proposedDate%></td>
								</tr>
								<tr>
									<td>Payment Amount</td>
									<td style="font-weight: bold;"><%=paymentDate%></td>
								</tr>
							</table>
						</div></td>
					<td><div>

							<%
								//Checking for Mode of Payment
									PaymentMode pm = p.getPaymentMode();

									if (pm instanceof CashMode) {

										out.println("<table border='0' width='100%' ><tr><td> Payment Mode </td> <td style='font-weight: bold;'> Cash Mode</td></tr>");

										CashMode cm = (CashMode) pm;
										out.println("<tr><td> Cash Amount <td><td style='font-weight: bold;'> "
												+ cm.getCashAmount() + "</td></tr>");
										out.println("<tr><td> Cash Details </td><td></td></tr>");

										for (Note n : cm.getCashDetail().keySet()) {
											out.println("<tr><td> " + n
													+ " </td> : <td style='font-weight: bold;'>"
													+ cm.getCashDetail().get(n) + "</td></tr>");
										}
										out.println("</table>");
									} else if (pm instanceof DDMode) {
										out.println("<table border='0' width='100%' ><tr><td> Payment Mode </td> <td style='font-weight: bold;'> DD Mode</td></tr>");

										DDMode ddm = (DDMode) pm;
										out.println("<tr><td>Bank Name </td><td style='font-weight: bold;'>"
												+ ddm.getBankName() + "</td></tr>");
										out.println("<tr><td> DD Number </td><td style='font-weight: bold;'>"
												+ ddm.getDDNumber() + "</td></tr>");
										out.println("<tr><td> DD Expiry Date </td><td style='font-weight: bold;'>"
												+ ddm.getDdExpiryDate() + "</td></tr>");
										out.println("<tr><td> DD Issue Date </td><td style='font-weight: bold;'>"
												+ ddm.getIssueDate() + "</td></tr></table>");

									} else if (pm instanceof ChequeMode) {
										out.println("<table border='0' width='100%' ><tr><td> Payment Mode </td> <td style='font-weight: bold;'> Cheque Mode</td></tr>");

										ChequeMode chqm = (ChequeMode) pm;
										out.println("<tr><td> Bank Name </td><td style='font-weight: bold;'>"
												+ chqm.getBankName() + "</td></tr>");
										out.println("<tr><td> Cheque Number </td><td style='font-weight: bold;'>"
												+ chqm.getChequeNumber() + "</td></tr>");
										out.println("<tr><td> Cheque Status </td><td style='font-weight: bold;'>"
												+ chqm.getChequeStatus() + "</td></tr>");
										out.println("<tr><td> Cheque Expiry Date </td><td style='font-weight: bold;'>"
												+ chqm.getExpriyDate() + "</td></tr>");
										out.println("<tr><td>Cheque Issue Date </td><td style='font-weight: bold;'>"
												+ chqm.getIssueDate() + "</td></tr></table>");

									} else if (pm instanceof CardMode) {
										out.println("<table border='0' width='100%' ><tr><td> Payment Mode </td> <td style='font-weight: bold;'> Card  Mode </td></tr>");

										CardMode crdm = (CardMode) pm;
										out.println("<tr><td> Card Number </td><td style='font-weight: bold;'>"
												+ crdm.getCardNumber() + "</td></tr>");
										out.println("<tr><td>Transaction ID </td><td style='font-weight: bold;'>"
												+ crdm.getTransactionID() + "</td></tr>");
										out.println("<tr><td> Card Expiry Date </td><td style='font-weight: bold;'> "
												+ crdm.getCardExpiryDate() + "</td></tr></table>");

									} else if (pm instanceof OnlineMode) {
										out.println("<table border='0' width='100%' ><tr><td> Payment Mode </td> <td style='font-weight: bold;'>Online Mode </td></tr>");

										OnlineMode om = (OnlineMode) pm;
										out.println("<tr><td> Reiciept Number </td><td style='font-weight: bold;'>"
												+ om.getRecieptNumber() + "</td></tr>");
										out.println("<tr><td> Transaction ID </td><td style='font-weight: bold;'>"
												+ om.getTrasactionID() + "</td></tr></table>");

									} else {

									}
							%>


						</div></td>
				</tr>
			</table>
			<br> <br>


			<%
				}
			%>


			<!-- Table for Payment Details -->
			<!--Every payment will have a specific table -->
			<h1>Dummy Tabble</h1>
			<hr>
			<table width="100%" border="1">
				<tr bgcolor="yellow">
					<td align="left">Registration Details</td>
					<td align="right">PAID</td>
				</tr>
				<tr>
					<td><div>Contains Payment Det</div></td>
					<td><div>Contains Payment Mode DEt</div></td>
				</tr>
			</table>

		</div>
	</center>





</body>
</html>
