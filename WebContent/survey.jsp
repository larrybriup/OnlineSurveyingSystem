<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+
						request.getServerPort()+path+"/";
					%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%= basePath%>">
<title>问卷调查系统</title>
<script type="text/javascript">
if("<s:property value='#request.msg'></s:property>"!=""){
	alert("<s:property value='#request.msg'></s:property>");
}
</script>
	<style type="text/css">
		body{
			background:url(images/back.jpg);
			background-attachment: fixed;
			margin:auto;
		}
		div{
			margin:auto;
			border:1px solid lightgray;
			color:green;
		}
		h2{
			text-align:center;
		}
		.submit,.reset{
			color:white;
			background:green;
			margin-left:100px;
			border-radius:5px;
		}
	</style>
	
</head>
<body>
	<table>
		<tr>
			<td><a href="userLogoutAction">注销&nbsp;&nbsp;</a></td>
			<td><s:property value="#session.user.name"/></td>
			<td>&nbsp;&nbsp;登陆时间：<s:date name="#session.user.latestdate" format="yyyy年MM月dd日 hh:mm:ss E " /></td>
		</tr>
	</table>
	<div>
	<h2>认真做完您将获得手机话费1000积分的奖励</h2>
	<form action="summitQuestionnaire" method="post" onsubmit="confm()">
	<ol>
		<li>
		<p>您是否持有我行银行卡?</p>
			<input type="radio" name="q1" value="是"/>是
			<input type="radio" name="q1" value="否"/>否
			<input type="radio" name="q1" value="曾经"/>曾经
			<input type="radio" name="q1" value="准备"/>准备
		</li>
		<li>
		<p>我行的网上银行是否为您带来了方便?</p>
			<input type="radio" name="q2" value="是"/>是
			<input type="radio" name="q2" value="否"/>否
		</li>
		<li>
		<p>您投资过股票吗?</p>
			<input type="radio" name="q3" value="是"/>是
			<input type="radio" name="q3" value="否"/>否
		</li>
		<li>
		<p>您近期有投资的打算吗?</p>
			<input type="radio" name="q4" value="有"/>有
			<input type="radio" name="q4" value="没有"/>没有
		</li>
		<li>
		<p>如果可以,您打算拿多少来投资?</p>
			<input type="radio" name="q5" value="1元以上"/>1元以上
			<input type="radio" name="q5" value="1000元以上"/>1000元以上
			<input type="radio" name="q5" value="10000元以上"/>10000元以上
			<input type="radio" name="q5" value="50000元以上"/>50000元以上
		</li>
		<li>
		<p>您对我们的服务满意吗?</p>
			<input type="radio" name="q6" value="非常满意"/>非常满意
			<input type="radio" name="q6" value="满意"/>满意
			<input type="radio" name="q6" value="基本满意"/>基本满意
			<input type="radio" name="q6" value="不满意"/>不满意
		</li>
		<li>
		<p>您都持有哪些银行卡?</p>
			<input type="checkbox" name="q7" value="建设银行"/>建设银行
			<input type="checkbox" name="q7" value="农业银行"/>农业银行
			<input type="checkbox" name="q7" value="光大银行"/>光大银行
			<input type="checkbox" name="q7" value="浦发银行"/>浦发银行
			<input type="checkbox" name="q7" value="广发银行"/>广发银行
			<input type="checkbox" name="q7" value="中信银行"/>中信银行
			<input type="checkbox" name="q7" value="兴业银行"/>兴业银行<br/>
			<input type="checkbox" name="q7" value="邮政银行"/>邮政银行
			<input type="checkbox" name="q7" value="民生银行"/>民生银行
			<input type="checkbox" name="q7" value="农村信用社银行"/>农村信用社<br/>
			<input type="checkbox" name="q7" value="其他"/>其他
		</li>
		<li>
		令您满意的理由是?<br/>
			<textarea name="q8" rows="5" cols="53"></textarea>
		</li>
		<li>
		您认为我们在那些方面需要改进?(必填一项)<br/>
			1,<input type="text" name="q9"/><br />
			2,<input type="text" name="q9"/><br />
			3,<input type="text" name="q9"/>
		</li>
		<li>
		您的家庭月收入<br/>
		<table >
			<tr>
				<td></td>
				<td>1000</td>
				<td>1000-3000</td>
				<td>3000-5000</td>
				<td>5000-8000</td>
			</tr>
			<tr align="center">
				<td>您本人:</td>
				<td><input type="radio" name="q10" value="1000"/></td>
				<td><input type="radio" name="q10" value="1000-3000"/></td>
				<td><input type="radio" name="q10" value="3000-5000"/></td>
				<td><input type="radio" name="q10" value="5000-8000"/></td>
			</tr>
			<tr align="center">
				<td>您的妻子:</td>
				<td><input type="radio" name="q11" value="1000"/></td>
				<td><input type="radio" name="q11" value="1000-3000"/></td>
				<td><input type="radio" name="q11" value="3000-5000"/></td>
				<td><input type="radio" name="q11" value="5000-8000"/></td>
			</tr>
			<tr align="center">
				<td>其他: </td>
				<td><input type="radio" name="q12" value="1000"/></td>
				<td><input type="radio" name="q12" value="1000-3000"/></td>
				<td><input type="radio" name="q12" value="3000-5000"/></td>
				<td><input type="radio" name="q12" value="5000-8000"/></td>
			</tr>
		</table>
		</li>
		<li>
			请输入您的手机号:<input type="text" name="q13" id="phone"/><br />
			再次确认:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;<input type="text" id="rePhone"/><br />
		</li>
	<input class="reset" type="reset" value="重置"/>
	<input class="submit" type="submit" value="提交"/>
	</ol>
	</form>
	</div>
</body>
</html>
</html>