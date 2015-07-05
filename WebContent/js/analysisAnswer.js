function query(val){
		var xmlHttpRequest=null;
			if(xmlHttpRequest==null){
				xmlHttpRequest=createXMLHttpRequest();
			}
			var choiseList=document.getElementById("choiseList");
			var param="";
			if(choiseList.value=="1"){
				var questionNum=document.getElementById("questionNum");
					param="questionNum="+questionNum.value;
			}else{
				var customerList=document.getElementById("cList");
					param="customerList="+customerList.value;
			}
				xmlHttpRequest.open("get","getAnswer?"+param,true);
				xmlHttpRequest.onreadystatechange=function(){
					if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
						var dom=xmlHttpRequest.responseText;
						var area=document.getElementById("area");
						if(choiseList.value=="1"){
							showByQuestion(dom,area);
						}else{
							showByCustomer(dom,area,val);
						}
					}
				};
				xmlHttpRequest.send(null);
	}
	function showByCustomer(dom,area,val){
			area.innerHTML="";
			var c=dom.split("^");
			var th=document.createElement("tr");
			var q=c[0].split("|");
			if(val=="柱状图查询"){
				var count=0;
				var zhuSpan=document.getElementById("zhuSpan");
				for(var i in c){
					count=0;
					var qq=c[i].split("|");
					if(c[i].trim()!=""){
						for(var j in qq){
							if(qq[j].trim()!=""){
								qq[j]=="是"||qq[j]=="非常满意"||qq[j]=="有"
								?count+=10:null;
							}
						}
								zhuSpan.innerHTML+=
									"<table  id='showTable' style='float:left;height:"+(count*5)+"px;background:red;margin-left:1px;'><tr><td>c"+(parseInt(i)+1)+"</br>"+count+"</td></tr></table>";
					}
				}
			}else{
				for(var m in q){
					if(q[m].trim()!=""){
						th.setAttribute("bgcolor","#E0EEE0");
						th.setAttribute("align","center");
						var td=document.createElement("td");
						var font=document.createElement("font");
						font.setAttribute("color","green");
						font.appendChild(document.createTextNode(m==0?"c":("q"+parseInt(m))));
						td.appendChild(font);
						th.appendChild(td);
						area.appendChild(th);
					}
				}
				for(var i in c){
					var qq=c[i].split("|");
					if(c[i].trim()!=""){
						var tr=document.createElement("tr");
						for(var j in qq){
							if(qq[j].trim()!=""){
								var td=document.createElement("td");
								td.setAttribute("align","center");
								td.appendChild(document.createTextNode(qq[j]));
								tr.appendChild(td);
								area.appendChild(tr);
							}
						}
					}
				}
			}
	}
	function showByQuestion(dom,area){
		area.innerHTML="";
		var c=dom.split("|");
		var reg=/[|]/;
		if(reg.test(dom)){
			for(var i in c){
				if(c[i].trim()!=""){
				area.innerHTML+="customor"+(parseInt(i)+1)+":"+c[i]+"</br>";
				}
			}
		}else{
			area.innerHTML+=dom;
		}
		
	}
	function showList(list){
		var showSpan=document.getElementById("showSpan");
		if(list.value=="1"){
		showSpan.innerHTML="问题<input type='text' id='questionNum' name='questionNum' value='1' style='width:50px;'/>";
		}else{
			showSpan.innerHTML=
					"显示<select id='cList' name='cList'>"+
							"<option value='1'>1</option>"+
							"<option value='30'>30</option>"+
							"<option value='70'>70</option>"+
							"<option value='100'>100以上</option>"+
						"</select>";
		}
	}