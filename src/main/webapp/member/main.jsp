<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

