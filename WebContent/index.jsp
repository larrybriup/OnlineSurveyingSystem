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
<title>Insert title here</title>
<script type="text/javascript" src="js/showTime.js"></script>
<script type='text/javascript' src='js/questionnaire.js'></script>
<script type="text/javascript">
	function a(){
	var str="是|否|否|是|是|^否|否|否|是|是|^否|否|否|是|是|^否|否|否|是|是|";
	var c=str.split("^");
	var a1=0;
	var a2=0;
	var a3=0;
	var a4=0;
	var a5=0;
	var count=0;
	for(var i=0;i<c.length;i++){
		var a=c[i].split("|");
		count=0;
		for(var j=0;j<a.length;j++){
			document.writeln(a[j]);
			a[j]=="是"?count++:null;
		}
		document.writeln(count);
		document.writeln("<br>");
	}
	}
	function s(val){
		alert(val.id);
	}
	function a(){
		var reg=/[\S]/g;
		var inp=document.getElementById("inp");
		alert(!reg.test(inp.value));
	}
</script>
<style type="text/css">
	.td1{
	color:blue;
	height:100px;
	background:red;
	
	}
	.td2{
	color:blue;
	height:10px;
	background:yellow;
		margin-top: 10px;
	
	}
	.t1{
		float:left;
		position: relative;
	}
</style>
</head>
<body>
<ol>
	<li><a  onclick="s(this)" id="1">dfg</a>df</li>
	<li >df</li>
	<li >df</li>
	<li>df</li>
</ol>
<a href="<%= request.getRequestURL()%>">fghbhfgb</a>
<%= request.getLocalAddr()%><br/>
<%= request.getLocalName()%><br/>
<%= request.getPathInfo() %><br/>
<%= request.getRemoteUser()%><br/>
<%= request.getRequestURI()%><br/>
<%= request.getServerName()%><br/>
<%= request.getRequestURL()%>
<span id="idSpan">4</span>
<input type="text" id="inputId" name="inputId"/>


<!-- <table border="1" class="t1">
	<tr>
		<td class="td1">dfv</td>
	</tr>
</table>
<table border="1" class="t1">
	<tr>
		<td class="td2">dfv</td>
	</tr>
</table>
<table border="1">
	<tr>
		<td>d</td>
	</tr>
	<tr>
		<td>d</td>
		<td>d</td>
		<td>d</td>
	</tr>
	<tr>
		<td background="red">d</td>
		<td>d</td>
		<td>d</td>
	</tr>
</table> -->
</body>
</html>