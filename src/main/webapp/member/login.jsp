<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<title>�α���</title>

<div class="login-page" align="center">
	<h2>�α���</h2>
</div>
<script>
	function blankCheck()
	{
		pwv=document.getElementsByName("password")[0].value;
		if (pwv == "") 
		{
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}
	}
</script>

<form action="loginPro.jsp" method="post" onsubmit="return blankCheck();" >
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="3">�̸���<br /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="email" name="email"
					placeholder="example@goworker.com" /></td>
			</tr>

			<tr>
				<td colspan="3">��й�ȣ<br /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="password" name="password"
					placeholder="��й�ȣ�� �Է��ϼ���." /></td>
			</tr>
			<tr align="left">
				<td colspan="3">�α��� ���� ����<input type="checkbox" name="logining"
					value="yes" /></td>
			</tr>
			<tr align="left">
				<td colspan="3"><a href="pw_find.jsp">��й�ȣ ã��</a></td>
			</tr>
			<tr align="left">
				<td colspan="3"><input type="submit" value="�̸��� �α���" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="īī��" /></td>
				<td><input type="submit" value="���̹�" /></td>
				<td><input type="submit" value="����" /></td>
			</tr>
			<tr>
				<td colspan="3"><a href="/member/apply/apply.jsp"> ������	�����Ű���?</a></td>
			</tr>
		</table>
	</div>
</form>





