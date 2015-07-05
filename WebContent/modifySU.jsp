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
<script type="text/javascript" src="js/main.js"></script>
<title>modifySU</title>
<style type="text/css">
	.modifyInfo{
		algin:center;
		border:1px solid lightgray;
		height:400px;
		background: url(images/29.jpg);
	}
	.changeBtn{
		background: skyblue;
		color:white;
		border-radius:10px;
		width:100%;
		cursor:pointer;
	}
	table{
		margin-top:1%;
		border:1px solid lightgray;
		border-radius:15px;
	}
	.lTd{
		text-align: right;
	}
</style>
<script type="text/javascript">
	if("<s:property value='#request.msg'/>"!=""){
		alert("<s:property value='#request.msg'/>");
	}
</script>
</head>
<body>
	<s:include value="head.jsp"/>
	<div class="modifyInfo" align="center">
		<form action="suModifyAction" method="post" onsubmit="return notation()">
		<table> 
			<tr>
				<td colspan="2" align="center" style="font-size: 30px">修改管理员</td>
			</tr>
			<tr>
				<td class="lTd">用户名:</td>
				<td><input type="text" id="name" name="name" onblur="checkName()" 
					value="<s:property value='#session.su.name'/>"/>
				</td>
			</tr>
			<tr>
				<td></td>
				<td style="width:220px"><span id ="nameSpan"></span></td>
			</tr>
			<tr>
				<td class="lTd">旧密码:</td>
				<td><input type="password"  name="oldPassword" /></td>
			</tr>
			<tr>
				<td class="lTd">新密码:</td>
				<td><input type="password" id="password" name="newPassword" onblur="checkPassword()"/></td>
			</tr>
			<tr>
				<td></td>
				<td><span id ="passwordSpan"></span></td>
			</tr>
			<tr>
				<td class="lTd">确认密码:</td>
				<td><input type="password" id="rePassword" name="rePassword"  onblur="recheckPassword()"/></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="repasswordSpan"></span></td>
			</tr>
			<tr>
				<td class="lTd">手机号:</td>
				<td><input type="text" id="phone" name="phone" onblur="checkPhone()"
					value="<s:property value='#session.su.phone'/>"/>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><span id="phoneSpan"></span></td>
			</tr>
			<tr>
				<td class="lTd">验证码:</td>
				<td>
					<input type="text" name="autoCode" style="width:160px"/>
					<img alt="验证码" src="AImg.img" title="点击更新图片" style="cursor:pointer" onclick="changeImage(this)">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="保存修改" class="changeBtn"></td>
			</tr>
		</table>
					
			
		</form>
	</div>
	
	<s:include value="foot.jsp"/>
</body>
</html>