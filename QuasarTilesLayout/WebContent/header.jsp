<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link type="text/css" href="menu.css" rel="stylesheet" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="menu.js"></script>
<style>
input {
	outline: none;
}

input[type=search] {
	-webkit-appearance: textfield;
	-webkit-box-sizing: content-box;
	font-family: inherit;
	font-size: 100%;
}

input::-webkit-search-decoration,input::-webkit-search-cancel-button {
	display: none;
}

input[type=search] {
	background: #ededed url(images/search.png) no-repeat 9px center;
	border: solid 1px #ffffff;
	padding: 9px 10px 9px 32px;
	width: 200px;
	-webkit-border-radius: 10em;
	-moz-border-radius: 10em;
	border-radius: 10em;
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	transition: all .5s;
}

input[type=search]:focus {
	width: 200px;
	background-color: #fff;
	border-color: #ffffff;
	-webkit-box-shadow: 0 0 5px #1568b4;
	-moz-box-shadow: 0 0 5px #1568b4;
	box-shadow: 0 0 5px #1568b4;
}

#menu {
	top: 40px;
	left: 40px;
	width: 350px;
	background-color: #1568b4;
}

#logoArea {
	background-image: url("images/logo.png");
	background-repeat: no-repeat;
	background-position: left;
	padding-left: 100px;
	height: 70px;
}
</style>
<script type="text/javascript">
	function datevalue() {
		var x = document.getElementById("dat");
		var d = new Date();
		x.href = x + (d.getDay() + 1) + "/" + (d.getMonth() + 1) + "/"
				+ d.getFullYear();
		//alert(x);
	}
	//setTimeout('datevalue()', 100);
</script>

<table width="100%" height="100%">


	<tr>

		<td>
			<div id="logoArea">
				<font color="#1568b4"><br> <span
					style="font-size: 130%;">Quasar Payment System </span><br> <span
					style="font-size: 100%">CMC Ltd,New Delhi</span> </font>
			</div>
		</td>


		<td valign="center">

			<div id="menu">
				<ul class="menu">
					<li><a href="index.jsp" class="parent"><span>Home</span></a>
					<li><a href="#" class="parent"><span>Student</span></a>
						<div>
							<ul>

								<li><a href="registration.jsp"><span>Register
											Student </span></a></li>
								<li><a href="deletestudentwrapper.jsp"><span>Student
											Deletion</span></a></li>
								<li><a href="#" class="parent"><span>Hakunamamata</span></a>
									<div>
										<ul>
											<li><a href="#"><span>Sub Item 1.1</span></a></li>
											<li><a href="#"><span>Sub Item 1.2</span></a></li>
										</ul>
									</div></li>

							</ul>
						</div></li>
					<li><a href="analyticswrapper.jsp"><span>Analytics</span></a></li>
					<li class="last"><a href="#"><span>Operations</span></a>
						<div>
							<ul>
								<li><a href="console.jsp"><span>Console</span></a></li>
								<li><a id="dat" onclick="datevalue()"
									href="globalsearch?queryString="><span>Todays
											Notification</span></a></li>
							</ul>
						</div></li>

					</li>

				</ul>
			</div>
		</td>

		<td valign="top">
			<div align="right">
				<s:form action="globalsearch" theme="simple">
					<s:textfield label="" type="search" labelposition="left"
						name="queryString" />

				</s:form>

			</div>
		</td>
		<td><a href="adminlogout">Logout</td>
	</tr>


</table>
