<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<title>ȸ������</title>

<script>
	function blankCheck()
	{
		if(id=="")
		{
			alert("�г����� �Է��ϼ���.");	
		}
		if(email=="")
		{
			alert("�̸����� �Է��ϼ���.");	
		}
		if(password=="")
		{
			alert("��й�ȣ�� �Է��ϼ���.");	
		}
	}
</script>

<script>
	function idCheck()
	{
		if(id.equals(dto.getId()))
		{
			alert("�г��� �ߺ�");	
		}
	}
</script>
<script>
	function eCheck()
	{
		if(email.equals(dto.getEmail()))
		{
			alert("�̸��� �ߺ�");
		}
	}
</script>

<div class="apply-page" align="center">
		<h2>ȸ������</h2>
</div>

<form action="applyPro.jsp" method="post" onsubmit="return blankCheck()">
	<div align="center">
		<table border="1">
			<tr>
				<td align="center">i   d : </td>
				<td><input type="text" name="id" placeholder="nickname" /></td>
				<td align="center"><a href="confirmID.jsp">ID�ߺ�Ȯ��</a></td>
			</tr>
			<tr>
				<td align="center">email : </td>
				<td><input type="text" name="email" placeholder="example@goworker.com" /></td>
			</tr>
			<tr>
				<td align="center">password : </td>
				<td><input type="password" name="password" placeholder="����+���� ���� 6�ڸ� �̻� �Է����ּ���." /></td>
			</tr>
		</table>
			<input type="submit" value="ȸ������" onclick="applyPro.jsp"/>	
	</div>
</form>












