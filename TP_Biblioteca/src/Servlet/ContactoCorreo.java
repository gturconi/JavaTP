package Servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;

import extras.EnviadorDeCorreo;


@WebServlet("/ContactoCorreo")
public class ContactoCorreo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ContactoCorreo() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(true);
		String destinatario = "frangiangiordano@gmail.com";
		String destinatario2 = "gonzaturconi@gmail.com";
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String correoElectronico = request.getParameter("correo");
		String mensaje = request.getParameter("mensaje");
		String asunto = "Consulta de " + nombre + " " + apellido + " desde el formulario de contacto";
		String cuerpo =  "Mensaje: " + mensaje + ".\n\nResponder a: " + correoElectronico;
		
		try {
			EnviadorDeCorreo edc = new EnviadorDeCorreo();
			edc.enviarCorreo(destinatario, destinatario2, asunto, cuerpo);
			request.getSession().setAttribute("huboError", null);
			request.setAttribute("mensaje", "Su consulta fue enviada correctamente");
			request.getRequestDispatcher("WEB-INF/contacto.jsp").forward(request, response);
		} catch (EmailException e) {
			request.getSession().setAttribute("huboError", "si");
			request.setAttribute("mensaje", "Ocurrio un error en el envio de la consulta");
			request.getRequestDispatcher("WEB-INF/contacto.jsp").forward(request, response);
		}
	}

}
