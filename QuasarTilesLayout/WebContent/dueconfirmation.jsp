<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#duelayout {
	margin-left: 300px;
}
</style>
<script type="text/javascript">
	function gotoregistration() {
		history.back();
	}
</script>
</head>
<body>

	<div id="localHeader">
		<div id="localTitle">
			<h2 align="center">Due Confirmation page</h2>
		</div>
		<div id="breadCrumbs">
			<h4 style="text-decoration: none; color: #1568b4; font-size: small;">
				Student > Pending Payment > Due Payment Confirmation</h4>
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
				</tr>
			</table>
		</center>
	</div>

	<div id="duelayout">
		<table border="0">
			<tr id="name">
				<td width="70px"><b>Name:</b></td>
				<td><h2>
						<s:property value="#session.shagird.name" />
					</h2></td>
			</tr>
			<tr>
				<td width="70px"><b>Contact Number:</b></td>
				<td><h4>
						<s:property value="#session.shagird.contactNumber" />
					</h4></td>

			</tr>
			<tr>
				<td width="70px"><b>Email Id:</b></td>
				<td>
					<h2>
						<s:property value="#session.shagird.emailId" />
					</h2>
				</td>
			</tr>
		</table>

		<s:set var="pa" value="#session.payment" />

		<table>
			<tr>
				<td colspan="2">
					<h1>Payment Details Of Student</h1>
				</td>
			</tr>
			<tr>
				<td>Proposed Amount:-</td>
				<td><s:property value="%{#pa.paymentDetails.proposedAmount}" /></td>
			</tr>

			<tr>
				<td>Deposited Amount:-</td>
				<td><s:property value="%{#pa.paymentDetails.depositedAmount}" /></td>
			</tr>

			<tr>
				<td>Proposed Date :</td>
				<td><s:property value="%{#pa.paymentDetails.proposedDate}" /></td>
			</tr>

			<tr>
				<td>Payment Date :</td>
				<td><s:property value="%{#pa.paymentDetails.paymentDate}" /></td>
			</tr>
			<tr>
				<td>Payment Comment :</td>
				<td><s:property value="%{#pa.paymentComment}" /></td>
			</tr>

		</table>

		<s:form action="payDuePayment" theme="simple" method="post">
			<s:label label="Press Submit to Confirm" />
			<sj:submit value="Submit" cssClass="css_button" />
		</s:form>

	</div>

	<!-- 
	<s:form action="confirmregistration" theme="simple" method="post">
		<s:label label="Press Submit to Confirm" />
		<sj:submit value="Submit" />
		<s:submit value="Cancel" action="cancelregistration" />
		<s:submit value="Back" />
	</s:form>  -->
</body>
</html>