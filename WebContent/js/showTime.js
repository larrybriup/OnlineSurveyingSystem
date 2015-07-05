function showTime(){
		var date=new Date();
		var tSpan=document.getElementById("tSpan");
		var week=date.getDay();
		var year=date.getFullYear();
		var month=date.getMonth();
		var day=date.getDate();
		var minutes=date.getMinutes();
		var strMi=minutes<10?"0"+minutes:minutes;
		var seconds=date.getSeconds();
		var strSec=seconds<10?"0"+seconds:seconds;
		var wk=null;
		switch (week) {
		case 1:
			wk="星期一";
			break;
		case 2:
			wk="星期二";
			break;
		case 3:
			wk="星期三";
			break;
		case 4:
			wk="星期四";
			break;
		case 5:
			wk="星期五";
			break;
		case 6:
			wk="星期六";
			break;
		default:
			wk="星期七";
			break;
		}
		tSpan.innerHTML=year+"年"+month+"月"+day+"日 "+date.getHours()+":"+strMi+":"+strSec+" "+wk;
	}
	setInterval("showTime()",0);