<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bean.DAO" %>
<title>�α���Ȯ��</title>

<jsp:useBean id="dto" class="bean.DTO"/>
<jsp:setProperty property="*" name="dto" />

<%
	DAO dao = new DAO();
	boolean result = dao.loginCheck(dto);
	String chkbox=request.getParameter("logining");
	if(result==true)
	{	
		if(chkbox!=null)
		{
			session.setAttribute("email", dto.getEmail());
			response.sendRedirect("main.jsp");
			System.out.println(chkbox);
		}
    }else
  	{%>
		<script>
			alert("���̵�/��й�ȣ �ٽ� �Է����ּ���.");
			history.go(-1);
		</script>  
  <%}%>