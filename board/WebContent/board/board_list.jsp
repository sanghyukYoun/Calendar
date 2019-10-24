<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 오류 페이지 정의  -->
<%@ page errorPage="board_error.jsp" %>

<!-- 자바 클래스 Import  -->
<%@ page import = "board.*" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 조회</title>

	<link rel="stylesheet" href="board.css" type="text/css" media="screen" />

	<script type="text/javascript">
		function retrivalcheck() {
			
			// get방식
			// document.location.href="addr_control.jsp?action=list";
			
			// post방식 디펄트가 list
			document.form1.action.value="list";
			document.form1.submit();
	
			
		}
	
		function editcheck(id) {
		
			// get방식
			// document.location.href="addr_control.jsp?action=edit&id="+id;
			
			// post방식
			document.form1.action.value="edit";
			document.form1.id.value=id;
			document.form1.submit();
	
			
		}
	</script>

</head>

<%
	// request 내장객체에서 accountTransferList를 get하여 클래스 변수에 저장
	ArrayList boardList = (ArrayList)request.getAttribute("boardList");

%>


<body>
	<div align=center>
	<H2>게시판 조회</H2>
	<HR>
	<a href="board_control.jsp?action=add">게시판 등록</a><BR>
	
	<!-- 게시판 목록 조회폼 -->
	<form name="form1" method="post" action="board_control.jsp">
		<input type="hidden" name="action" value="list">
		<input type="hidden" name="id" value=0>
	
		<table border=1>
			<tr>
				<td colspan=4 align=right>
    				<input type="button" value="조회" onClick="retrivalcheck()">
				</td>
			</tr>
			<tr>
				<th>ID</th>
				<th>성명</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
			<%
				if(boardList != null) {
					
						// boardList 변수 List 반복처리
						for(BoardDTO boardDTO : (ArrayList<BoardDTO>) boardList) {
			%>
						<tr>
							<td><a href="javascript:editcheck(<%=boardDTO.getId() %>)"><%=boardDTO.getId() %></a></td>
							<td><%=boardDTO.getUserName() %></td>
							<td><%=boardDTO.getTitle() %></td>
							<td><%=boardDTO.getContent() %></td>
						</tr>
			<%	
					}
				}
			%>
			</table>
		</form>
	</div>
</body>

</html>