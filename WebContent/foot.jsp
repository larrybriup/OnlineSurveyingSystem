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
<title>foot</title>
<style type="text/css">
	.pDiv1{
		float:left;
		position: absolute;
	}
	.cDiv{
		float:left;
		margin-left: 25%;
		position: absolute;
	}
	.pDiv2{
		float:right;
	}
</style>
</head>
<body>
<div class="pDiv1">
	<img alt="ddda" src="images/4.jpg" width="100%" height="100px">
</div>
<div class="cDiv">
	<a href="#">关于公司</a> | <a href="#">版权声明</a> | <a href="#">法律责任</a>
	| <a href="#">联系我们</a>
	<address>地址:河南省 郑州市 文化路97号 郑州大学(北区) 2号楼318室 6号</address>
	Super Eagle Corporation C<sup>.</sup>
	陈大超,2013年11月15号
	<br>
	
</div>
<div class="pDiv2">
	<img alt="ddda" src="images/26.jpg" width="100%" height="100px">
</div>
</body>
</html>