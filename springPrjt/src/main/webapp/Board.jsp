<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
//목록조회 버튼 클릭 이벤트
$("#btnBoardList").click( function(){
	$.ajax({
		url : "./ajaxBoard",
		datatype : "xml",
		success : function(data){
			list = data.getElementsByTagName("board");
			//list = $(data).find("board");
			var str = "";
			for(i=0; i<list.length; i++){
				str += list[i].getElementsByTagName("title")[0].
				firstChild.nodeValue+"<br>"
				//str += $(list[i]).find("title").html() +"<hr>";
			}
			$("#list").html(str);
		}
	});
});
	
$("#btnSave").click(function() {
//쿼리문자열로 요청
$.ajax({
url : "./getParam.do",
data : $("#frm").serialize(), //쿼리문자열
method : "post",
type : "json",
success : function(data) {
$("#result").html("쿼리문자열로요청:"+data.writer +"," 
							   +data.content)
}
});
});
});
</script>
</head>
<body>
<button type="button" id="btnBoardList">목록조회</button>
<div id="list"></div>

<div id="result">응답결과: </div>
<form id="frm">
작성자<input type="text" name="writer"><br/>
제목<input type="text" name="title"><br/>
내용<textarea name="content"></textarea><br/>
<input type="button" id="btnSave" value="저장">
</form>
</body>
</html>