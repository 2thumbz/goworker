<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.bean.Cookies" %>
	<%
		response.addCookie(Cookies.createCookie("AUTH","","/", 0)); //��Ű ����
		session.invalidate();  //���� ����
		response.sendRedirect("main.jsp");
	%>