package controladores;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import servicios.LoginUsuarioServicio;

@WebServlet("/loginUsuario")
public class LoginUsuarioControlador extends HttpServlet {

	private LoginUsuarioServicio usuarioServicio;

	@Override
	public void init() throws ServletException {

		// Inicializa el login
		this.usuarioServicio = new LoginUsuarioServicio();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Recogemos parámetros del formulario
		String correoUsuario = request.getParameter("correoUsuario");
		String contraseniaUsuario = request.getParameter("contraseniaUsuario");

		// Imprimimos los valores para depuración
		System.out.println("Correo recibido: " + correoUsuario);
		System.out.println("Contraseña recibida: " + contraseniaUsuario);

		// Llamamos al servicio para verificar al usuario
		boolean usuarioValido = usuarioServicio.verificarUsuario(correoUsuario, contraseniaUsuario);

		if (usuarioValido) {

			// Obtenemos el rol del usuario
			String esAdmin = usuarioServicio.getEsAdmin();
			System.out.println("esAdmin: " + esAdmin);

			// Crear o recuperar la sesión
			HttpSession session = request.getSession();
			session.setAttribute("correoUsuario", correoUsuario);
			session.setAttribute("esAdmin", esAdmin);

			// Configurar tiempo de inactividad de la sesión
			session.setMaxInactiveInterval(-1);

			// Verificar si la sesión está activa y mostrar por consola
			if (session != null) {
				System.out.println("Sesión activa de: " + correoUsuario);
			} else {
				System.out.println("Error al crear la sesión.");
			}
			// Redirigir según el rol
			if ("true".equals(esAdmin)) {
				// Redirigir al panel de administración
				// response.sendRedirect("administrador.jsp");
			} else if ("false".equals(esAdmin)) {
				// Redirigir al panel de usuario
				response.sendRedirect("index.jsp");
			} else {
				// Rol desconocido
				request.setAttribute("ERROR", "Rol desconocido.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else {

			// Si las credenciales son incorrectas
			System.out.println("Usuario no válido. Datos incorrectos.");
			request.setAttribute("ERROR", "Correo o contraseña incorrectos.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}