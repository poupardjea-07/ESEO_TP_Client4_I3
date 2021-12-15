<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editer les données de la ville</title>
</head>
<body>
	<h1>Modifier les informations de la ville</h1>

	<form method="post" action="editDonneesVille">
		<input type="text" size="50" id="codeCommune" name="codeCommune" readonly="readonly" value="${ ville.codeCommune }"/>
		<p>Nom commune :</p>
		<input type="text" size="50" id="nomCommune" name="nomCommune" value="${ ville.nomCommune }">
		<p>Code postal :</p>
		<input type="text" id="codePostal" name="codePostal" value="${ ville.codePostal }"/>
		<p>Latitude :</p>
		<input type="text" id="latitude" name="latitude" value="${ ville.latitude }"/>
		<p>Longitude :</p>
		<input type="text" id="longitude" name="longitude" value="${ ville.longitude }"/>
		<p>Libelle :</p>
		<input type="text" size="50" id="libelle" name="libelle" value="${ ville.libelle }"/>
		<p>Ligne :</p>
		<input type="text" id="ligne" name="ligne" value="${ ville.ligne }"/>
		<br>
		<br>
		<input type=submit id="modifier" name="modifier" value="Modifier"/>      
	</form>
</body>
</html>