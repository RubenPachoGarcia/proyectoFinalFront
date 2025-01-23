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
	<div class="containerRegistrarse">
		<div class="rowRegistrarse">
			<div class="colForm col-lg-12 col-md-12 col-12">
				<div class="form-container-custom">
					<p></p>
					<h1 class="tituloRegistro">Iniciar Sesión</h1>
					<div class="containerRegistro">
						<form id="loginUsuario" action="loginUsuario" method="POST">
							<div class="rowRegistro">
								<div class="colRegistro col-lg-12 col-md-12 col-12">
									<label for="email" name="correoUsuario" class="labelRegistro">Correo
										electrónico</label> <input type="email" class="inputRegistro">
								</div>
							</div>
							<div class="rowRegistro">
								<div class="colForm col-lg-12 col-md-12 col-12">
									<label for="contrasenia" name="contraseniaUsuario"
										class="labelRegistro">Contraseña</label> <input
										type="password" class="inputRegistro">
								</div>
							</div>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="botonLogin" type="submit">INICIAR SESIÓN</button>
							<br> <br>
							<p class="texto">
								¿No tienes una cuenta? <a href="registro.jsp"
									class="registroLogin">Regístrate</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>