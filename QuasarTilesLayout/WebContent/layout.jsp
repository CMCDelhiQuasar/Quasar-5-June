<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
html {
	font-size: 12px;
}

body {
	font-family: 'open-sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-weight: 300;
	font-size: 12px;
	line-height: 1.4;
}

html {
	color: #333;
}



body {
	background-color: #1568b4;
}

hr {
	background-color: #EEE;
	border: 0;
	height: 1px;
}

.css_button {
	padding: 5.5px 8px;
	border: 1px solid #1568B4;
	background: -webkit-gradient(linear, left top, left bottom, from(#1568B4),
		to(#1568B4));
	background: -webkit-linear-gradient(top, #1568B4, #1568B4);
	background: -moz-linear-gradient(top, #1568B4, #1568B4);
	background: -ms-linear-gradient(top, #1568B4, #1568B4);
	background: -o-linear-gradient(top, #1568B4, #1568B4);
	background-color: #1568B4;
	box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 3px #F2F2F2;
	-webkit-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 3px #F2F2F2;
	-moz-box-shadow: 0px 7px 2px -5px #1A1A1A, inset 0px 0px 3px #F2F2F2;
	-webkit-border-radius: 11px;
	-moz-border-radius: 11px;
	border-radius: 5px;
	text-shadow: #1568B4 1px 1px 0px;
	color: #FFFFFF;
	font-size: 16px;
	font-family: Helvetica;
	text-decoration: none;
	font-weight: bold;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	cursor: pointer;
}

.css_button:hover {
	background: none;
	background-color: #1568B4;
	box-shadow: 0px 0px 5px 0px #AAAAAA;
	-webkit-box-shadow: 0px 0px 5px 0px #AAAAAA;
	-moz-box-shadow: 0px 0px 5px 0px #AAAAAA;
	border: 1px solid #ffffff;
	color: #92B2D1;
}

.css_button:active {
	top: 1px;
	position: relative;
}

#container {
	/*background-image: url("images/dots.png"); */
	/*background-color:white;
background-image: radial-gradient(#1568b4 1%, transparent 20%),
radial-gradient(#1568b4 1%, transparent 20%);
background-size:10px 10px;
background-position: 0 0, 30px 30px;
	*/
	padding: 20px;
	margin-top: 10px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	border: 1px solid #E9E9E9;
	-webkit-border-radius: 4px;
	box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-moz-box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-webkit-box-shadow: 0 4px 6px -5px rgba(0, 0, 0, 0.8);
	border: 1px solid #DDD;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5);
	border: 1px solid #DDD;
	background-image: linear-gradient(90deg, transparent 79px, #abced4 79px, #abced4 81px,
		transparent 81px), linear-gradient(#eee .1em, transparent .1em);
}

#content {
	background-color: white;
	border: 1px solid #DDD;
	margin: 5px;
	padding: 10px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-moz-box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-webkit-box-shadow: 0 4px 6px -5px rgba(0, 0, 0, 0.8);
	background: linear-gradient(271deg, #FFFFFF 12%, #EBF3FA 80%);
	background: -moz-linear-gradient(271deg, #FFFFFF 12%, #EBF3FA 80%);
	background: -webkit-linear-gradient(271deg, #FFFFFF 12%, #EBF3FA 80%);
	background: -o-linear-gradient(271deg, #FFFFFF 12%, #EBF3FA 80%);
}

#sidemenu {
	/* -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2); */
	/*box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2);*/
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Insert title here</title>
</head>
<body topmargin="0">

	<table id="container" width="85%" cellspacing="0" align="center"
		bgcolor="white">
		<tr>
			<td colspan="2" height="70"><tiles:insertAttribute name="header" /></td>
		</tr>

		<tr>

			<td id="content"><tiles:insertAttribute name="body" /></td>
		</tr>
		<tr>
			<td colspan="2" height="1"><tiles:insertAttribute name="footer" />
			</td>
		</tr>
	</table>

</body>
</html>