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
<link rel="stylesheet" href="css/styles.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav>
			<ul class="dropdown">
				<a href="#" class="dropbtn"> <img
					src="imagenes/MuletaYMontera (1).png" class="menuDesplegable">
				</a>
				<%
				String esAdminDatos = (String) session.getAttribute("esAdmin");

				if ("true".equals(esAdminDatos)) {
				%>
				<button class="modificar">MODIFICAR</button>
				<button class="eliminar">ELIMINAR</button>
				<%
				}
				%>
				<div class="dropdown-content">
					<a href="index.jsp"><b>Inicio</b></a> <a href="actualidad.jsp">Actualidad</a>
					<a href="festejos.jsp">Festejos</a> <a href="carteles.jsp">Cartelería</a>
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
					<br><a href="loginUsuario?action=logout"><button class="logout">CERRAR SESIÓN</button></a>
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
		<a href="admin.jsp"><img src="imagenes/MyMLogo.png"
			class="logoWeb"></a>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="d-flex justify-content-center">
						<img src="imagenes/jose-tomas-1247608_1280.jpg"
							class="imagenCarrusel"> <img
							src="imagenes/paul-kenny-mcgrath-PY0mtUTVX9I-unsplash.jpg"
							class="imagenCarrusel"> <img
							src="imagenes/bolsin-2012734_1280.jpg" class="imagenCarrusel">
					</div>
				</div>
				<div class="carousel-item">
					<div class="d-flex justify-content-center">
						<img src="imagenes/manuel-cordero-GL9r1AwlrDg-unsplash.jpg"
							class="imagenCarrusel"> <img
							src="imagenes/toro-112069_1280.jpg" class="imagenCarrusel">
						<img src="imagenes/stephane-yaich-eAE9ZYPZXrU-unsplash.jpg"
							class="imagenCarrusel">
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<br> <br>
		<div class="container">
			<div class="row" class="opciones">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-lg-2 col-md-2 col-12">
					<a href="index.jsp"><p>
							<b>Inicio</b>
						</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="actualidad.jsp"><p>Actualidad</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="festejos.jsp"><p>Festejos</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="carteles.jsp"><p>Carteles</p></a>
				</div>
				<div class="col-lg-2 col-md-2 col-12">
					<a href="fotografias.jsp"><p>Fotografías</p></a>
				</div>
			</div>
		</div>
		<p class="descripcion">
			“Bienvenidos a Muleta y Montera, un espacio dedicado a la pasión, la
			tradición y el arte de la tauromaquia.<br> Aquí encontrarás todo
			lo relacionado con el mundo del toro: <br> desde la historia y
			los eventos más importantes, hasta la actualidad del mundo del toro,
			los detalles de las principales figuras y las emociones que se viven
			en cada plaza.<br> Sumérgete en el alma de la fiesta brava y
			descubre por qué la tauromaquia es mucho más que una tradición, es
			una forma de vida.”
		</p>
		<div class="container premium">
			<div class="row rowPremium">
				<div class="col-lg-6 col-md-6 col-6">
					<p class="textoPremium">
						Hazte<br>premium
					</p>
				</div>
				<div class="col-lg-6 col-md-6 col-6">
					<br>
					<p class="textoPremium2">"Accede al Plan Premium y vive la
						fiesta taurina sin límites ni anuncios: contenido exclusivo,
						noticias al instante y una experiencia sin interrupciones. ¡Sé
						parte de la élite taurina por solo 9,99€!"</p>
				</div>
			</div>
			<div class="row">
				<div
					class="offset-lg-6 col-lg-6 offset-md-6 col-md-6 offset-6 col-6">
					<button class="botonPremium">Premium</button>
					</a>
				</div>
			</div>
		</div>
		<br>
		<p class="tituloNoticias">TODO LO QUE DEBES SABER SOBRE...</p>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-12">
					<h2 class="cabeceraNoticias">Ganaderías</h2>
					<img src="imagenes/pexels-mateusz-17421288.jpg"
						class="imagenNoticias">
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<h2 class="cabeceraNoticias">Toreros</h2>
					<img src="imagenes/gavia-FgbUS58qORc-unsplash.jpg"
						class="imagenNoticias">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-12">
					<h2 class="cabeceraNoticias">Novilleros</h2>
					<img src="imagenes/pexels-jose-ortega-277772067-12993261.jpg"
						class="imagenNoticias">
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<h2 class="cabeceraNoticias">Rejoneadores</h2>
					<img src="imagenes/bullring-3276649_1280.jpg"
						class="imagenNoticias">
				</div>
			</div>
		</div>
		<p class="descripcion">
			“Ahora que nos conoces un poco más, te invitamos a seguir explorando
			el fascinante mundo de la tauromaquia.<br> Regístrate y mantente
			al tanto de las últimas noticias, eventos y análisis exclusivos, y
			vive con nosotros la emoción y la historia de la fiesta brava en cada
			paso.”
		</p>
		<div class="containerFormulario1">
			<div class="rowForm">
				<div class="colForm col-lg-6 col-md-6 col-12">
					<div class="image-container-custom">
						<img src="imagenes/seville-85863_1280 (1).jpg" alt="Imagen"
							class="imagenRegistroCustom">
					</div>
				</div>
				<div class="colForm col-lg-6 col-md-6 col-12">
					<div class="form-container-custom">
						<h1 class="tituloForm">REGISTRARSE</h1>
						<div class="containerFormulario2">
							<form id="registrarUsuario" action="registroUsuario"
								method="POST" enctype="multipart/form-data">
								<div class="rowForm">
									<div class="colForm col-lg-6 col-md-6 col-12">
										<label for="nombreCompletoUsuario" class="labelForm">Nombre
											completo</label> <input type="text" class="input"
											name="nombreCompletoUsuario">
									</div>
									<div class="colForm col-lg-6 col-md-6 col-12">
										<label for="fotoUsuario" class="labelForm">Foto</label> <input
											type="file" class="input" name="fotoUsuario">
									</div>
								</div>

								<div class="rowForm">
									<div class="colForm col-lg-6 col-md-6 col-12">
										<label for="correoUsuario" class="labelForm">Correo
											electrónico</label> <input type="email" class="input"
											name="correoUsuario">
									</div>
									<div class="colForm col-lg-6 col-md-6 col-12">
										<label for="contraseniaUsuario" class="labelForm">Contraseña</label>
										<input type="password" class="input" name="contraseniaUsuario">
									</div>
								</div>

								<div class="rowForm">
									<div class="colForm col-lg-6 col-md-6 col-12">
										<label for="telefonoUsuario" class="labelForm">Teléfono</label>
										<input type="number" class="input" name="telefonoUsuario">
									</div>
									<div class="colForm col-lg-6 col-md-6 col-12">
										<label for="confirmarContraseniaUsuario" class="labelForm">Repetir
											contraseña</label> <input type="password" class="input"
											name="confirmarContraseniaUsuario">
									</div>
								</div>
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="botonRegistro" type="submit">REGISTRARSE</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<p class="descripcion">
			“Gracias por visitar Muleta y Montera. Esperamos que hayas disfrutado
			de tu recorrido.<br> No dudes en volver para seguir descubriendo
			lo mejor de la tauromaquia, con contenido exclusivo y las últimas
			novedades.<br> ¡Te esperamos pronto!”
		</p>
		<div class="containerDespedida">
			<img src="imagenes/toro-5047753_1280 (1).jpg" class="imagenDespedida">
		</div>
	</main>
	<br>
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
							<p class="textoRedaccion">mym@gmail.com</p>
							<p class="textoRedaccion">111 222 333</p>
						</div>
						<div class="col-lg-4 col-md-4 col-4 administracion">
							<p class="tituloFooter">ADMINISTRACIÓN</p>
							<p class="textoAdministracion">mym@gmail.com</p>
							<p class="textoAdministracion">444 555 666</p>
						</div>
						<div class="col-lg-3 col-md-3 col-3 publicidad">
							<p class="tituloFooter">PUBLICIDAD</p>
							<p class="textoPublicidad">mym@gmail.com</p>
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