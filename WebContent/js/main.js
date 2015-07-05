//检查用户名
function checkName(){
		var flag=true;
		var name=document.getElementById("name").value;
		if (isEmpty(name))return false;
		var span1=document.getElementById("nameSpan");
		var msg="^@^";
		var color="green";
		if(name.length<1||name.length>10){
			msg="用户名的长度为1-10个字符之间,但是您输入的长度为"+name.length;
			color="gray";
			flag=false;
		}
		if(name.indexOf(" ")!=-1){
			var spaceIndex=name.indexOf(" ")+1;
			msg="第"+spaceIndex+"个是空格,用户名中间不能有空格!";
			color="gray";
			flag=false;
		}
		span1.innerHTML="<font color='"+color+"'>"+msg+"</font>";
		return flag;
	}
		/**
	function ajaxCheck(val){
		var xmlHttpRequest=null;
		if(xmlHttpRequest==null){
		xmlHttpRequest=createXMLHttpRequest();
		}
		xmlHttpRequest.open("get","suRegisterServlet",true);
		xmlHttpRequest.onreadystatechange=CallBack;
		xmlHttpRequest.send(null);
		
	}
	function CallBack(){
			if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
				val.innerHTML=xmlHttpRequest.responseText;
			}
		}
		*/
//检查密码
	function checkPassword(){
		var password=document.getElementById("password").value;
		if (isEmpty(password))return false;
		var span2=document.getElementById("passwordSpan");
		var flag=true;
		var msg="^@^";
		var color="green";
		if(password.length<6||password.length>10){
			msg="密码的长度为6-10个字符之间,但是您输入的长度为"+password.length;
			color="gray";
			flag=false;
		}
		if(password.indexOf(" ")!=-1){
		var spaceIndex=password.indexOf(" ")+1;
			msg="第"+spaceIndex+"个是空格,密码中间不能有空格!";
			color="gray";
			flag=false;
		}
		span2.innerHTML="<font color='"+color+"'>"+msg+"</font>";
		return flag;
	}
	//确认密码
	function recheckPassword(){
		var flag=true;
		var password=document.getElementById("password").value;
		var rePassword=document.getElementById("rePassword").value;
		if (isEmpty(rePassword))return false;
		var repasswordSpan=document.getElementById("repasswordSpan");
		var msg="^@^";
		var color="green";
		if(rePassword==""){
			flag=false;
			color="gray";
			msg="确认密码框不能为空";
		}
		if(rePassword!=password){
			flag=false;
			color="gray";
			msg="两次密码输入不一致";
		}
		repasswordSpan.innerHTML="<font color='"+color+"'>"+msg+"</font>";
		return flag;
	}
	//验证手机号码
	function checkPhone(){
		
		var reg=/[0-9]/;
		var phone=document.getElementById("phone").value;
		if (isEmpty(phone))return false;
		var phoneSpan=document.getElementById("phoneSpan");
		var color="green";
		var msg="^@^";
		var flag=true;
		if(phone.trim().length!=11||!reg.test(phone)){
			flag=false;
			color="gray";
			msg="手机号必须为数字,长度为11位";
		}
		if(phone.indexOf(" ")!=-1){
			var space=phone.indexOf(" ")+1;
			flag=false;
			color="gray";
			
			msg="您输入的第"+space+"位是空格";
		}
		phoneSpan.innerHTML="<font color='"+color+"'>"+msg+"</font>";
		return flag;
	}
	function checkCode(){
		var autoCode=document.getElementById("autoCode");
		if (isEmpty(autoCode.value))return false;
		return true;
	}
	function isEmpty(val){
		var reg=/[\S]/g;//匹配非空字符
		return !reg.test(val);
	}
	//表单提交时的提醒
	function notation(){
		var flag=false;
		if(checkName()&&checkPassword()&&recheckPassword()&&checkPhone()&&checkCode()){
		var name=document.getElementById("name").value;
		var password=document.getElementById("password").value;
		
		flag=confirm("用户名:"+name+
				"\n密码:"+password);
		}else{
			var str="未通过验证,请检查后重新输入!";
		alert(checkName()==false?"name "+str:checkPassword()==false?"passwd "+str:recheckPassword()==false?"rePasswd "+str:
			checkPhone()==false?"phone "+str:checkCode()==false?"code "+str:"");
		}
		return flag;
	}
	//更新验证码
	function changeImage(img){
		img.src="AImg.img?"+new Date().getTime();
	}