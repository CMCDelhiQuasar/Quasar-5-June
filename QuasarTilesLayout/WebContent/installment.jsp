<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<s:if test="#session.SECRET==null">
		You are not within the  admin session .Please Login
		<jsp:forward page="home.jsp" />
</s:if>
<s:else>
	<tiles:insertTemplate template="/layout.jsp">
		<tiles:putAttribute name="title" value="www.bismillah.com -Home Page"
			type="string" />
		<tiles:putAttribute name="header" value="/header.jsp" />
		<tiles:putAttribute name="sideMenu" value="/sidemenu.jsp" />
		<tiles:putAttribute name="body"
			value="/installmentpaymentconfiguration.jsp" />
		<tiles:putAttribute name="footer" value="/footer.jsp" />
	</tiles:insertTemplate>
</s:else>