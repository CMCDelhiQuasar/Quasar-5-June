<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
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
}
</style>
<sj:head jqueryui="true" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script type="text/javascript">
	function paymentvalidate() {

		alert("come to validate method");
		var strproposedAmount = document.forms["regpayment"]["proposedAmount"].value;
		var proposedAmount = parseInt(strproposedAmount, 10);

		var strdepositedAmount = document.forms["regpayment"]["depositedAmount"].value;
		var depositedAmount = parseInt(strdepositedAmount, 10);

		var proposedDate = document.forms["regpayment"]["proposedDate"].value;
		var paymentDate = document.forms["regpayment"]["paymentDate"].value;

		var comments = document.forms["regpayment"]["comments"].value;
		var paymentMode = document.getElementsByName("paymentMode");

		if (proposedAmount < 0 || strproposedAmount == ""
				|| isNaN(proposedAmount)) {
			alert("Proposed Amount can not be less then 0 !!!");
			return false;
		}

		if (depositedAmount < 0 || strdepositedAmount == ""
				|| isNaN(depositedAmount)) {
			alert("Please check deposited amount");
			return false;
		}

		if (proposedDate == "") {
			alert("Please select Proposed Date!!");
			return false;
		}

		if (paymentDate == "") {
			alert("Please select Payment Date!!");
			return false;
		}

		if (comments.length < 1) {
			alert("Please enter atleast 5 charcter in Comment Section!!");
			return false;
		}

		//	window.confirm(paymentMode1[2].checked);
		return true;
	}
	function gotoregistration() {
		history.back();
	}
</script>
<style>
#paymentlayout {
	margin-left: 300px;
}
</style>
<title>Quasar Payment Configuration</title>
</head>
<body>

	<s:if test="#session.REGISTERING_STUDENT_EMAIL==null">
		You are not within the session .Please Login
		<jsp:forward page="registration.jsp" />
	</s:if>
	<s:else>

		<div id="localHeader">
			<div id="localTitle">
				<h2 align="center">Payment Page</h2>
			</div>
			<div id="breadCrumbs">
				<h4 style="text-decoration: none; color: #1568b4; font-size: small;">
					Student > Student Registration > Student Installment Configuration
					> Payment Configuration</a>
				</h4>
			</div>
		</div>

		<div>
			<center>
				<table border="0" width="50%">
					<tr>
						<td align="left"><button onclick="gotoregistration()"
								class="css_button"><</button></td>

						<!-- if due payment session on then direct  to duepayment action -->
						<s:if test="#session.DUE_TAG==null">
							<td align="center"><button
									onclick="location.href='cancelregistration'"
									value="cancelregistration" class="css_button">x</button></td>



						</s:if>
						<!-- else direct him to registration  action -->
						<s:else>
							<td align="center"><button
									onclick="location.href='cancelduepayment'"
									value="cancelregistration" class="css_button">x</button></td>

						</s:else>


						<td></td>
					</tr>
				</table>
			</center>
		</div>
		<!-- Check if Payment is of Due Payment or Registration Payment -->

		<s:if test="#session.DUE_TAG==null">
			<div align="right">
				<h1>Registration Payment</h1>

				<s:set var="pa" value="#session.shagird.paymentsList.get(0)" />
			</div>

		</s:if>
		<s:else>
			<div align="right">
				<h1>
					<s:property value="#session.DUE_TAG" />

					<s:set var="pa" value="#session.payment" />

				</h1>

			</div>
		</s:else>

	</s:else>
	<div id="paymentlayout">
		<h1></h1>
		<s:form name="regpayment" theme="simple" method="post"
			action="payment" onsubmit="return true">


			<br />
			<table border="0">
				<tr>
					<td width="100"><s:label value="Proposed Amount" /></td>
					<td><s:textfield label="Proposed Amount" labelSeparator=""
							labelposition="left" name="proposedAmount"
							value="%{#pa.paymentDetails.proposedAmount}" disabled="true" /></td>
					<td><s:fielderror fieldName="proposedAmount" /></td>
				</tr>

				<tr>
					<td><s:label value="Deposited Amount" /></td>
					<td><s:textfield label="Deposited Amount" labelSeparator=""
							labelposition="left" name="depositedAmount" /></td>
					<td><s:fielderror fieldName="depositedAmount" /></td>
				</tr>
				<tr>
					<td><s:label value="ProposedDate" /></td>
					<td><sj:datepicker name="proposedDate"
							displayFormat="dd/mm/yy" changeMonth="true" changeYear="true"
							label="Proposed Date" labelposition="left" minDate="d"
							value="%{#pa.paymentDetails.proposedDate}" /></td>
					<td><s:fielderror fieldName="proposedDate" /></td>
				</tr>
				<tr>
					<td><s:label value="PaymentDate" /></td>
					<td><sj:datepicker name="paymentDate" changeMonth="true"
							changeYear="true" label="Payment Date" labelposition="left"
							displayFormat="dd/mm/yy" minDate="d" /></td>
					<td><s:fielderror fieldName="paymentDate" /></td>
				</tr>
				<tr>
					<td><s:label value="Comments" /></td>
					<td><s:textarea name="comments" label="Comments"
							labelSeparator="" labelposition="left" /></td>
					<td><s:fielderror fieldName="comments" /></td>
				</tr>
				<tr>
					<td><s:label value="Mode of Payment" /></td>
					<td><s:radio
							list="#{'cash':'Cash','online':'Online','cheque':'Cheque','dd':'DD','card':'Card'}"
							name="paymentMode" label="Mode of Payment" labelSeparator=""
							labelposition="left" value="{'cash'}" /></td>
					<td><s:fielderror fieldName="paymentMode" /></td>
				</tr>
			</table>
			<table>
				<tr>
					<td width="200"></td>
					<td width="60"></td>

					<td><s:submit cssClass="css_button" value="Proceed"
							align="right" /></td>
				</tr>
			</table>
		</s:form>
		<table border="0" id="studentdetail">
			<tr>
				<td colspan="4"><h2>Payment Configuration For</h2></td>
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
			<tr>
				<td>Payment Objects:-</td>
				<td><s:property value="#session.shagird.paymentsList.size" /></td>
			</tr>
			<s:iterator var="p" status="i" value="#session.shagird.paymentsList">
				<tr>
					<td>Installment Payment / REgistartion</td>
					<td><s:property value="#i.index" /></td>
				</tr>

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
	</div>
</body>
</html>