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
        this.usuarioServicio = new LoginUsuarioServicio();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	String correoUsuario = request.getParameter("correoUsuario");
        String contraseniaUsuario = request.getParameter("contraseniaUsuario");

        Long idUsuario = usuarioServicio.obtenerIdUsuario(correoUsuario, contraseniaUsuario);
        
        boolean usuarioValido = usuarioServicio.verificarUsuario(correoUsuario, contraseniaUsuario);

        if (usuarioValido) {
            
        	String esAdmin = usuarioServicio.getEsAdmin();
            
            HttpSession session = request.getSession();
            session.setAttribute("correoUsuario", correoUsuario);
            session.setAttribute("esAdmin", esAdmin);
            session.setAttribute("idUsuario", idUsuario);
            session.setMaxInactiveInterval(-1);

            if ("true".equals(esAdmin)) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("ERROR", "Correo o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            // Se cierra la sesión)
            HttpSession session = request.getSession(false); 
            if (session != null) {
                session.invalidate();  
            }
            // Redirigimos a la página del login
            response.sendRedirect("index.jsp");
        } else {
            // Si la acción no es logout, redirigimos al login
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
