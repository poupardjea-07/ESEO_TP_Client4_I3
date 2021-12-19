<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editer les données de la ville</title>
<!-- logo fontawesome-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Import bootstrap et css -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="style/style.css" />
</head>
<body>

	<!--  Barre de nav -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/ESEO_TP_Client4_I3/pagePrincipale">Liste des villes</a></li>
					<li class="nav-item"><a class="nav-link" href="/ESEO_TP_Client4_I3/comparatif">Distance entre 2 villes</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!--  header, titre principal -->

	<header class="text-white text-center bg-custom-yellow">
		<div class="container d-flex align-items-center flex-column">
			<h1 class="masthead-heading text-uppercase mb-lg-5 mb-3 custom-dark">Modifier les informations de la ville</h1>
		</div>
	</header>

	<div class="container">
		<form method="post" action="editDonneesVille">
			<fieldset>
				<div class="form-group">
					<label for="codeCommune">Code commune :</label>
					<input type="text" size="50" class="form-control" id="codeCommune" name="codeCommune" readonly="readonly" value="${ ville.codeCommune }"/>
				</div>
				<br>
				<div class="form-group">
					<label for="nomCommune">Nom commune :</label>
					<input type="text" size="50" class="form-control" id="nomCommune" name="nomCommune" value="${ ville.nomCommune }">
				</div>
				<br>
				<div class="form-group">
					<label for="codePostal">Code postal :</label>
					<input type="text" class="form-control" id="codePostal" name="codePostal" value="${ ville.codePostal }"/>
				</div>	
				<br>
				<div class="form-group">
					<label for="latitude">Latitude :</label>
					<input type="text" class="form-control" id="latitude" name="latitude" value="${ ville.latitude }"/>
				</div>
				<br>
				<div class="form-group">
					<label for="longitude">Longitude :</label>
					<input type="text" class="form-control" id="longitude" name="longitude" value="${ ville.longitude }"/>
				</div>
				<br>
				<div class="form-group">	
					<label for="libelle">Libelle :</label>
					<input type="text" size="50" class="form-control" id="libelle" name="libelle" value="${ ville.libelle }"/>
				</div>
				<br>
				<div class="form-group">	
					<label for="ligne">Ligne :</label>
					<input type="text" class="form-control" id="ligne" name="ligne" value="${ ville.ligne }"/>
				</div>	
				<br>
				<br>
				<input class="btn btn-primary" type=submit id="modifier" name="modifier" value="Modifier"/>
			</fieldset>	      
		</form>
	</div>	
	
	<script src="bootstrap/librairies.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>