<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<%@ page import="java.net.URLDecoder" %>
<%@ page import="member.bean.Cookies" %>
<title>Main.jsp</title>
<%
	Cookies cookies= new Cookies(request);
	if(cookies.exists("AUTH"))
	{
%>
		�̸��� "<%= cookies.getValue("AUTH") %>"�� �α��� �� ���� <br/>
		<a class="button success" href="/member/apply/apply.jsp">ȸ������</a>
		<a class="button success" href="logout.jsp">�α׾ƿ�</a>
<%
	}
	else
	{
%>		
		<a class="button success" href="/member/apply/apply.jsp">ȸ������</a>
		<a class="button success" href="login.jsp">�α���</a>
<%
	}
%>

=======
<title>Main.jsp</title>
<%
String e = (String)session.getAttribute("email");
%>

<%=e%> �α��� ��.
>>>>>>> parent of 31bd6ce (Delete main.jsp)
