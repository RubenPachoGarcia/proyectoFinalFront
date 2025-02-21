<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<header>
		<nav>
			<ul class="dropdown">
				<a href="#" class="dropbtn"> <img
					src="imagenes/MuletaYMontera (1).png" class="menuDesplegable">
				</a>
				<div class="dropdown-content">
					<a href="index.jsp">Inicio</a> <a href="actualidad.jsp">Actualidad</a>
					<a href="festejos.jsp"><b>Festejos</b></a> <a href="carteles.jsp">Cartelería</a>
					<a href="fotografias.jsp">Fotografías</a>
				</div>
			</ul>
			<div class="social-icons">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="https://www.instagram.com/muleta.y.montera/"><img
					src="imagenes/icon-1562139_1280 (1).png" alt="Instagram"
					class="logo"></a> <a
					href="https://www.facebook.com/profile.php?id=61572555326731"><img
					src="imagenes/simbolo-de-la-aplicacion-de-facebook.png"
					alt="Facebook" class="logo"></a> <a href=""><img
					src="imagenes/twitter-black-shape_icon-icons.com_73358.png" alt="x"
					class="logo"></a> <a
					href="https://chat.whatsapp.com/G1SDdgRvg91BcT9TvoinW5"><img
					src="imagenes/whatsapp.png" alt="WhatsApp" class="logo"></a> <a
					href="https://t.me/+dSLYuIyi20AwMzVk"><img
					src="imagenes/telegrama.png" alt="Telegram" class="logo"></a>
			</div>
			<div>
				<%-- Verifica si hay un usuario en la sesión y si este es administrador o no--%>
				<%
				String esAdmin = (String) session.getAttribute("esAdmin");

				if ("true".equals(esAdmin)) {
				%>
				<p class="adminNombre">ADMIN</p>
				<%
				}
				%>
				<%
				String correoUsuario = (String) session.getAttribute("correoUsuario");
				if (correoUsuario != null) {
				%>
				<div>
					<p>
						<p class="loginNombre">
				<b><%=correoUsuario%></b>
					</p>
					<br> <a href="loginUsuario?action=logout"><button class="logout">CERRAR SESIÓN</button></a>
					</p></div>
				<%
				} else {
				%>
				<div>
					<a href="registro.jsp"><button class="registro">REGISTRARSE</button></a>
					<a href="login.jsp"><button class="login">INICIAR
							SESIÓN</button></a>
				</div>
				<%
				}
				%>
			</div>
		</nav>
	</header>
	<main>
	<br>
		<%
		String esAdminDatos = (String) session.getAttribute("esAdmin");

		if ("true".equals(esAdminDatos)) {
		%>
		<button class="modificarDatos">MODIFICAR</button>
		<button class="eliminarDatos">ELIMINAR</button>
		<%
		}
		%>
		<br>
	<br>
		<%-- Si el usuario que hay en la sesion es admin aparecera 
						un boton que le permitira añadir noticias--%>
		<%
		String esAdminFestejos = (String) session.getAttribute("esAdmin");

		if ("true".equals(esAdmin)) {
		%>
		<p class="aniadirFestejosTexto">Añadir noticia</p>
		<button class="aniadirFestejosBoton">+</button>
		<%
		}
		%>
		<br><a href="index.jsp"><img src="imagenes/MyMLogo.png" alt="logoWeb"
			class="logoWeb"></a>
		<div class="container">
			<div class="row" class="opciones">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-lg-2 col-md-2 col-12">
					<a href="index.jsp"><p>Inicio</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="actualidad.jsp"><p>Actualidad</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="festejos.jsp"><p>
							<b>Festejos</b>
						</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="carteles.jsp"><p>Carteles</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="fotografias.jsp"><p>Fotografías</p></a>
				</div>
			</div>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 col-12">
					<div class="noticia1Festejos">
						<a href="#"><img src="imagenes/torero-499750_1280.jpg"
							class="imagenFestejos1"></a><br> <br>
						<p class="festejos1">
							<span class="barraFestejos">|||||</span>&nbsp;&nbsp;Festejos
						</p>
						<a href="#"><p class="textoNoticia1Festejos">
								“Feria de la Vendimia:<br>Nimes se llena de toros para<br>una
								gran feria”
							</p></a>
					</div>
				</div>
				<div class="col-lg-7 col-md-7 col-12">
					<div class="noticia2Festejos">
						<a href="#"><img src="imagenes/pexels-markiwan-5521552.jpg"
							class="imagenFestejos2"></a><br> <br>
						<p class="festejos2">
							<span class="barraFestejos">|||||</span>&nbsp;&nbsp;Festejos
						</p>
						<a href="#"><p class="textoNoticia2Festejos">“El Festival
								del 12 de octubre ya tiene ganaderías”</p></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-12">
					<div class="noticia3Festejos">
						<a href="#"><img src="imagenes/bullring-314361_1280.jpg"
							class="imagenFestejos3"></a><br> <br>
						<p class="festejos3">
							<span class="barraFestejos">|||||</span>&nbsp;&nbsp;Festejos
						</p>
						<a href="#"><p class="textoNoticia3Festejos">
								“Todo preparado para la cita de<br>La Paloma en Las Ventas”
							</p></a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<div class="noticia4Festejos">
						<a href="#"><img src="imagenes/city-7137958_1280.jpg"
							class="imagenFestejos4"></a><br> <br>
						<p class="festejos4">
							<span class="barraFestejos">|||||</span>&nbsp;&nbsp;Festejos
						</p>
						<a href="#"><p class="textoNoticia4Festejos">
								“Málaga, una fiesta de toros<br>con sabor mediterráneo”
							</p></a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<br>
	<footer class="footerFestejos">
		<div class="container-fluid containerFooter">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-3 col-md-3 col-3">
					<div class="containerImagenFooter">
						<img src="imagenes/MyMLogo.png" class="imagenFooter">
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-9">
					<div class="row">
						<div class="col-lg-1 col-md-1 col-1"></div>
						<div class="col-lg-4 col-md-4 col-4 redaccion">
							<p class="tituloFooter">REDACCIÓN</p>
							<p class="textoRedaccion">redaccion@mym.com</p>
							<p class="textoRedaccion">111 222 333</p>
						</div>
						<div class="col-lg-4 col-md-4 col-4 administracion">
							<p class="tituloFooter">ADMINISTRACIÓN</p>
							<p class="textoAdministracion">administracion@mym.com</p>
							<p class="textoAdministracion">444 555 666</p>
						</div>
						<div class="col-lg-3 col-md-3 col-3 publicidad">
							<p class="tituloFooter">PUBLICIDAD</p>
							<p class="textoPublicidad">publicidad@mym.com</p>
							<p class="textoPublicidad">777 888 999</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-12 textoFooter">
					<p>
						Queda prohibida la reproducción y uso, total o parcial, de los
						contenidos en cualquier formato o modalidad, sin la autorización
						previa, expresa y por escrito.<br> Esto incluye su
						reproducción y/o distribución con fines comerciales, tanto de
						manera directa como indirecta con fines lucrativos. ©2024 ::
						Políticas de privacidad // Aviso legal.
					</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>