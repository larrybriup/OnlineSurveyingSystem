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
<style type="text/css">
	table{
		border:1px solid lightgray;
		text-align: center;
		}
	td{
		text-align: center;
	}
	table .head{
		background-color:#EE3B3B;
	}
	.qHead{
		text-align: left;
		
	}
</style>
<script type="text/javascript">
	function confirm(){
		var q1=document.getElementsByName("q1");
		var flag=false;
		//flag=isChecked(q1);
		alert(isChecked(q1));
		alert(flag);
		return flag;
	}
	function isChecked(val){
		var falg=false;
		for(var i in val){
			if(val[i].checked){
				flag=true;
			}
		}
		return flag;
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td><a href="userLogoutAction">注销&nbsp;&nbsp;</a></td>
			<td><s:property value="#session.user.name"/></td>
			<td>&nbsp;&nbsp;登陆时间：<s:date name="#session.user.latestdate" format="yyyy年MM月dd日 hh:mm:ss E " /></td>
		</tr>
	</table>
	<center><h2>郑州大学课程调研系统</h2><hr/>
	<form action="summitQuestionnaire" method="post" onsubmit="confirm()">
	<table >
		<tr class="head" >
			<td width="60%"></td>
			<td width="8%">非常满意</td>
			<td width="7%">满意</td>
			<td width="8%">基本满意</td>
			<td width="7%">不满意</td>
			<td width="9%">非常不满意</td>
		</tr>
		<tr>
			<td class="qHead">1,您认为老师对课堂时间的把握度</td>
			<td><input type="radio" name="q1" value="100"/></td>
			<td><input type="radio" name="q1" value="80"/></td>
			<td><input type="radio" name="q1" value="60"/></td>
			<td><input type="radio" name="q1" value="40"/></td>
			<td><input type="radio" name="q1" value="20"/></td>
		</tr>
		<tr>
			<td class="qHead">2,老师讲的课你能听懂吗？</td>
			<td><input type="radio" name="q2" value="100"/></td>
			<td><input type="radio" name="q2" value="80"/></td>
			<td><input type="radio" name="q2" value="60"/></td>
			<td><input type="radio" name="q2" value="40"/></td>
			<td><input type="radio" name="q2" value="20"/></td>
		</tr>
		<tr>
			<td class="qHead">3,老师对知识的理解度</td>
			<td><input type="radio" name="q3" value="100"/></td>
			<td><input type="radio" name="q3" value="80"/></td>
			<td><input type="radio" name="q3" value="60"/></td>
			<td><input type="radio" name="q3" value="40"/></td>
			<td><input type="radio" name="q3" value="20"/></td>
		</tr>
		<tr>
			<td class="qHead">4,老师分配的课堂练习时间够吗</td>
			<td><input type="radio" name="q4" value="100"/></td>
			<td><input type="radio" name="q4" value="80"/></td>
			<td><input type="radio" name="q4" value="60"/></td>
			<td><input type="radio" name="q4" value="40"/></td>
			<td><input type="radio" name="q4" value="20"/></td>
		</tr>
		<tr>
			<td class="qHead">5,课后作业多吗</td>
			<td><input type="radio" name="q5" value="100"/></td>
			<td><input type="radio" name="q5" value="80"/></td>
			<td><input type="radio" name="q5" value="60"/></td>
			<td><input type="radio" name="q5" value="40"/></td>
			<td><input type="radio" name="q5" value="20"/></td>
		</tr>
		<tr>
			<td class="qHead">6,对教材的难易程度，您感觉？</td>
			<td><input type="radio" name="q6" value="100"/></td>
			<td><input type="radio" name="q6" value="80"/></td>
			<td><input type="radio" name="q6" value="60"/></td>
			<td><input type="radio" name="q6" value="40"/></td>
			<td><input type="radio" name="q6" value="20"/></td>
		</tr>
		<tr>
			<td class="qHead">7,列出您不懂的几点（至少一点）</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td class="qHead">
				(1)<input type="text" name="q7"/><br/>
				(2)<input type="text" name="q8"/><br/>
				(3)<input type="text" name="q9"/>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td class="qHead">
				8,您认为在今后的学习当中应该怎么提升自己的能力？
				<textarea cols="40" rows="4" name="q9"></textarea>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="6">
				<input type="reset" value="重置"/>
				<input type="submit" value="提交"/>
			</td>
		</tr>
	</table>
</form>
	</center>
</body>
</html>