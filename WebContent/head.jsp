<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+
						request.getServerPort()+path+"/";
					%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%= basePath%>">
<title>head</title>
<script type="text/javascript" src="js/showTime.js"></script>
<style type="text/css">
	a{
		text-decoration: none;
	}
</style>
</head>
<body bgcolor="skyblue">
 <a href="logoutAction" >注销 | </a>
 <a href="modifySU.jsp">修改信息 | </a>
 <a href="superuser/suRegister.jsp">立即注册 | </a>
 <font color="green"><span id="tSpan"></span></font>
 <a href="modifySU.jsp"><s:property value="#session.su.name"/></a>
<img alt="ddda" src="images/1.jpg" width="100%" height="130px">
<!-- 
 -->
</body>
</html>