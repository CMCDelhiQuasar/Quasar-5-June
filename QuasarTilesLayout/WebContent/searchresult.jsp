<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="sjg"
	uri="/struts-jquery-grid-tags"%>
<%@page errorPage="error.jsp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sj:head jqueryui="true" />


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

#pendingpaymentcontactbox {
	/*	background-color: #F7F7F9;  */
	background-color: #fff;
	background-image: linear-gradient(90deg, transparent 79px, #abced4 79px, #abced4 81px,
		transparent 81px), linear-gradient(#eee .1em, transparent .1em);
	background-size: 85% 1.2em;
	padding: 20px;
	margin: 20px 0px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	width: 300px;
	padding: 4px;
	margin: 4px;
	overflow: hidden;
	margin: 4px;
	border: 1.5px solid #ccc;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<s:if test="#session.SECRET==null">
		You are not within the  admin session .Please Login
		<jsp:forward page="home.jsp" />
	</s:if>
	<s:else>


		<s:if test="queryResultStudentList.size()!=0">

			<div align="right">
				Search Result :
				<s:property value="queryResultStudentList.size()" />
				records found
			</div>
			<hr>
			<s:iterator var="s" value="queryResultStudentList">



				<div id="box" align="center">
					<table width="100%">
						<tr height="35px">
							<td align="left" width="10%"><a
								href="searchstudent?emailId=<s:property
							value="#s.emailId"/>">
									<button class="css_button">S</button>
							</a></td>
							<td width="50%" align="left"><a
								style="color: #000000; text-decoration: none; font-weight: bold; font-size: 150%; padding-top: 8px"><s:property
										value="#s.name" /></a></td>
							<td width="40%" align="center">
								<div
									style="background-color: #FFFFEB; font-weight: bold; font-size: 110%;">
									<s:property value="#s.paymentStatus" />
								</div>
							</td>
						</tr>
						<tr>
							<td align="left"></td>
							<td>
								<div style="text-decoration: none; font-size: 110%;">
									<s:property value="#s.courseName" />
								</div>
							<td align="right"><s:property value="#s.emailId" />&nbsp <s:property
									value="#s.contactNumber" /></td>
						</tr>
					</table>
				</div>

			</s:iterator>
		</s:if>



		<s:if test="queryResultPaymentList.size()!=0">

			<div align="right">
				Search Result :
				<s:property value="queryResultPaymentList.size()" />
				records found
			</div>
			<hr>

			<hr>


			<s:iterator var="p" value="queryResultPaymentList">








				<div id="box" align="center">
					<table width="100%">
						<tr>
							<td align="left" width="10%"><a
								href="searchstudent?emailId=<s:property
							value="#p.student.emailId" />">
									<button class="css_button">P</button>
							</a></td>
							<td width="50%" align="left">Proposed<br>
								<div
									style="background-color: #ffffff; text-decoration: none; font-size: 120%;">

									Rs
									<s:property value="#p.paymentDetails.proposedAmount" />
									&nbsp &nbsp on &nbsp &nbsp
									<s:property value="#p.paymentDetails.proposedDate" />
								</div>
							</td>
							<td width="40%" align="center">
								<div
									style="background-color: #FFFFEB; font-weight: bold; font-size: 110%;">


									<s:property value="#s.paymentStatus" />

								</div>
							</td>
						</tr>
						<tr>
							<td align="left"></td>
							<td>Desposited <br>
								<div
									style="background-color: #ffffff; text-decoration: none; font-weight: bold; font-size: 140%;">
									Rs .
									<s:property value="#p.paymentDetails.depositedAmount" />
									&nbsp &nbsp on &nbsp &nbsp
									<s:property value="#p.paymentDetails.paymentDate" />
								</div>
							<td align="right">for <a
								style="color: #000000; text-decoration: none;"><s:property
										value="#p.student.name" /> <br> <s:property
										value="#p.student.emailId" />&nbsp <br> <span
									style="color: #76797c; font-size: 150%; float: right;">
										<s:property value="#p.student.contactNumber" />
								</span> </a> <sj:a openDialog="myclickdialog" button="true"
									buttonIcon="ui-icon-newwin">
    	Open modal dialog
    </sj:a>
							</td>
						</tr>
					</table>
				</div>


				<sj:dialog id="myclickdialog" autoOpen="false" modal="true">

					<div id="pendingpaymentcontactbox">
						<input type="checkbox" name="nothing" /> <span
							style="color: #76797c; font-size: 95%; float: right;"> <s:property
								value="#p.paymentStatus" />
						</span> <br> <img src="images/student.png" alt="Student"
							title="{Name}" alt="{Name}" style="float: left;"> <span
							style="color: #76797c; font-size: 95%; float: right;">
							Payment ID : <s:property value="#p.paymentID" />
						</span><br> <br> <br>
						<div style="font-weight: bold; font-size: 150%; padding-top: 8px">
							<a style="color: #000000; text-decoration: none;" target="_blank"
								href="{Website}"><s:property value="#p.student.name" /></a>
						</div>
						<div>
							<s:property value="#p.student.emailId" />
						</div>
						<div style="padding-bottom: 12px">
							<span style="color: #76797c; font-size: 95%;">Due :</span> Rs.
							<s:property value="#p.paymentDetails.proposedAmount" />
							for Payment Type <br> <span
								style="color: #76797c; font-size: 95%;">Proposed Date :</span>
							<s:property value="#p.paymentDetails.proposedDate" />
							<br> <span style="color: #76797c; font-size: 95%;">Course
								:</span>
							<s:property value="#p.student.courseName" />
						</div>
						<div>

							<span style="color: #76797c; font-size: 150%; float: right;">
								<s:property value="#p.student.contactNumber" />
							</span> <span style="color: #76797c; float: left;"><a href="ap">
									<img src="images/mail.png" style="bottom: 1px;" height="30"
									width="30" alt="Send Mail Remainder">
							</a> </span>


						</div>
					</div>



				</sj:dialog>










			</s:iterator>



		</s:if>

		<s:if
			test=" queryResultPaymentList.size()==0 && queryResultStudentList.size()==0 ">
			<h1>No Records Found !</h1>
		</s:if>
	</s:else>
</body>
</html>