<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quasar Due Payment Success</title>
</head>
<body>
	<div align="center">
		<table border="0">

			<tr align="center">
				<td colspan="4" height="120" width=""><h2>Welcome to Due
						Payment Success Page!!</h2></td>
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
					<button
						onclick="location.href='getPDF?emailid=<s:property value="email"/>'"
						class="css_button">&nbsp &nbsp Mail Reciept &nbsp &nbsp</button>
				</td>
			</tr>

		</table>
	</div>
</body>
</html>