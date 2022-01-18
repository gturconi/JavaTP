package extras;


import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class EnviadorDeCorreo {

	public void enviarCorreo(String destinatario, String destinatario2, String asunto, String cuerpo) throws EmailException {
		String remitente = "bibliotecaentrehojas2021@gmail.com";
		String usuario = "bibliotecaentrehojas2021@gmail.com";
		String contrasena = "pvaqvkueiltobhus";

		try {
			Email email = new SimpleEmail();
			email.setHostName("smtp.gmail.com");
			email.setSmtpPort(587);
			email.setAuthenticator(new DefaultAuthenticator(usuario, contrasena));
			email.setSSLOnConnect(true);
			email.setStartTLSEnabled(true);
			email.setFrom(remitente);
			email.setSubject(asunto);
			email.setMsg(cuerpo);
			email.addTo(destinatario);
			email.addTo(destinatario2);
			email.send();
		} catch (EmailException e) {
			throw new EmailException();
		}

	}
}