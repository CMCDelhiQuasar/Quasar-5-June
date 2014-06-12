<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function gotoregistration() {
		history.back();
	}
</script>
<style>
#reglayout {
	margin-left: 300px;
}
</style>
</head>
<body>

	<s:if test="#session.SECRET==null">
		You are not within the  admin session .Please Login
		<jsp:forward page="home.jsp" />
	</s:if>
	<s:else>

		<s:if test="#session.REGISTERING_STUDENT_EMAIL==null">
		You are not within the session .Please Login
		<jsp:forward page="registration.jsp" />
		</s:if>
		<s:else>

			<div id="localHeader">
				<div id="localTitle">
					<h2 align="center">Registration Confirmation Page</h2>
				</div>
				<div id="breadCrumbs">
					<h4
						style="text-decoration: none; color: #1568b4; font-size: small;">
						Student > Student Registration > Student Installment Configuration
						> Payment Configuration > Registration Confirmation Page</h4>
				</div>
			</div>

			<div id="reglayout">
				<table>
					<tr id="name">
						<td width="40px"></td>
						<td><h2>
								<s:property value="#session.shagird.name" />
							</h2></td>
						<td width="30px"></td>
						<td><h4>
								<s:property value="#session.shagird.contactNumber" />
							</h4></td>

					</tr>
					<tr>
						<td width="40px"></td>
						<td>
							<h2>
								<s:property value="#session.shagird.emailId" />
							</h2>
						</td>
					</tr>
				</table>
				<table border="0" width="">
					<tr>
						<td colspan="2">
							<h2>Basic Details Of Student</h2>
						</td>
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
				<table>
					<tr>
						<td colspan="2">
							<h2>Fee Details Of Student</h2>
						</td>
					</tr>
					<tr>
						<td>Course Fee:-</td>
						<td><s:property
								value="#session.shagird.feeDetails.courseFees" /></td>
					</tr>

					<tr>
						<td>Service Tax:-</td>
						<td><s:property
								value="#session.shagird.feeDetails.serviceTax" /></td>
					</tr>

					<tr>
						<td>Total Fee:-</td>
						<td><s:property value="#session.shagird.feeDetails.totalFee" /></td>
					</tr>

					<s:iterator var="p" value="#session.shagird.paymentsList">

						<tr>
							<td>Proposed Amount :-</td>
							<td><s:property value="#p.paymentDetails.proposedAmount" /></td>
						</tr>

						<tr>
							<td>Proposed Date :-</td>
							<td><s:property value="#p.paymentDetails.proposedDate" /></td>
						</tr>

						<tr>
							<td>Payment Comment :-</td>
							<td><s:property value="#p.paymentComment" /></td>
						</tr>
					</s:iterator>
				</table>
				<table>
					<tr>
						<td colspan="2">
							<h2>Registration Details Of Student</h2>
						</td>
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
						<td>Registration Proposed Date :</td>
						<td><s:property
								value="#session.shagird.paymentsList.get(0).paymentDetails.proposedDate" /></td>
					</tr>

					<tr>
						<td>Registration Payment Date :</td>
						<td><s:property
								value="#session.shagird.paymentsList.get(0).paymentDetails.paymentDate" /></td>
					</tr>
					<tr>
						<td>Registration Payment Comment :</td>
						<td><s:property
								value="#session.shagird.paymentsList.get(0).paymentComment" /></td>
					</tr>

				</table>

				<s:form action="confirmregistration" theme="simple" method="post">
					<s:label label="Press Submit to Confirm" />
					<sj:submit value="Submit" cssClass="css_button" />
					<s:submit value="Cancel" action="cancelregistration"
						cssClass="css_button" />
					<s:submit value="Back" onclick="gotoregistration()"
						cssClass="css_button" />
				</s:form>

			</div>
		</s:else>
	</s:else>
</body>
</html>