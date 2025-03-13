<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="dtos.EliminarUsuarioDto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Administración de Usuarios</title>
<link rel="icon" type="image/png" href="imagenes/favicon.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ page isELIgnored="true"%>
	<%
    String esAdmin = (String) session.getAttribute("esAdmin");
    if (!"true".equals(esAdmin)) {
        response.sendRedirect("index.jsp"); 
        return;
    }
	%>
	<div class="containerEliminarUsuario">
		<div class="rowRegistrarse">
			<div class="colForm col-lg-12 col-md-12 col-12">
				<div class="form-container-custom">
					<p></p>
					<!-- Se usa la misma clase que el título de registro para lograr coherencia visual -->
					<h1 class="tituloRegistro">USUARIOS DISPONIBLES</h1>
					<form action="loginUsuario?action=logout" method="GET">
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" class="logout">CERRAR SESIÓN</button>
					</form>
					<div class="containerEliminar">
						<table class="tablaEliminar">
							<thead>
								<tr>
									<th>ID-</th>
									<th>Nombre-</th>
									<th>Correo-</th>
									<th>Opciones</th>
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
												<td class="botonEliminar">
													<button class="botonEliminar"
														onclick="eliminarUsuario('${usuario.correoUsuario}')">Eliminar
													</button>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr id="noUsersRow" class="mensajeVacio">
											<td colspan="4">No hay usuarios disponibles</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>  
    var esAdmin = "<%= session.getAttribute("esAdmin") %>";

    if (!esAdmin || esAdmin !== "true") {
        window.location.href = "${pageContext.request.contextPath}/usuarios/index";
    }
    
    document.addEventListener("DOMContentLoaded", function () {
    	cargarUsuarios();
    });

    function cargarUsuarios() {
    	fetch('http://localhost:8099/api/usuarios/lista')
            .then(response => {
                if (!response.ok) {
                    throw new Error("No se pudo cargar la lista de usuarios");
                }
                return response.json();
            })
            .then(data => {
                const userTable = document.querySelector("#userTable");
                if (!userTable) {
                    console.error("No se encontró el elemento con id 'userTable'");
                    return;
                }

                // Limpiar tabla
                userTable.innerHTML = "";

                if (data.length === 0) {
                    userTable.innerHTML = `<tr id="noUsersRow"><td colspan="4">No hay usuarios disponibles</td></tr>`;
                    return;
                }

                // Insertar filas con usuarios
                data.forEach(usuario => {
                    const row = `
                        <tr>
                            <td>${usuario.idUsuario}</td>
                            <td>${usuario.nombreCompletoUsuario}</td>
                            <td>${usuario.correoUsuario}</td>
                            <td class="user-actions">
                                <button class="delete-user" onclick="eliminarUsuario('${usuario.correoUsuario}')">Eliminar</button>
                            </td>
                        </tr>
                    `;
                    userTable.innerHTML += row;
                });
            })
            .catch(error => console.error("Error al cargar usuarios:", error));
    }


    async function eliminarUsuario(correoUsuario) {
        const confirmacion = confirm("¿Estás seguro de eliminar este usuario?");
        if (!confirmacion) return;

        try {
            const response = await fetch('http://localhost:8099/api/usuarios/eliminar?correoUsuario=' + encodeURIComponent(correoUsuario), {
                method: 'DELETE'
            });

            if (!response.ok) {
                throw new Error(`Error al eliminar usuario: ${response.status} ${response.statusText}`);
            }

            const mensaje = await response.text();
            alert(mensaje);
            cargarUsuarios(); // Recargar la lista de usuarios
        } catch (error) {
            console.error("Error al eliminar usuario:", error);
            alert("Hubo un problema al eliminar el usuario. Inténtalo de nuevo.");
        }
    }

    </script>
</body>
</html>
