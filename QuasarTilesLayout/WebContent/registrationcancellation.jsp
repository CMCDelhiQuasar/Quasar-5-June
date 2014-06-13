<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quasar Registration Cancellation</title>
</head>
<body>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<s:if test="#session.SECRET==null">
		You are not within the  admin session .Please Login
		<jsp:forward page="home.jsp" />
	</s:if>
	<s:else>
		<div align="center">
			<table border="0">

				<tr align="center">
					<td colspan="4" height="120" width=""><h2>Current
							Registration Cancelled</h2></td>
				</tr>
				<tr>

					<td align="center" width="33%"><button
							onclick="location.href='registration.jsp'" class="css_button">
							Another Registration</button></td>

				</tr>

			</table>
		</div>
	</s:else>
</body>
</html>