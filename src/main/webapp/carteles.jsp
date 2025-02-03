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
					<a href="festejos.jsp">Festejos</a> <a href="carteles.jsp"><b>Cartelería</b></a>
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
		<a href="index.jsp"><img src="imagenes/MyMLogo.png" alt="logoWeb"
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
					<a href="festejos.jsp"><p>Festejos</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="carteles.jsp"><p>
							<b>Carteles</b>
						</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="fotografias.jsp"><p>Fotografías</p></a>
				</div>
			</div>
		</div>
		<br> <br> <br>
		<p class="tituloCarteles">LO MÁS DESTACADO</p>
		<h1 class="temporadaCarteles">Temporada 2025</h1>
		<br> <br>
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Domingo 30 de marzo</b>
					</p>
					<p class="ciudadCarteles">Plaza de toros Real Maestranza de
						Caballería de Sevilla</p>
					<p class="ganaderiaCarteles">
						TOROS DE EL CAPEA-<br>SAN PELAYO
					</p>
					<p class="toreroCarteles">
						<b>Cayetano</b>
					</p>
					<p class="toreroCarteles">
						<b>Emilio de Justo</b>
					</p>
					<p class="toreroCarteles">
						<b>Ginés Marín</b>
					</p>
					<p class="separacion">------------------------------------------------------------------</p>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Sabado 5 de abril</b>
					</p>
					<p class="ciudadCarteles">Plaza de toros de El Puerto de Santa
						María</p>
					<p class="ganaderiaCarteles">TOROS DE SANTIAGO DOMECQ</p>
					<br>
					<p class="toreroCarteles">
						<b>Morante de la Puebla</b>
					</p>
					<p class="toreroCarteles">
						<b>Sebastián Castella</b>
					</p>
					<p class="toreroCarteles">
						<b>Tomás Rufo</b>
					</p>
					<p class="separacion">------------------------------------------------------------------</p>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Domingo 6 de abril</b>
					</p>
					<p class="ciudadCarteles">Plaza de toros Real Maestranza de
						Caballería de Ronda</p>
					<p class="ganaderiaCarteles">TOROS DE FERMÍN BOHÓRQUEZ</p>
					<br>
					<p class="toreroCarteles">
						<b>Lama de Góngora</b>
					</p>
					<p class="toreroCarteles">
						<b>Ruiz Muñoz</b>
					</p>
					<p class="toreroCarteles">
						<b>Juan P.García 'Calerito'</b>
					</p>
					<p class="separacion">------------------------------------------------------------------</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Sábado 12 de abril</b>
					</p>
					<p class="ciudadCarteles">
						Plaza de toros<br>de Nimes
					</p>
					<p class="ganaderiaCarteles">TOROS DE DOMINGO HERNÁNDEZ</p>
					<p class="toreroCarteles">
						<b>Sergio Galán</b>
					</p>
					<p class="toreroCarteles">
						<b>Diego Ventura</b>
					</p>
					<p class="toreroCarteles">
						<b>Guillermo H.de Mendoza</b>
					</p>
					<p class="separacion">------------------------------------------------------------------</p>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Domingo 13 de abril</b>
					</p>
					<p class="ciudadCarteles">Plaza de toros Real Maestranza de
						Caballería de Sevilla</p>
					<p class="ganaderiaCarteles">TOROS DE VICTORÍNO MARTÍN</p>
					<p class="toreroCarteles">
						<b>Juan Ortega</b>
					</p>
					<p class="toreroCarteles">
						<b>Alejandro Talavante</b>
					</p>
					<p class="toreroCarteles">
						<b>Roca Rey</b>
					</p>
					<p class="separacion">------------------------------------------------------------------</p>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Sábado 19 de abril</b>
					</p>
					<p class="ciudadCarteles">
						Plaza de toros<br>Las Ventas
					</p>
					<p class="ganaderiaCarteles">TOROS DE ALCURRUCÉN</p>
					<p class="toreroCarteles">
						<b>Manuel Escribano</b>
					</p>
					<p class="toreroCarteles">
						<b>El Fandi</b>
					</p>
					<p class="toreroCarteles">
						<b>Esaú Fernández</b>
					</p>
					<p class="separacion">------------------------------------------------------------------</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Viernes 25 de abril</b>
					</p>
					<p class="ciudadCarteles">
						Plaza de toros<br>Monumental de Aguascalientes
					</p>
					<p class="ganaderiaCarteles">TOROS DE GARCIGRANDE</p>
					<p class="toreroCarteles">
						<b>Nek Romero</b>
					</p>
					<p class="toreroCarteles">
						<b>Tomás Bastos</b>
					</p>
					<p class="toreroCarteles">
						<b>Martín Morilla</b>
					</p>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Sábado 26 de abril</b>
					</p>
					<p class="ciudadCarteles">
						Plaza de toros<br>La Malagueta
					</p>
					<p class="ganaderiaCarteles">NOVILLOS DE ALBARREAL</p>
					<p class="toreroCarteles">
						<b>Villita</b>
					</p>
					<p class="toreroCarteles">
						<b>David López</b>
					</p>
					<p class="toreroCarteles">
						<b>Aarón Infántes</b>
					</p>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<p class="fechaCarteles">
						<b>Domingo 27 de abril</b>
					</p>
					<p class="ciudadCarteles">
						Plaza de toros<br>Los Califas
					</p>
					<p class="ganaderiaCarteles">TOROS DE NÚÑEZ DEL CUVILLO</p>
					<p class="toreroCarteles">
						<b>Diego Urdiales</b>
					</p>
					<p class="toreroCarteles">
						<b>Paco Ureña</b>
					</p>
					<p class="toreroCarteles">
						<b>Borja Jiménez</b>
					</p>
				</div>
			</div>
		</div>
	</main>
	<br>
	<footer>
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