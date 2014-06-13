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

	<div align="center" style="width: 500px;">

		<s:set name="x" value="student" />

		<hr style="padding: 0px; margin: 4px;">
		<hr style="padding: 0px; margin: 4px;">
		<table id="test" border="0" width="" height="50px">
			<tr style="height: 10px;">
				<td width="550"></td>
				<td colspan="1">
					<h3>Basic Details Of Student</h3>
				</td>

				<td align="right" width="100"><a style="text-decoration: none;"
					href="getPDF?emailid=<s:property value="#x.emailId" />">Print</a></td>
			</tr>
		</table>
		<hr style="padding: 0px; margin: 4px;">
		<hr style="padding: 0px; margin: 4px;">
		<table border="0">
			<tr>
				<td><b>Name:-</b></td>
				<td align="right" width="100"><s:property value="#x.name" /></td>
			</tr>

			<tr>
				<td><b>Email:-</b></td>
				<td align="right" width="100"><s:property value="#x.emailId" /></td>
				<s:set var="email" value="#x.emailId" />
			</tr>

			<tr>
				<td><b>Contact:-</b></td>
				<td align="right" width="100"><s:property
						value="#x.contactNumber" /></td>
			</tr>
		</table>

		<hr>
		<hr>
		<table>
			<tr>
				<td width="550"></td>
				<td colspan="2">
					<h3>Fee Details Of Student</h3>
				</td>
			</tr>
		</table>
		<hr>
		<hr>
		<table border="0">
			<tr>
				<td><b>Course Fee:-</b></td>
				<td align="right" width="100"><s:property
						value="#x.feeDetails.courseFees" /></td>
			</tr>

			<tr>
				<td><b>Service Tax:-</b></td>
				<td align="right" width="100"><s:property
						value="#x.feeDetails.serviceTax" /></td>
			</tr>

			<tr>
				<td><b>Fine:-</b></td>
				<td align="right" width="100"><s:property
						value="#x.feeDetails.fine" /></td>
			</tr>

			<tr>
				<td><b>Discount Available:-</b></td>
				<td align="right" width="100"><s:property
						value="#x.feeDetails.discountAvailable" /></td>
			</tr>

			<tr>
				<td><b>Total Fee:-</b></td>
				<td align="right" width="100"><s:property
						value="#x.feeDetails.totalFee" /></td>
			</tr>

		</table>


		<table>

			<tr>
				<td><s:submit value="Back" /></td>
			</tr>

		</table>



		<%
			Student stu = (Student) request.getAttribute("student");

			//out.println("get Attribute  Name   : " + stu.getName());

			for (Payment p : stu.getPaymentsList()) {

				if (p instanceof RegistrationPayment) {
					out.println("<hr><hr><table border='0' id='studentdetail' ><tr><td width='550'></td><td> <h3> Payment   :  Registration</h3></td></tr></table><hr><hr><table>");

					RegistrationPayment rp = (RegistrationPayment) p;

					out.println("<tr><td><b>Payment ID   :</b>  </td><td>"
							+ rp.getPaymentID() + "</td></tr>");
					out.println("<tr><td><b> Payment Status    :</b>  </td><td>"
							+ rp.getPaymentStatus() + "</td></tr></table>");

				} else if (p instanceof FullFeePayment) {
					FullFeePayment ffp = (FullFeePayment) p;

					out.println("<hr><hr><table border='0' id='studentdetail'><tr><td width='550'></td><td> <h3>  Fullfee Payment </h3></td></tr></table><hr><hr><table> ");

					out.println("<tr><td><b> Payment ID  :</b> </td><td>"
							+ ffp.getPaymentID() + "</td></tr>");
					out.println("<tr><td><b> Payment Status  : </b> </td><td>"
							+ ffp.getPaymentStatus() + "</td><td>"
							+ " <a href='perpareDuePayment?paymentId="
							+ ffp.getPaymentID()
							+ "'>PAY NOW </a></td></tr></table>");

				} else if (p instanceof InstallmentPayment) {

					InstallmentPayment ip = (InstallmentPayment) p;

					out.println("<hr><hr><table border='0' id='studentdetail'><tr><td width='550' ></td><td> <h3>"
							+ ip.getInstallmentType()
							+ " Intsallment </h3> </td></tr></table><hr><hr><table>");
					out.println("<tr><td><font><b> Payment Status     : </b></td><td>"
							+ ip.getPaymentStatus()
							+ "</font> <a href='perpareDuePayment?paymentId="
							+ ip.getPaymentID() + "'>PAY NOW </a></td></tr>");

					out.println("<tr><td><b>Payment ID    : </b> </td><td>"
							+ ip.getPaymentID());
					out.println("</td></tr></table>");

				} else {

				}

				///General Payment Details
				out.println("<table border='0' id='studentdetail'><tr><td><b> Prposed Amount   :  </b></td><td>"
						+ p.getPaymentDetails().getProposedAmount()
						+ "</td></tr>");
				out.println("<tr><td><b> Deposited Amount   :  </b></td><td>"
						+ p.getPaymentDetails().getDepositedAmount()
						+ "</td></tr>");
				out.println(" <tr><td><b> Prposed Date   :  </b></td><td>"
						+ p.getPaymentDetails().getProposedDate()
						+ "</td></tr>");
				if (p.getPaymentDetails().getPaymentDate() != null) {
					out.println("<tr><td><b> Payment Date   :  </b></td><td>"
							+ p.getPaymentDetails().getPaymentDate()
							+ "</td></tr>");
				} else {
					out.println(" <tr><td><b> Payment Date   :  </b></td><td>N/A </td></tr>");
				}

				out.println(" </table>");

				//Checking for Mode of Payment
				PaymentMode pm = p.getPaymentMode();

				if (pm instanceof CashMode) {

					out.println("<table border='0' id='studentdetail'><tr><td><b> Payment Mode :</b></td> <td><b>Cash Mode<b></td></tr>");

					CashMode cm = (CashMode) pm;
					out.println("<tr><td><b> Cash Amount :</b></td><td>"
							+ cm.getCashAmount() + "</td></tr>");
					out.println("<tr><td> <b>Cash Details :</b> </td></tr>");

					for (Note n : cm.getCashDetail().keySet()) {
						out.println("<tr><td><b> " + n + " </b></td><td> : "
								+ cm.getCashDetail().get(n)
								+ "</td></tr></table>");
					}

				} else if (pm instanceof DDMode) {
					out.println("<table border='0' id='studentdetail'><tr><td><b> Payment Mode :</b></td><td><b> DD Mode <b></td></tr>");

					DDMode ddm = (DDMode) pm;
					out.println("<tr><td><b> Bank Name :</b></td><td>"
							+ ddm.getBankName() + "</td></tr>");
					out.println("<tr><td><b>  DD Number :</b></td><td>"
							+ ddm.getDDNumber() + "</td></tr>");
					out.println("<tr><td><b> DD Expiry Date :</b></td><td>"
							+ ddm.getDdExpiryDate() + "</td></tr>");
					out.println("<tr><td><b> DD Issue Date :</b></td><td>"
							+ ddm.getIssueDate() + "</td></tr></table>");

				} else if (pm instanceof ChequeMode) {
					out.println("<table border='0' id='studentdetail'><tr><td><b> Payment Mode :</b></td><td> Cheque Mode </td></tr>");

					ChequeMode chqm = (ChequeMode) pm;
					out.println("<tr><td><b> Bank Name :</b></td><td>"
							+ chqm.getBankName() + "</td></tr>");
					out.println("<tr><td><b> Cheque Number :</b></td><td>"
							+ chqm.getChequeNumber() + "</td></tr>");
					out.println("<tr><td><b> Cheque Status :</b></td><td>"
							+ chqm.getChequeStatus() + "</td></tr>");
					out.println("<tr><td><b> Cheque Expiry Date :</b></td><td>"
							+ chqm.getExpriyDate() + "</td></tr>");
					out.println("<tr><td><b>Cheque Issue Date :</b></td><td>"
							+ chqm.getIssueDate() + "</td></tr></table>");

				} else if (pm instanceof CardMode) {
					out.println("<table border='0' id='studentdetail'><tr><td><b> Payment Mode :</b></td><td> Card  Mode </td></tr>");

					CardMode crdm = (CardMode) pm;
					out.println("<tr><td><b> Card Number :</b></td><td>"
							+ crdm.getCardNumber() + "</td></tr>");
					out.println("<tr><td><b> Transaction ID :</b></td><td>"
							+ crdm.getTransactionID() + "</td></tr>");
					out.println("<tr><td><b> Card Expiry Date :</b></td><td>"
							+ crdm.getCardExpiryDate() + "</td></tr></table>");

				} else if (pm instanceof OnlineMode) {
					out.println("<table border='0' id='studentdetail'><tr><td><b> Payment Mode :</b></td><td><b> Online Mode <b></td></tr>");

					OnlineMode om = (OnlineMode) pm;
					out.println("<tr><td><b> Reiciept Number :</b></td><td>"
							+ om.getRecieptNumber() + "</td></tr>");
					out.println("<tr><td><b> Transaction ID :</b></td><td>"
							+ om.getTrasactionID() + "</td></tr>");

				} else {

				}

			}
		%>
	</div>
	<hr>

	<center>

		<div style="width: 600px; border: 1px #ff00ff solid">
			<!-- Table for Student Basic  and546874561 Fee Details -->
			<table width="100%" border="1">
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
					<td width="10%" align="right">Icons</td>
				</tr>
			</table>

			<!-- Table for Payment Details -->
			<!--Every payment will have a specific table -->
			Payment Details
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
