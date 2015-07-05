<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+
						request.getServerPort()+path+"/";
					%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>analysisAnswer</title>
<script type="text/javascript" src="js/XMLHttpRequestAjax.js"></script>
<script type="text/javascript" src="js/analysisAnswer.js"></script>
<style type="text/css">
	.contentDiv{
		height:2000px;
		border:1px solid lightgray;
	}
</style>
</head>
<body>
	<s:include value="head.jsp"></s:include>
	<div class="contentDiv" align="center" style="background:url(images/29.jpg);background-attachment: fixed;">
		<input type="button" value="返回问题设计" onclick="window.open('designQuestionnaire.jsp')"
			style="cursor:pointer;color:blue"/>
		<select id="choiseList" name="choiseList" onchange="showList(this)">
			<option value="0">按用户</option>
			<option value="1">按问题</option>
		</select>
		<span id="showSpan">
			显示
			<select id="cList" name="cList">
				<option value="1">1</option>
				<option value="30">30</option>
				<option value="70">70</option>
				<option value="100">100以上</option>
			</select> 
		</span>
		<input type="button" id="query" value="查询" onclick="query(this.value)"/>
		<br>
		<input type="button" id="zhuQuery" value="柱状图查询" onclick="query(this.value)"/><br>
		<table  id="area"  border="1">
		<span id="zhuSpan"></span>
		</table>
	</div>
	<s:include value="foot.jsp"></s:include>
</body>
</html>