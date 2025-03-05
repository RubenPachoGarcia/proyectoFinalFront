<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dtos.EliminarUsuarioDto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de Usuarios</title>
    <link rel="icon" type="image/png" href="imagenes/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    // Se espera que el controlador web haya colocado la lista de usuarios en el request
    List<EliminarUsuarioDto> listaUsuarios = (List<EliminarUsuarioDto>) request.getAttribute("listaUsuarios");
    if (listaUsuarios == null) {
    	listaUsuarios = java.util.Collections.emptyList();
    }
    String mensaje = (String) request.getAttribute("mensaje");
    String correoUsuario = (String) session.getAttribute("correoUsuario");
%>

<!-- Barra de navegación -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">InnovaBank</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <% if(correoUsuario != null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Cerrar Sesión</a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Iniciar Sesión</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h1 class="mb-4">Administración de Usuarios</h1>

    <!-- Mostrar mensaje si existe -->
    <c:if test="${not empty mensaje}">
        <div class="alert alert-info">${mensaje}</div>
    </c:if>

    <!-- Tabla de usuarios -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre Completo</th>
                <th>Correo</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody id="userTable">
            <c:choose>
                <c:when test="${not empty listaUsuarios}">
                    <c:forEach var="usuario" items="${listaUsuarios}">
                        <tr>
                            <td>${usuario.idUsuario}</td>
                            <td>${usuario.nombreCompletoUsuario}</td>
                            <td>${usuario.correoUsuario}</td>
                            <td>
                                <button class="btn btn-danger" onclick="eliminarUsuario(${usuario.idUsuario})">Eliminar</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="text-center">No hay usuarios disponibles.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<script>
    // Función para eliminar un usuario mediante una petición DELETE vía fetch
    function eliminarUsuario(idUsuario) {
        if (confirm("¿Estás seguro de que deseas eliminar este usuario?")) {
            fetch("http://localhost:8099/admin/eliminar/" + idUsuario, {
                method: "DELETE",
                headers: {
                    "Content-Type": "application/json"
                }
            })
            .then(response => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error("Error al eliminar el usuario.");
                }
            })
            .then(data => {
                alert(data.mensaje ? data.mensaje : data.error);
                // Recargar la página para actualizar la lista de usuarios
                location.reload();
            })
            .catch(error => {
                console.error("Error:", error);
                alert("No se pudo eliminar el usuario.");
            });
        }
    }
</script>
</body>
</html>
