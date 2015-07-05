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
	<style type="text/css">
		body{
			background: url(images/back.jpg);
			background-repeat: no-repeat;
			margin-top:auto;
		}
		h1{
		text-align:center;
		color:green;
		font-style: italic;;
		}
		table{
			margin:auto;
			color:green;
			margin-top:auto;
			text-align: center;
		}
		.container{
			witdh:800px;
			height:530px;
			border:1px solid silver;
			margin:auto;
			margin-top:10px;
			margin-left:250px;
			float:left;
		}
		.L1{
			font-size: 20px;
			font-style: inherit;
			color:gold-white;
			text-align:center;
		}
		.L3{
			text-align: left;
			padding-left: 10px;
			color:gray;
			font-size: 14px;
			font-family: monospace;
		}
		input,textarea{
			border:1px solid green;
			border-radius:5px;
		}
		.submit,.reset{
			color:white;
			background-color: green;
			font-weight: 500;
		}
	</style>

<title>register</title>
</head>
<body>
	<div class="container">
	<marquee direction="right"><h1>欢迎注册!</h1></marquee>
	<hr/>
	<form action="userRegisterAction" method="post">
		<table>
			<tr>
				<td class="L1">昵称:</td>
				<td><input type="text" id="name" name="name"/></td>
				<td class="L3">例如:毛袋鼠</td>
			</tr>
			<tr>
				<td class="L1">密码:</td>
				<td><input type="password" name="password"/></td>
				<td class="L3">至少六位字符,字母或者数字</td>
			</tr>
			<tr>
				<td class="L1">性别:</td>
				<td><input type="radio" name="gender" value="0"/>男
					<input type="radio" name="gender" value="1"/>女
				</td>
				<td class="L3">请如实选择</td>
			</tr>
			<tr>
				<td class="L1">年龄:</td>
				<td><input type="text" name="age"/></td>
				<td class="L3">未满18岁禁止注册!</td>
			</tr>
			<tr>
				<td class="L1">手机:</td>
				<td><input type="text" name="phone"/></td>
				<td class="L3">填写您当前正在使用的手机</td>
			</tr>
			<tr>
				<td class="L1">邮箱:</td>
				<td><input type="text" name="email"/></td>
				<td class="L3">注意邮箱格式!</td>
			</tr>
			<tr>
				<td class="L1">爱好:</td>
				<td><input type="checkbox" name="hoppy" value="0"/>足球
					<input type="checkbox" name="hoppy" value="1"/>篮球
					<input type="checkbox" name="hoppy" value="2"/>排球
				</td>
				<td class="L3">没有爱好可以不选</td>
			</tr>
			<tr>
				<td class="L1">所在城市:</td>
				<td>
					<select name="city">
						<option value="-1">请选择</option>
						<option value="0">北京</option>
						<option value="2">上海</option>
						<option value="3">郑州</option>
						<option value=4>武汉</option>
					</select>
				</td>
				<td class="L3">没有所在城市可以不选</td>
			</tr>
			<tr>
				<td class="L1">人生格言:</td>
				<td>
					<textarea rows="6" cols="20" name="proverb"></textarea>
				</td>
				<td class="L3">写出你的人生格言</td>
			</tr>
			<tr>
				<td class="L1">确认信息后:</td>
				<td>
					<input class="submit" type="submit" value="注册"/>
				</td>
				<td align="left">
					<input class="reset" type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>