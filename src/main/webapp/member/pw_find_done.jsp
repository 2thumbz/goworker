<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>done</title>

<div align="center">
<h2>��й�ȣ ã��</h2>
</div>
<%
String email = request.getParameter("email");
%>
	
<div align="center">
	<table border="1">
		<tr>
			<td align="center"><FONT face="Impact">"<%=email %>" ���� <br>��й�ȣ �缳�� ��ũ�� �߼۵Ǿ����.</FONT></td>
		</tr>
		<tr>
			<td align="center"> <small> 5�г��� go-worker�� ���� ������ ���� ���ϼ̴ٸ�<br/> ���� ������ Ȯ�����ּ���. </small></td>
		</tr>
	</table>
</div>
