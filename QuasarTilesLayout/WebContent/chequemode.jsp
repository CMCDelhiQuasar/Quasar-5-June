<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
#studentdetail {
	background-color: white;
	font-family: sans-serif;
	padding: 10px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-moz-box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-webkit-box-shadow: 0 4px 6px -5px rgba(0, 0, 0, 0.8);
	padding: 10px;
}
</style>
<sj:head jqueryui="true" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Quasar Cheque Payment Configuration</title>
<script type="text/javascript">
	function validatecheque() {
		//alert("come to validate method");
		var strchequeNumber = document.forms["chequedetails"]["chequeNumber"].value;
		var chequeNumber = parseInt(strchequeNumber, 10);

		var bankName = document.forms["chequedetails"]["bankName"].value;
		var issueDate = document.forms["chequedetails"]["issueDate"].value;

		if (chequeNumber <= 0 || strchequeNumber == "" || isNaN(chequeNumber)) {
			alert("Please check Cheque Number !!");
			return false;
		}
		if (bankName.length < 3) {
			alert("Please enter at least 3 character in bank name");
			return false;
		}
		if (issueDate == "") {
			alert("Please select date!!");
			return false;
		}

		return true;
	}
	function gotoregistration() {
		history.back();
	}
</script>

<style>
#chequelayout {
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
				<h2 align="center">Cheque Details</h2>
			</div>
			<div id="breadCrumbs">
				<h4 style="text-decoration: none; color: #1568b4; font-size: small;">
					Student > Student Registration > Student Installment Configuration
					> Payment Configuration > Cheque Mode</a>
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
								onclick="location.href='cancelregistration'" class="css_button">x</button></td>

						<td></td>
					</tr>
				</table>
			</center>
		</div>



		<div id="chequelayout">
			<h1></h1>
			<s:form name="chequedetails" theme="simple" action="cheque"
				method="post" onsubmit="return true">

				<table>
					<tr>
						<td><s:label value="Cheque Number" /></td>
						<td><s:textfield label="Cheque Number" labelSeparator=""
								labelposition="left" name="chequeNumber" /></td>
						<td><s:fielderror fieldName="chequeNumber" /></td>
					</tr>

					<tr>
						<td><s:label value="Drawn on/Bank Name" /></td>
						<td><s:textfield label="Drawn on/Bank Name" labelSeparator=""
								labelposition="left" name="bankName" /></td>
						<td><s:fielderror fieldName="bankName" /></td>
					</tr>

					<tr>
						<td><s:label value="Issue Date" /></td>
						<td><sj:datepicker changeMonth="true" changeYear="true"
								name="issueDate" label="Issue Date" labelSeparator=""
								labelposition="left" /></td>
						<td><s:fielderror fieldName="issueDate" /></td>
					</tr>
				</table>
				<table>
					<tr>
						<td width="200"></td>
						<td width="60"></td>

						<td><s:submit value="Proceed" cssClass="css_button"
								align="left" /></td>
					</tr>
				</table>
			</s:form>
			<table border="0" id="studentdetail">
				<tr>
					<td colspan="4"><h2>Installment Configuration For</h2></td>
					<td width="100"></td>
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
				<tr>
					<td colspan="4"><h2>Registration Object Details</h2></td>
					<td width="100"></td>
				</tr>
				<tr>
					<td>Registration Proposed Amount:-</td>
					<td><s:property
							value="#session.shagird.paymentsList.get(0).paymentDetails.proposedAmount" /></td>
				</tr>

				<tr>
					<td>Registration Deposited Amount:-</td>
					<td><s:property
							value="#session.shagird.paymentsList.get(0).paymentDetails.depositedAmount" /></td>
				</tr>

				<tr>
					<td>Registration Proposed Date:-</td>
					<td><s:property
							value="#session.shagird.paymentsList.get(0).paymentDetails.proposedDate" /></td>
				</tr>
				<tr>
					<td>Registration Payment Date:-</td>
					<td><s:property
							value="#session.shagird.paymentsList.get(0).paymentDetails.paymentDate" /></td>
				</tr>
				<tr>
					<td>Registration Payment Comment:-</td>
					<td><s:property
							value="#session.shagird.paymentsList.get(0).paymentComment" /></td>
				</tr>

			</table>
		</div>
	</s:else>

</body>
</html>