package bean;
	import javax.mail.PasswordAuthentication;

	public class SMTPAuthenticator extends javax.mail.Authenticator {
	    public PasswordAuthentication getPasswordAuthentication() {
	        // ���̹��� Gmail ����� ���� ����.
	        // Gmail�� ��� @gmail.com�� ������ ���̵� �Է��Ѵ�.
	        return new PasswordAuthentication("damhee6624@gmail.com", "Fkdlswl13^");
	    }
	}
