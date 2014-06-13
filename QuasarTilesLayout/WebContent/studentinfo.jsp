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
	width: 500px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	padding: 4px;
	margin: 4px;
	overflow: hidden;
	margin: 4px;
	border: 1.5px solid #ccc;
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

		<div
			style="width: 600px; border: 1px #ff00ff solid; background-color:white;">
			<!-- Table for Student Basic  and546874561 Fee Details -->
			<table width="100%">
				<tr>
					<td align="left" width="45%"><div>
							BasicDetails <br> Name:
							<s:property value="#x.name" />
							<br> EmailID :
							<s:property value="#x.emailId" />
							<br> Contact Number:
							<s:property value="#x.contactNumber" />
							<br>

						</div></td>
					<td width="45%" align="left"><div>
							Fee Deatils <br> Course Fee:
							<s:property value="#x.feeDetails.courseFees" />
							<br> Service Tax :
							<s:property value="#x.feeDetails.serviceTax" />
							<br> Fine:
							<s:property value="#x.feeDetails.fine" />
							<br> Discount Available:
							<s:property value="#x.feeDetails.discountAvailable" />
							<br> Total Fee:
							<s:property value="#x.feeDetails.totalFee" />
							<br>
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
			<table width="100%">
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

							<br>Proposed Amount
							<%=proposedAmount%>
							<br>Proposed Date
							<%=depositedAmount%>
							<br>Paid Amount
							<%=proposedDate%>
							<br>Payment Amount
							<%=paymentDate%>

						</div></td>
					<td><div>

							<%
								//Checking for Mode of Payment
									PaymentMode pm = p.getPaymentMode();

									if (pm instanceof CashMode) {

										out.println("<b> Payment Mode : Cash Mode <b>");

										CashMode cm = (CashMode) pm;
										out.println("<br> Cash Amount " + cm.getCashAmount());
										out.println("<br> Cash Details ");

										for (Note n : cm.getCashDetail().keySet()) {
											out.println("<br> " + n + "  : "
													+ cm.getCashDetail().get(n));
										}

									} else if (pm instanceof DDMode) {
										out.println("<b> Payment Mode : DD Mode<b>");

										DDMode ddm = (DDMode) pm;
										out.println("<br> Bank Name " + ddm.getBankName());
										out.println("<br> DD Number " + ddm.getDDNumber());
										out.println("<br> DD Expiry Date " + ddm.getDdExpiryDate());
										out.println("<br> DD Issue Date " + ddm.getIssueDate());

									} else if (pm instanceof ChequeMode) {
										out.println("<b> Payment Mode : Cheque Mode<b>");

										ChequeMode chqm = (ChequeMode) pm;
										out.println("<br> Bank Name " + chqm.getBankName());
										out.println("<br> Cheque Number " + chqm.getChequeNumber());
										out.println("<br> Cheque Status " + chqm.getChequeStatus());
										out.println("<br> Cheque Expiry Date "
												+ chqm.getExpriyDate());
										out.println("<br>Cheque Issue Date " + chqm.getIssueDate());

									} else if (pm instanceof CardMode) {
										out.println("<b> Payment Mode : Card  Mode <b>");

										CardMode crdm = (CardMode) pm;
										out.println("<br> Card Number  " + crdm.getCardNumber());
										out.println("<br> Transaction ID "
												+ crdm.getTransactionID());
										out.println("<br> Card Expiry Date  "
												+ crdm.getCardExpiryDate());

									} else if (pm instanceof OnlineMode) {
										out.println("<b> Payment Mode : Online Mode <b>");

										OnlineMode om = (OnlineMode) pm;
										out.println("<br> Reiciept Number  "
												+ om.getRecieptNumber());
										out.println("<br> Transaction ID " + om.getTrasactionID());

									} else {

									}
							%>


						</div></td>
				</tr>
			</table>
			<br>
			<br>


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
