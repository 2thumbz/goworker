package bean;
	import javax.mail.PasswordAuthentication;

	public class SMTPAuthenticator extends javax.mail.Authenticator {
	    public PasswordAuthentication getPasswordAuthentication() {
	        // ���̹��� Gmail ����� ���� ����.
	        // Gmail�� ��� @gmail.com�� ������ ���̵� �Է��Ѵ�.
	        return new PasswordAuthentication("damhee6624@gmail.com", "Fkdlswl13^");
	    }
	    public PasswordAuthentication getPasswordAuthentication(String email, String newPassword) {
	    	// �ӽ÷� ����. 
	    	// email = "gowork.team01@gmail.com";
	    	// newPassword = "team1234";
	    	return new PasswordAuthentication(email , newPassword);
	    }
	}
