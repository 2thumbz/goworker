<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Member.bean.MemberDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:useBean class="Member.bean.MemberDTO" id="dto" />
<jsp:setProperty property="*" name="dto"/>
<%
    MemberDAO dao = new MemberDAO();
	int result = dao.memberUpdate(dto);
	if(result == 1){%>		
		<script>
			alert("수정 되었습니다..");
			window.location='myPage.jsp';
		</script>
	<%}else{ %>
		<script>
			alert("잘못된 입력이 있습니다. 확인하세요..");
			history.go(-1);
		</script>
	<%}%>