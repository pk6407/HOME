/**
 * 로그인/상신/결재 ㅊ리 
 */

var approv={};

var webSocket;
approv.MessageFormat=function(json){
	var str = "미결재 현황 > ";
	str += "<span class='approv'>기안 : </span> <span class='approv_cnt'>" + json.draftCnt + "</span> | ";
	str += "<span class='approv'>품의 : </span> <span class='approv_cnt'>" + json.stuffCnt + "</span> | ";
	str += "<span class='approv'>근태 : </span> <span class='approv_cnt'>" + json.attendanceCnt + "</span> | ";
	
	return str;
}


approv.init= function(){
	if(webSocket == null){
		webSocket = new WebSocket("ws://localhost:9999/ws");
	}
	
	$('#btnLogin').click(function(){
		approv.login();
	});
	
	$('#btnClear').click(function(){
		$('#userInfo').html("");
	});
	
	
	webSocket.onmessage = function(msg){
		console.table('receice msg : ' + msg.data);
		var json = JSON.parse(msg.data);
		console.log('receice json draftCnt : ' + json.draftCnt);
		$('#userInfo').html(approv.MessageFormat(json));
		//$('#myInfo').html(json.mid);
	}	
	
	//내정보 가져오기
	var myInfo = JSON.parse(sessionStorage.getItem('myInfo'));
	if(myInfo != null){
	
		$.ajax({
			url   : 'approv.do',
			data  : myInfo,
			dataType : 'json',
			success : function(data){
				if(data != null) {
					$('#userInfo').html("결재가 정상적으로 상신됨");
				}
				var btn = "<input type='button' value='로그아웃' onclick='approv.logOut()'>";
				$('#userInfo').html(approv.MessageFormat(data) + btn);
				
			}
		})
		
	}else{
		$('#userInfo').html("로그인하세요");
	}

	
}


approv.login = function(){
	var param = $('#frm_login').serialize();
	$.ajax({
		url   : 'login.do',
		data  : param, 
		type  : 'POST',
		dataType : 'json',
		success : function(data){
			var btn = "<input type='button' value='로그아웃' onclick='approv.logOut()'>";
			$('#userInfo').html(approv.MessageFormat(data) + btn);
			var newData = new Data(data, "login").getJson();
			sessionStorage.setItem('myInfo', newData);
			console.log("data : " + newData );				
			webSocket.send(newData);
			$('#main').html("<div class='afterLogin'>콜라4조의 인트라넷</div>");
			
		}
	})
}

approv.approv = function(){
	if(webSocket == null){
		alert('먼저 로그인을...');
		return;
	}
	
	//상사에게 상신 메시지 전달
	var upInfo = JSON.parse(sessionStorage.getItem('myInfo'));
	upInfo.command='approv';
	upInfo.classNo= Number(upInfo.classNo)+1;
	
	$.ajax({
		url   : 'approv.do',
		data  : upInfo,
		dataType : 'json',
		success : function(data){
			if(data != null) {
				$('#userInfo').html("결재가 정상적으로 상신됨");
			}
			//$('#userInfo').html(approv.MessageFormat(data));
			var newData = new Data(data, "approv").getJson();
			console.log("data : " + newData );				
			console.log('session : ' + (JSON.stringify(data)) );
			webSocket.send(newData);
			
			
		}
	})

};




approv.accept = function(){
	if(webSocket == null){
		alert('먼저 로그인을...');
		return;
	}
	$.ajax({
		url   : 'accept.do',
		data  : param, 
		type  : 'POST',
		dataType : 'json',
		success : function(data){
			$('#userInfo').html(approv.MessageFormat(data));
			var newData = new Data(data, "accept").getJson();
			console.log("data : " + newData );				
			webSocket.send(newData);
			
			
		}
	})
};


approv.logOut = function(){
	sessionStorage.setItem('myInfo', null);
	location.href="logout.do";
}	



function Data(json, command) {
	this.empNo = json.empNo;
	this.departNo = json.departNo;
	this.classNo = json.classNo;
	this.command = command;
	this.draftCnt = json.draftCnt;
	this.stuffCnt = json.stuffCnt;
	this.attendanceCnt = json.attendanceCnt;
	
	this.getJson = function() {
		return JSON.stringify(this);
	}
}

approv.init();