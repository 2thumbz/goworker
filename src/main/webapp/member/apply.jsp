<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<title>ȸ������</title>

<script>
	function blankCheck()
	{
		idv=document.getElementsByName("id")[0].value;
		emv=document.getElementsByName("email")[0].value;
		passwordv=document.getElementsByName("password")[0].value;
		if(idv=="")
		{
			alert("�г����� �Է��ϼ���.");	
			return false;
		}
		if(emv=="")
		{
			alert("�̸����� �Է��ϼ���.");	
			return false;
		}
		if(passwordv=="")
		{
			alert("��й�ȣ�� �Է��ϼ���.");	
			return false;
		}
	}
</script>
<script>
	function confirmId()
	{
		idv=document.getElementsByName("id")[0].value;
		if(idv=="")
		{
			alert("�г����� �Է��ϼ���.");
			return false;
		}else
		{
			open('confirmId.jsp?id='+idv,'checkId','width=500,height=500');	
		}
	}
</script>
<script>
	function confirmEm()
	{
		emv=document.getElementsByName("email")[0].value;
		if(emv=="")
		{
			alert("�г����� �Է��ϼ���.");
			return false;
		}else
		{
			open('confirmEm.jsp?email='+emv, 'checkEmail', 'width=500,height=500');
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
				<td><input type="text" name="id" placeholder="nickname"  /></td>
				<td align="center"><input type="button" value="id�ߺ�Ȯ��" onclick="return confirmId();"/><label id="idCheck"></label></td>
			</tr>
			<tr>
				<td align="center">email : </td>
				<td><input type="email" name="email" placeholder="example@goworker.com" /></td>
				<td align="center"><input type="button" value="email�ߺ�Ȯ��" onclick="return confirmEm();"/><label id="emCheck"></label></td>
			</tr>
			<tr>
				<td align="center">password : </td>
				<td><input type="password" name="password" placeholder="����+���� ���� 6�ڸ� �̻� �Է����ּ���." /></td>
			</tr>
		</table>
			<input type="submit" value="ȸ������" onclick="applyPro.jsp"/>	
	</div>
</form>












