<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.bean.DAO" %>
<title>ȸ������Ȯ��â</title>

<jsp:useBean id="dto" class="member.bean.DTO" />
<jsp:setProperty name="dto" property="*" />

<%
	DAO dao = new DAO();
	int result = dao.memberInput(dto);
%>

<%
	if(result==1){ %>
		<script>
			alert("ȸ������ ����");
			window.location="/member/login/login.jsp";
		</script>
<%	}else{ %>
		<script>
			alert("�߸��Է�");
			history.go(-1);
		</script>
<%	} %>
