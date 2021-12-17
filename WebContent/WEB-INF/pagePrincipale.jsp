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

	
	<section>
	
		<table class="table">
	        <thead>
	            <tr>
	                <th scope="col">Libelle</th>
	                <th scope="col">Code commune</th>
	                <th scope="col">Code postal</th>
	                <th scope="col">Longitude</th>
	                <th scope="col">Latitude</th>
	            </tr>
	        </thead>
	        <tbody class="page-data">
	
	
	        </tbody>
	    </table>
	    <nav aria-label="Page navigation">
	        <ul class="pagination flex-wrap">
	            <li onclick="prePage()" class="page-item page-list">
	                <a class="page-link" href="#" aria-label="Previous">
	                    <span aria-hidden="true">&laquo; Précédent</span>
	                    <span class="sr-only">Previous</span>
	                </a>
	            </li>
	            <li class="page-item page-list mid">
	                <a class="page-link" href="#" aria-label="mid">
	                    <span aria-hidden="true">...</span>
	                </a>
	            </li>
	
	            <li onclick="nextPage()" class="page-item">
	                <a class="page-link" href="#" aria-label="Next">
	                    <span aria-hidden="true">Suivant &raquo;</span>
	                    <span class="sr-only">Next</span>
	                </a>
	            </li>
	        </ul>
	    </nav>
	
	</section>
		<script src="bootstrap/librairies.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script>
		villeData = [];
	</script>
	<c:forEach items="${requestScope.communes}" var="ville">
		<script>
			json = '{"ville": "${ville.nomCommune}", "code": "${ville.codeCommune}","codeP": "${ville.codePostal}", "longitude": "${ville.longitude}", "latitude": "${ville.latitude}"}'
			villeData.push(JSON.parse(json))		
			</script>
    </c:forEach>
	<script>
        var currentPage = 0;
        let pages = "";
        let page_size = 15;
        pages = paginate(villeData, page_size);
        pageLi = "";
        pages.forEach((element, index) => {
            if (index != 0)
                pageLi += '<li onclick="pageChange(' + index + ')" id="page_' + index + '" class="page-item list-item" id="page_' + index + '"><a class="page-link" href="javascript:void(0)">' + index + '</a></li>';
        });
        $(".page-list").after(pageLi);
        page = pages[currentPage];
        printRows(page);

        function nextPage() {
            if (pages.length - 1 > currentPage)
                page = currentPage + 1;
            pageChange(page);
        }

        function prePage() {
            if (currentPage < pages.length && currentPage != 0)
                page = currentPage - 1;
            pageChange(page);
        }

        function pageChange(page) {
            currentPage = page;
            $(".list-item").removeClass("active");
            $("#page_" + page).addClass("active");
            $(".page-data").html("");
            page = pages[page];
            printRows(page);
        }

        function printRows(arr) {
            arr.forEach(element => {
                $(".page-data").append("<tr><td>" + element.ville + "</td><td><a href='/ESEO_TP_Client4_I3/editDonneesVille?code="+element.code+"''>" + element.code + "</a></td><td>" + element.codeP + "</td><td>" + element.longitude + "</td><td>" + element.latitude + "</td></tr>");

            });
        }

        function paginate(arr, size) {
            return arr.reduce((acc, val, i) => {
                let idx = Math.floor(i / size)
                let page = acc[idx] || (acc[idx] = [])
                page.push(val)
                return acc
            }, [])
        }
        
    </script>
	
	
	<!-- 
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
	    </div> -->

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
