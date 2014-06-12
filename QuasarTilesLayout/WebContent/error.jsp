<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
html {
	font-size: 15px;
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

html {
	font-size: 13px;
}

h2 {
	font-family: 'open-sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-weight: 300;
	font-size: 20px;
	line-height: 1.4;
}

body {
	background-color: #1568b4;
}

hr {
	background-color: #EEE;
	border: 0;
	height: 1px;
}

#buggyImageArea {
	background-color: rgb(255, 255, 255);
	background-image: url("animals/zebra.png");
	background-repeat: no-repeat;
	background-position: right;
	padding: 10px;
	padding-right: 130px;
	font-family: cursive;
	text-align: center;
	margin: auto;
	right: 50%;
	left: 50%;
	background-image: url("animals/zebra.png");
}

#container {
	padding: 20px;
	background-color: white;
	margin-top: 20px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	-webkit-border-radius: 4px;
	box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-moz-box-shadow: 0 4px 4px -4px rgba(0, 0, 0, 0.7);
	-webkit-box-shadow: 0 4px 6px -5px rgba(0, 0, 0, 0.8);
	border: 1px solid #DDD;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5);
	margin-top: 20px;
}
#logoArea {
	background-image: url("images/logo.png");
	background-repeat: no-repeat;
	background-position: left;
	padding-left: 100px;
	height: 70px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="logoArea">
			<font color="#1568b4"><br> <span style="font-size: 130%;">Quasar
					Payment System </span><br> <span style="font-size: 100%">CMC
					Ltd,New Delhi</span> </font>
		</div>

		<div align="center" id="buggyImageArea">

			<div align="left">
				<h2>
					<a style="text-decoration: none;" href="index.jsp">  < Take Me Back</a>
				</h2>
			</div>

			<h2>Seems a wild animal has attacked our server !</h2>
			<p>

				<font color="red">Exception <s:property
						value="%{exception.message}" /></font>
			</p>

		</div>

		<h1>Nerdy Stats :</h1>
		<p>
			<s:property value="%{exceptionStack}" />
		</p>




		<br> <br>


	</div>


	<!-- Some Cool Stuffs Here  -->

	<script type="text/javascript">
		//generateRandomNumber();

		var rand = generateRandomNumber();

		var img = document.getElementById('buggyImageArea');

		switch (rand) {
		case 1:
			img.style.backgroundImage = "url('animals/lion.png')";
			break;
		case 2:
			img.style.backgroundImage = "url('animals/giraffe.png')";
			break;
		case 3:
			img.style.backgroundImage = "url('animals/elephant.png')";
			break;
		case 4:
			img.style.backgroundImage = "url('animals/rhino.png')";
			break;
		case 5:
			img.style.backgroundImage = "url('animals/zebra.png')";
			break;

		default:
			break;
		}

		function generateRandomNumber() {
			var x = Math.round(Math.random() * 10);
			if (x <= 5) {
				return x;
			} else {
				return generateRandomNumber();
			}

		}
	</script>
</body>
</html>