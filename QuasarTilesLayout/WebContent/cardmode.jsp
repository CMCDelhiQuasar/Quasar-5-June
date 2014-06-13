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
<title>Quasar Card Payment Configuration</title>
<script type="text/javascript">
	function validatecard() {
		//alert("come to validate method");
		var cardtype = document.getElementsByName("cardType");

		var strcardNumber = document.forms["regmode"]["cardNumber"].value;
		var cardNumber = parseInt(strcardNumber, 10);

		var strtransactionId = document.forms["regmode"]["transactionId"].value;
		var transactionId = parseInt(strtransactionId, 10);

		var cardExpiryDate = document.forms["regmode"]["cardExpiryDate"].value;

		if (cardNumber < 0 || strcardNumber == "" || isNaN(cardNumber)) {
			alert("Please enter valid card number!!");
			return false;
		}

		if (transactionId < 0 || strtransactionId == "" || isNaN(transactionId)) {
			alert("Please enter valid transaction id!!");
			return false;
		}

		if (cardExpiryDate == "") {
			alert("Please select Card Expiry Date");
			return false;
		}

		var check = -1;
		for (var i = 0; i < cardtype.length; i++) {
			// 	 alert("Come for radio list");
			if (cardtype[i].checked) {
				// alert("Value is incremented!!");
				check += 1;
			}
		}
		if (check == -1) {
			alert("Please select at least one radio button");
			return false;
		}

		return true;
	}
	function gotoregistration() {
		history.back();
	}
</script>
<style>
#cardlayout {
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
				<h2 align="center">Debit/Credit Card Details</h2>
			</div>
			<div id="breadCrumbs">
				<h4 style="text-decoration: none; color: #1568b4; font-size: small;">
					Student > Student Registration > Student Installment Configuration
					> Payment Configuration > Card Mode</a>
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

		<div id="cardlayout">
			<h1></h1>
			<s:form name="regmode" theme="simple" action="cardmode" method="post"
				onsubmit="return true">
				<table>
					<tr>
						<td><s:label value="Card Type" /></td>
						<td><s:radio label="Card Type" labelSeparator=""
								labelposition="left" name="cardType"
								list="{'Debit Card','Credit Card'}" value="%{'Debit Card'}" /></td>
						<td><s:fielderror fieldName="cardType" /></td>
					</tr>

					<tr>
						<td><s:label value="Card Number" /></td>
						<td><s:textfield label="Card Number" labelSeparator=""
								labelposition="left" name="cardNumber" /></td>
						<td><s:fielderror fieldName="cardNumber" /></td>
					</tr>

					<tr>
						<td><s:label value="Transaction ID" /></td>
						<td><s:textfield label="Transaction ID" labelSeparator=""
								labelposition="left" name="transactionId" /></td>
						<td><s:fielderror fieldName="transactionId" /></td>
					</tr>

					<tr>
						<td><s:label value="Expiry Date" /></td>
						<td><sj:datepicker label="Expiry Date" changeMonth="true"
								minDate="d" changeYear="true" labelSeparator=""
								labelposition="left" name="cardExpiryDate"
								displayFormat="dd/mm/yy" /></td>
						<td><s:fielderror fieldName="cardExpiryDate" /></td>
					</tr>


				</table>
				<table>
					<tr>
						<td width="200"></td>
						<td width="30"></td>

						<td><s:submit cssClass="css_button" value="Proceed"
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