//在生成问卷的时候，把问卷的id放入span里面
//生成问卷之后利用js把span里的内容赋给form表单里的id为inputId的输入框
//这样在提交的时候就自动获得了问卷的id，就可以方便的把问卷和答案关联起来了
window.onload=function(){
	var idSpan=document.getElementById("idSpan").innerHTML;
	var inputId=document.getElementById("inputId");
	inputId.value=idSpan;
};
//一个js调用另外一个js中的方法
//document.write("<script type='text/javascript' src='b.js'></script>");
