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
<meta charset="UTF-8">
<title>design</title>
<script type="text/javascript" src="js/XMLHttpRequestAjax.js"></script>
<script type="text/javascript">

	//设计问卷部分
		var i=1;//定义问题的name
	function create(val){
		var form=document.getElementById("form");
		//如果刚开始form里面没有内容
		//那么就给form里加上一个取问卷id的input标签
		if(val.title!="点击生成页面"&&form.innerHTML.trim().length==0){
			form.innerHTML+=
				"<input type='text' id='inputId' name='inputId' style='display:none;'/>";
		}
		if(val.value=="表单action"){
			var action=prompt("输入更改后的action","summitQuestionnaireAction");
			form.action=action;
		}
		if(val.value=="表单method"){
			var method=prompt("输入更改后的method","get");
			form.method=method;
		}
		if(val.value=="问题"){
			var qTxt=prompt("请输入问题的内容","text");
			form.innerHTML+=qTxt+"<br>";
		}
		if(val.value=="换行"){
			i=i+1;
			form.innerHTML+="<br>";
		}
		if(val.value=="单选框"){
			var raValue=prompt("输入单选框标识","radio");
			form.innerHTML+="<input type='radio' name='q"+i+"' value='"+raValue+"'/>"+raValue;
		}
		if(val.value=="多选框"){
			var ckValue=prompt("输入多选框标识","checkbox");
			form.innerHTML+="<input type='checkbox' name='q"+i+"' value='"+ckValue+"'/>"+ckValue;
		}
		if(val.value=="文本框"){
			i=i+1;
			var txtValue=prompt("输入文本框标识","txt");
			form.innerHTML+=txtValue+":<input type='text' name='q"+i+"'/><br>";
		}
		if(val.value=="密码框"){
			i=i+1;
			var pwdValue=prompt("输入密码框标识","pwd");
			form.innerHTML+=pwdValue+":<input type='password' name='q"+i+"'/><br>";
		}
		if(val.value=="提交按钮"){
			form.innerHTML+="<input type='submit' value='提交'/>";
		}
		if(val.value=="重置按钮"){
			form.innerHTML+="<input type='reset' value='重置'/>";
		}
		if(val.value=="问卷标题"){
			var titleArea=document.getElementById("titleArea");
			var title=document.getElementById("title");
			var titleValue=prompt("输入问卷标题","问卷标题");
			title.innerHTML=titleValue;
		}
		if(val.value=="问卷注解"){
			var description=document.getElementById("description");
			var disValue=prompt("输入问卷注解","问卷注解");
			description.innerHTML=disValue;
		}
		if(val.title=="点击生成页面"){
	 		var questionnaireName=prompt("输入要生成的页面的名字(推荐英文)","questionnaire1");
	 		if(questionnaireName!=null){
		 		val.href+="&name="+questionnaireName;
	 		}else{
		 		val.href="createNewFile";
	 		}
		}
	}
	//设计框控制按钮
 	function display(val){
 		var dInput=document.getElementsByName("dInput");
 		var qInput=document.getElementById("qInput");
 		var showDiv=document.getElementById("showDiv");
 		var showContent="<h1 align='center'><font id='title' >问卷调查</font></h1>"+
		 "<form action='summitQuestionnaire' method='post' id='form'></form>";
 		if(val.value=="+设计问卷"){
	 		showDiv.innerHTML=showContent;
			val.value="-设计问卷";
	 		for(var i in dInput){
	 			dInput[i].style.display="block";
	 		}
 		}
 		if(val.value=="-设计问卷"){
	 		showDiv.innerHTML=showContent;
 			val.value="+设计问卷";
	 		for(var i in dInput){
	 			dInput[i].style.display="none";
	 		}
 		}
 		if(val.value=="+查看问卷"){
 			val.value="-查看问卷";
 			qInput.style.display="block";
 		}else{
 			val.value="+查看问卷";
 			var selectNum=document.getElementById("selectNum");
 			selectNum.style.display="none";
 			qInput.style.display="none";
 		}
 	}
 	//保存问卷
 	function save(){
 		var showDiv=document.getElementById("showDiv");
 		var content=document.getElementById("content");
 		content.innerHTML=showDiv.innerHTML;
 		document.getElementById("saveQestion").submit();
 	}
 	//按条件查询问卷,用到Ajax技术
 	function query(val){
 		if(val.value==-1){//如果是-1,代表没有选则,就返回
 			var selectNum=document.getElementById("selectNum");
 			selectNum.style.display="none";
 			return;
 		}
 		var xmlHttpRequest=null;
 		var showDiv=document.getElementById("showDiv");
		if(xmlHttpRequest==null){
			xmlHttpRequest=createXMLHttpRequest();
		}
		var reg=/[a-zA-Z]/;//正则表达式,匹配字符串
		var param="";
		if(reg.test(val.value)){
		param="condition="+val.value;
		}else{
		param="selectNum="+val.value;
		}
			xmlHttpRequest.open("get","getQuestionnaire?"+param,true);
			xmlHttpRequest.onreadystatechange=function(){
				if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
					var content=xmlHttpRequest.responseText;
					
					var selectNum=document.getElementById("selectNum");
					if(val.value=="all")selectNum.style.display="none";
					if(val.value=="id"||val.value=="title"){//如果是id或者title
					selectNum.style.display="block";
					selectNum.innerHTML=content;
					}else{
					showDiv.innerHTML=content;
					}
				}
			};
			xmlHttpRequest.send(null);
 	}
 	function rm(val){
 		var rmTxt=document.getElementById("rmTxt");
 		rmTxt.value=val;//获得要rm的ID
 		document.getElementById("rmForm").submit();
 	}
 	//提示部分,保存成功提示成功,失败提示失败,如果有这个问卷,系统默认为不可覆盖
 	if("<s:property value='#request.msg'/>"!=""){
 		alert("<s:property value='#request.msg'/>");
 	}
</script>
<style type="text/css">
	#designDiv{
		float:left;
		width:21%;
		height:400px;
		border:1px solid lightgray;
		background: url(images/32.jpg);
	}
	#showDiv{
		width:78%;
		float:left;
		border:1px solid lightgray;
	}
	#footDiv{
		float:left;
		border:1px solid lightgray;
		margin-top: 0px;
		width:100%;
		height:100px;
	}
	select{
		color:#A0522D;
		width:95px;
	}
	.left{
		cursor:pointer;
		display: none;
		color:#A0522D;
		width:100%;
	}
	.left:hover,select:hover {
		color:white;
		background: #A0522D;
		display:block;
	}
	#dBtn{
		cursor:pointer;
		display: block;
		width:100%;
	}
	#dBtn:hover{
		background:#A0522D;
		color:white;
		cursor:pointer;
		display: block;
		width:100%;
	}
	.rm:hover{
		color:red;
	}
</style>
</head>
<body>
 <s:include value="head.jsp"></s:include>

 <div id="designDiv">
 	<input id="dBtn" type="button" value="+设计问卷" onclick="display(this)"/>
 	<table>
 		<tr>
 			<td><input class="left" name="dInput" type="button" value="问题" onclick="create(this)"/></td>
 			<td><input class="left" name="dInput" type="button" value="换行" onclick="create(this)"/></td>
 		</tr>
 		<tr>
 			<td><input class="left" name="dInput"  type="button" value="单选框" onclick="create(this)"/></td>
 			<td><input class="left" name="dInput" type="button" value="多选框" onclick="create(this)"/></td>
 		</tr>
 		<tr>
 			<td><input class="left" name="dInput" type="button" value="文本框" onclick="create(this)"/></td>
 			<td><input class="left" name="dInput" type="button" value="密码框" onclick="create(this)"/></td>
 		</tr>
 		<tr>
 			<td><input class="left" name="dInput" type="button" value="表单action" onclick="create(this)"/></td>
 			<td><input class="left" name="dInput" type="button" value="表单method" onclick="create(this)"/></td>
 		</tr>
 		<tr>
 			<td><input class="left" name="dInput"  type="button" value="重置按钮" onclick="create(this)"/></td>
 			<td><input class="left"  name="dInput" type="button" value="提交按钮" onclick="create(this)"/></td>
 		</tr>
 		<tr>
 			<td><input class="left" name="dInput" type="button" value="问卷注解" onclick="create(this)"/></td>
 			<td><input class="left" name="dInput"  type="button" value="问卷标题" onclick="create(this)"/></td>
 		</tr>
 		<tr>
 			<td colspan="2" align="center">
 				<form action="saveQuestionnaire" method="post" id="saveQestion">
 					 
				 	<input class="left" name="dInput" type="button" value="保存问卷" onclick="save()"
				 		style="background:green;color:white;width:90%;"/>
				 	<textarea id="content" name="content" style="display: none;"></textarea>
				 	<textarea id="titleArea" name="questionnaireName" style="display: none;">
				 		问卷调查
				 	</textarea>
				 	<textarea id="description" name="description" style="display: none;"></textarea>
		 		</form>
 			</td>
 		</tr>
 	</table>
	 	<input id="dBtn" type="button" value="+查看问卷" onclick="display(this)"/>
	 <table>
	 	<tr>
	 		<td>
	 			<select onclick="query(this)" id="qInput" style="display:none;">
	 				<option value="-1">选择条件</option>
	 				<option value="all">查询所有</option>
	 				<option value="id">按ID</option>
	 				<option value="title">按题目</option>
	 			</select>
	 		</td>
	 		<td>
	 			<select name="selectNum" id="selectNum" onchange="query(this)" style="display:none">
	 				<option value="-1">请选择</option>
	 			</select>
	 		</td>
	 	</tr>
	 </table>
	 <form action="rmQuestionnaire" method="post" id="rmForm">
	 	<input type="text" id="rmTxt" name="rmNum" style="display: none"/>
	 </form>
	 <input id="dBtn" type="button" value="结果分析" onclick="window.open('analysisAnswer.jsp')"/>
 </div>
 <div id="showDiv">
 	<h1 align="center"><font id="title" >问卷调查</font></h1>
	 <form action="summitQuestionnaire" method="post" id="form"> 
	 </form>
 </div>
 <div id="footDiv">
	 <s:include value="foot.jsp"></s:include>
 </div>
</body>
</html>