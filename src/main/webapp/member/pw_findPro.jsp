<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>pw_findPro.jsp �̸��� ���Ե� ����Ȯ��</title>
<%@ page import="member.bean.DAO" %>

<jsp:useBean id="dto" class="member.bean.DTO"/>
<jsp:setProperty property="email" name="dto" />

<%
	DAO dao = new DAO();
	boolean result = dao.emailCheck(dto);
	if(result==true){%>
		<jsp:forward page="pw_find_done.jsp" ></jsp:forward>
<%  }else{%>
		<script>
			alert("���Ե� �̸��������� �ƴմϴ�.");
			history.go(-1);
		</script>	
  <%}
%>

