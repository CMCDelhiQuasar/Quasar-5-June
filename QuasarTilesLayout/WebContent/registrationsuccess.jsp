<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table border="0">

			<tr align="center">
				<td colspan="4" height="120" width=""><h2>Congratulation!!!
						You have registered successfully</h2></td>
			</tr>
			<tr>

				<td align="center" width="33%"><button
						onclick="location.href='registration.jsp'" class="css_button">
						Another Registration</button></td>
				<td align="center" width="33%">
					<button onclick="location.href='getPDF'" class="css_button">Print
						Reciept</button>
				</td>
				<td align="left" width="33%">
					<button onclick="location.href='mail'" class="css_button">&nbsp
						&nbsp Mail Reciept &nbsp &nbsp</button>
				</td>
			</tr>

		</table>
	</div>
</body>
</html>