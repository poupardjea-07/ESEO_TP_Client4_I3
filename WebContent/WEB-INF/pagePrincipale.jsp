<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>test</title>
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
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Dropdown </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="-1" aria-disabled="true">Disabled</a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<!--  header, titre principal -->

	<header class="masthead text-white text-center bg-custom-yellow">
		<div class="container d-flex align-items-center flex-column">
			<h1 class="masthead-heading text-uppercase mb-lg-5 mb-3 custom-dark">test</h1>

			<hr class="custom-dark"
				style="height: 4px; width: 7%; opacity: 1; margin: auto;">
			<h2 class="masthead-subheading mt-lg-4 mt-3 custom-dark">test</h2>
		</div>
	</header>
	
	    <div class="container">
	    	<h1>Liste des communes</h1>
			      <table class="table table-hover">
				        <thead>
					          <tr>
						            <th>Libelle</th>
						            <th>Code commune</th>
						            <th>Nom commune</th>
						            <th>Code postal</th>
						            <th>Ligne</th>
						            <th>Longitude</th>
						            <th>Latitude</th>
					          </tr>
				        </thead>
				        <tbody>
				        	<c:forEach items="${requestScope.communes}" var="commune">
					          	<tr data-href="/ESEO_TP_Client4_I3/editDonneesVille?code=${ commune.getCodeCommune()}">
						            <td><c:out value="${ commune.getLibelle() }" /></td>
						            <td><a href="/ESEO_TP_Client4_I3/editDonneesVille?code=${ commune.getCodeCommune()}"><c:out value="${ commune.getCodeCommune() }" /></a></td>
						            <td><c:out value="${ commune.getNomCommune() }" /></td>
						            <td><c:out value="${ commune.getCodePostal() }" /></td>
						            <td><c:out value="${ commune.getLigne() }" /></td>
						            <td><c:out value="${ commune.getLongitude() }" /></td>
						            <td><c:out value="${ commune.getLatitude() }" /></td>
					          	</tr>
					        </c:forEach>
				        </tbody> 
			      </table>
	    </div>
	    
	     <ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		 </ul>

	<script>
	$(function(){       
	    $('*[data-href]').click(function(){
	        window.location = $(this).data('href');
	        return false;
	    });
	});
	</script>
	<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
