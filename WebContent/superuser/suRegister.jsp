<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+
						request.getServerPort()+path+"/";
					%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%= basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/XMLHttpRequestAjax.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">
	function registerCheck(){
		var xmlHttpRequest=null;
		if(xmlHttpRequest==null){
			xmlHttpRequest=createXMLHttpRequest();
		}
			xmlHttpRequest.open("get","SUAjaxCheckNameAction",true);
			xmlHttpRequest.onreadystatechange=function(){
				if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
					var content=xmlHttpRequest.responseText;
					var nameSpan=document.getElementById("nameSpan");
					nameSpan.innerHTML=content;
				}
			};
			xmlHttpRequest.send(null);
		
	}
</script>
<title>suRegister.jsp</title>
<style type="text/css">
	#suDiv{
		width: 100%;
		height:400px;
		border:1px solid lightgray;
		margin-top: 2px;
		border-top-style: dotted;
		background: url(images/29.jpg);
	}
	table{
		margin-top:1%;
		border:1px solid lightgray;
		border-radius:15px;
		margin-left:30%;
	} 
	.dBtn{
		border-radius:10px;
		border:1px solid lightgray;;
		background:green;
		color:white;
	}
	.toRight{
		text-align: right;
	}
</style>
</head>
<body>
	<s:include value="/head.jsp"></s:include>
	<div id="suDiv">
					<table>
					<form action="suRegiterAction" method="post" onsubmit="return notation();">
						<tr>
							<td colspan="2" align="center" style="font-size: 30px">超级用户注册</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="font-size: 20px">
								<font color="red">${msg}</font>
							</td>
						</tr>
						<tr>
							<td class="toRight">用户名:</td>
							<td><input type="text" id="name" name="name"  onblur="checkName(),registerCheck()"/></td>
						</tr>
						<tr>
							<td></td>
							<td style="width:220px"><span id ="nameSpan"></span></td>
						</tr>
						<tr>
							<td class="toRight">密码:</td>
							<td><input type="password" id="password" name="password" onblur="checkPassword()"/></td>
						</tr>
						<tr>
							<td></td>
							<td><span id="passwordSpan"></span></td>
						</tr>
						<tr>
							<td class="toRight">确认密码:</td>
							<td><input type="password" id="rePassword" onblur="recheckPassword()"/></td>
						</tr>
						<tr>
							<td></td>
							<td><span id="repasswordSpan"></span></td>
						</tr>
						<tr>
							<td class="toRight">手机:</td>
							<td><input type="text" id="phone" name="phone" onblur="checkPhone()"/></td>
						</tr>
						<tr>
							<td></td>
							<td><span id="phoneSpan"></span></td>
						</tr>
						<tr>
							<td class="toRight">验证码:</td>
							<td>
								<input type="text" id="autoCode" name="autoCode" style="width:130px;"/>&nbsp;&nbsp;&nbsp;
								<img alt="验证码" src="AImg.img" title="点击更新图片" style="cursor:pointer" onclick="changeImage(this)">
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2" >
								<input type="reset" value="重置" class="dBtn"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="注册" class="dBtn"/>
							</td>
						</tr>
					</form>
					</table>
	</div>
	<s:include value="/foot.jsp"></s:include>
</body>
</html>