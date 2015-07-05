<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<style type="text/css">
.div1{
	background: url(images/back.jpg);
	border: 1px solid lightgray;
}
.div2 {
	width: 300px;
	height: 270px;
	margin-left: 60%;
	margin-top: 10%;
}

.div3 {
	margin: 0px; width : 49%;
	width: 49%;
	height: 10%;
	float: left;
	background-color: #99CCFF;
	text-align: center;
	font-size: large;
	border-radius: 5px;
	line-height: 30px;
	cursor: pointer;
}


.div4 {
	margin: 0px;
	width: 49.5%;
	height: 10%;
	float: left;
	margin-left:1px;
	background-color: #7EC0EE;
	text-align: center;
	font-size: large;
	border-radius: 5px;
	line-height: 30px;
	cursor: pointer;
}
.div5 {
	display: none;
	float: left;
	width: 99%;
	height: 89%;
	background:  lavender;
	border-radius:5px;
	border: 1px solid white;
}

.div6 {
	float: left;
	width: 99%;
	height: 89%;
	background: lavender;
	border-radius:5px;
	border: 1px solid white;
}
.div7 {
	margin-top:auto;
	margin-left:10%;
}
 input{
	width:170px;
}
 #loginBtn{
	width:100%;
	color:white;
	background: green;
	border-radius:5px;
}
 #findBtn{
	width:10%;
	color:white;
	background: green;
	border-radius:5px;
	cursor:pointer;
}
a{
	text-decoration: none;
}
.lTd{
	text-align: right; 
}
</style>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">
	function show(d) {
		var div3 = document.getElementById("div3");
		var div4 = document.getElementById("div4");
		var div5 = document.getElementById("div5");
		var div6 = document.getElementById("div6");
		if (d.id == "div3") {
			div4.style.background="#7EC0EE";
			div6.style.display = "none";
			div5.style.display = "block";
			div3.style.background="#99CCFF";
		} else {
			div3.style.background="#7EC0EE";
			div6.style.display = "block";
			div5.style.display = "none";
			div4.style.background="#99CCFF";
		}
	}
	if("<s:property value='#request.msg'></s:property>"!=""){
		alert("<s:property value='#request.msg'></s:property>");
	}
	function displayForm(){
		var findPassword=document.getElementById("findPassword");
		findPassword.style.display="block";
	}
</script>
</head>
<body>
	<s:include value="head.jsp"></s:include>
	
	<div id="div1" class="div1">
		<form action="findPasswordAction" method="post" style="display:none" id="findPassword">
			用户名:<input type="text" name="name" value="<s:property value='#session.su.name'/>"/>
			手机号:<input type="text" name="phone"/>
			<input type="submit" value="找回密码" id="findBtn">
		</form>
		<div id="div2" class="div2">
			<div id="div4" class="div4" onclick="show(this)">超级管理员登陆</div>
			<div id="div3" class="div3" onclick="show(this)">普通用户登陆</div>
			<div id="div6" class="div6">
				<form id="suForm" action="suLoginAction" method="post" >
				<table>
					<tr>
						<td class="lTd">管理员:</td>
						<td><input id="name" type="text" name="name" onblur="checkName()"
							value="<s:property value='#session.su.name'/>"/></td>
					</tr>
					<tr>
						<td></td>
						<td style="width:220px"><span id ="nameSpan"></span></td>
					</tr>
					<tr>
						<td class="lTd">密码:</td>
						<td>
							<input id="password" type="password" name="password" onblur="checkPassword()"/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id ="passwordSpan"></span></td>
					</tr>
					<tr>
						<td class="lTd">验证码:</td>
						<td>
							<input type="text" name="autoCode" style="width:100px"/>
							<img alt="验证码" src="AImg.img" title="点击更新图片" style="cursor:pointer" onclick="changeImage(this)">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="checkbox" value="true" name="autoLogin" onchange="auLogin(this.value)"/>自动登陆
						</td>
					</tr>
					<tr>
						<td colspan="2"><input id="loginBtn" type="submit" value="登        陆"/></td>
					</tr>
				</table>
				</form>
				<div class="div7">
					<font onclick="displayForm()" style="cursor:pointer" color="blue">忘记密码</font>
					<a href="modifySU.jsp">修改信息 | </a>
					<a href="superuser/suRegister.jsp">立即注册 </a>
				</div>
			</div>
			<div id="div5" class="div5">
				<form id="userForm" action="userLoginAction" method="post">
				<table border="1">
					<tr>
						<td class="lTd" style="width:220px">普通帐号:</td>
						<td><input type="text" id="nname" name="name" onblur="checkName()" 
								value="<s:property value='#session.user.name'/>"/></td>
					</tr>
					<tr>
						<td></td>
						<td><span id ="nameSpan"></span></td>
					</tr>
					<tr>
						<td class="lTd">密码:</td>
						<td><input type="password" id="npassword" name="password" onblur="checkPassword()"/></td>
					</tr>
					<tr>
						<td></td>
						<td><span id ="passwordSpan"></span></td>
					</tr>
					<tr>
						<td colspan="2"><input id="loginBtn" type="submit" value="登        陆"/></td>
					</tr>
				</table>
				</form>
				<div class="div7">
					<font onclick="displayForm()" style="cursor:pointer" color="blue">忘记密码</font>
					<a href="modifySU.jsp">修改信息 | </a>
					<a href="user/userRegister.jsp">立即注册 </a>
				</div>
				</div>
		</div>
	</div>
	<s:include value="foot.jsp"></s:include>
</body>
</html>