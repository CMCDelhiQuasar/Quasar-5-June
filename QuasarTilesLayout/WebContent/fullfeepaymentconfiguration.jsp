<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<title>Insert title here</title>
<script type="text/javascript">
	function validatefullfee() {

		//alert("come to javascript");
		var strpamount1 = document.forms["fullfeeform"]["proposedAmount"].value;
		var pamount1 = parseInt(strpamount1, 10);

		//alert("come to javascript");
		var proposeddate1 = document.forms["fullfeeform"]["proposedDate"].value;

		if (strpamount1 == "" || pamount1 <= 0 || isNaN(pamount1)) {
			alert("Please check proposed amount");
			return false;
		}

		if (proposeddate1 == "") {
			alert("Please check proposed date");
			return false;
		}

		return true;

	}
</script>
</head>
<body>

	<s:if test="#session.REGISTERING_STUDENT_EMAIL==null">
		You are not within the session .Please Login
		<jsp:forward page="registration.jsp" />
	</s:if>
	<s:else>


		<div id="localHeader">
			<div id="localTitle">
				<h2 align="center"></h2>
			</div>
			<div id="breadCrumbs">
				<h4 style="text-decoration: none; color: #1568b4; font-size: small;">
					Student > Student Registration > Full Fee Payment Configuration</a>
				</h4>
			</div>
		</div>


		<s:form name="fullfeeform" action="fullfeeconfiguration"
			onsubmit="return validatefullfee()" method="post" theme="simple">

			<table>
				<tr>
					<td><s:label value="Proposed Amount" /></td>
					<td><s:textfield label="Proposed Amount" labelSeparator=""
							labelposition="left" name="proposedAmount" /></td>
				</tr>

				<tr>
					<td><s:label value="Proposed Date" /></td>
					<td><sj:datepicker name="proposedDate" changeMonth="true"
							changeYear="true" label="Proposed Date" labelSeparator=""
							labelposition="left" displayFormat="dd/mm/yy" /></td>
				</tr>

				<tr>
					<td><s:label value="Comments" /></td>
					<td><s:textarea label="Comments" labelSeparator=""
							labelposition="left" name="comment" /></td>
				</tr>
			</table>
			<s:div>
				<table border="0">
					<tr>
						<s:div>
							<td width="250"></td>
							<td><s:submit type="image" value="Back"
									src="images/back.png" align="left" /></td>
							<td width="30"></td>

							<td><s:submit cssClass="css_button" value="Proceed" /></td>

						</s:div>
					</tr>
				</table>
			</s:div>
		</s:form>

		<table border="0" id="studentdetail">
			<tr>
				<td colspan="4"><h2>Full Fee Configuration For</h2></td>
				<td width="130"></td>
				<td width="110"></td>
				<td colspan="3" width="40"><a href="cancelregistration"><img
						src="images/cancel.png" alt="" /></a></td>
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

		</table>

	</s:else>



</body>
</html>