package controladores;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servicios.RecuperarContraseniaServicio;

@WebServlet("/recuperar")
public class RecuperarContraseniaControlador extends HttpServlet {

	private RecuperarContraseniaServicio recuperarContraseniaServicio;

	@Override
	public void init() throws ServletException {
		// Inicializamos el servicio de recuperación de contraseña
		this.recuperarContraseniaServicio = new RecuperarContraseniaServicio();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String correoUsuario = request.getParameter("correoUsuario");
		// String nuevaContrasenia = request.getParameter("nuevaContrasenia");
		// String confirmarNuevaContrasenia =
		// request.getParameter("confirmarNuevaContrasenia");

		// Verificamos si el correo está vacío o es nulo
		if (correoUsuario == null || correoUsuario.isEmpty()) {
			request.setAttribute("mensaje", "El correo no puede estar vacío.");
			request.getRequestDispatcher("recuperarContrasenia.jsp").forward(request, response);
			// Salir del método para evitar procesar la solicitud si el correo está vacío
			return;
		}

		// Llamamos al servicio para solicitar la recuperación
		boolean enviado = recuperarContraseniaServicio.solicitarRecuperacion(correoUsuario);

		// Verificamos si el correo fue enviado correctamente
		if (enviado) {
			request.setAttribute("mensaje", "Correo de recuperación enviado.");
		} else {
			request.setAttribute("mensaje", "Error: No se encontró el correo.");
		}

		// Redirigimos a la página correspondiente con mensaje
		request.getRequestDispatcher("enviarCorreoContrasenia.jsp").forward(request, response);
	}

}
