<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
<script type="text/javascript">
	function validateform() {

		var strtransactionId = document.forms["onlineform"]["transactionId"].value;
		var transactionId = parseInt(strtransactionId, 10);

		var strreicptNumber = document.forms["onlineform"]["reicptNumber"].value;
		var reicptNumber = parseInt(strreicptNumber, 10);

		if (strtransactionId == "" || transactionId <= 0
				|| isNaN(transactionId)) {
			alert("Please check transaction ID!!!");
			return false;
		}

		if (strreicptNumber == "" || reicptNumber <= 0 || isNaN(reicptNumber)) {
			alert("Please check Reciept Number!!!");
			return false;
		}

		return true;
	}
	function gotoregistration() {
		history.back();
	}
</script>
<style>
#onlinelayout {
	margin-left: 300px;
}
</style>
</head>
<body>


	<s:if test="#session.REGISTERING_STUDENT_EMAIL==null">
		You are not within the session .Please Login
		<jsp:forward page="registration.jsp" />
	</s:if>
	<s:else>

		<div id="localHeader">
			<div id="localTitle">
				<h2 align="center">Online Transaction Details</h2>
			</div>
			<div id="breadCrumbs">
				<h4 style="text-decoration: none; color: #1568b4; font-size: small;">
					Student > Student Registration > Student Installment Configuration
					> Payment Configuration > Online Payment</a>
				</h4>
			</div>
		</div>

		<div>
			<center>
				<table border="0" width="50%">
					<tr>
						<td align="left"><button onclick="gotoregistration()"
								class="css_button"><</button></td>

						<td align="center"><button
								onclick="location.href='cancelregistration'"
								value="cancelregistration" class="css_button">x</button></td>

						<td></td>
					</tr>
				</table>
			</center>
		</div>

		<div id="onlinelayout">
			<h1></h1>
			<s:form name="onlineform" theme="simple" onsubmit="return true"
				method="post" action="onlinemode">
				<table>
					<tr>
						<td><s:label value="Transaction Id" /></td>
						<td><s:textfield labelSeparator="" labelposition="left"
								name="transactionId" /></td>
						<td><s:fielderror fieldName="transactionId" /></td>
					</tr>
					<tr>
						<td><s:label value="Reicpt Number" /></td>
						<td><s:textfield value="0" labelSeparator=""
								labelposition="left" name="reicptNumber" /></td>
						<td><s:fielderror fieldName="transactionId" /></td>
					</tr>
				</table>
				<table border="0">
					<tr>
						<s:div>
							<td width="200"></td>
							<td width="30"></td>

							<td><s:submit value="Proceed" align="left"
									cssClass="css_button" /></td>

						</s:div>
					</tr>
				</table>
			</s:form>
			<table border="0" id="studentdetail">
				<tr>
					<td colspan="4"><h2>Welcome</h2></td>
					<td width="130"></td>
					<td width="110"></td>
				</tr>
				<tr>
					<td>Name:-</td>
					<td><s:property value="#session.shagird.name" /></td>
				</tr>

				<tr>
					<td>Email:-</td>
					<td><s:property value="#session.shagird.emailId" /></td>
				</tr>

				<tr>
					<td>Contact:-</td>
					<td><s:property value="#session.shagird.contactNumber" /></td>
				</tr>

				<tr>
					<td>Payment Objects:-</td>
					<td><s:property value="#session.shagird.paymentsList.size" /></td>
				</tr>
				<s:iterator var="p" value="#session.shagird.paymentsList">
					<tr>
						<td>Proposed Amount:-</td>
						<td><s:property value="#p.paymentDetails.proposedAmount" /></td>
					</tr>
					<tr>
						<td>Proposed Date:-</td>
						<td><s:property value="#p.paymentDetails.proposedDate" /></td>
					</tr>

					<tr>
						<td>Payment Comment:-</td>
						<td><s:property value="#p.paymentComment" /></td>
					</tr>
				</s:iterator>
			</table>

			<hr />
			<h1>Registration Object Details</h1>
			Registration Proposed Amount:-
			<s:property
				value="#session.shagird.paymentsList.get(0).paymentDetails.proposedAmount" />
			<br />Registration Deposited Amount:-
			<s:property
				value="#session.shagird.paymentsList.get(0).paymentDetails.depositedAmount" />
			<br /> Registration Proposed Date :
			<s:property
				value="#session.shagird.paymentsList.get(0).paymentDetails.proposedDate" />
			<br />Registration Payment Date:-
			<s:property
				value="#session.shagird.paymentsList.get(0).paymentDetails.paymentDate" />
			<br />Registration Payment Comment:-
			<s:property
				value="#session.shagird.paymentsList.get(0).paymentComment" />
			<br />
			<hr />
		</div>
	</s:else>


</body>
</html>