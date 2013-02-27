<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
	<head>
		<title>Issue Tracker</title>
		<!-- Bootstrap -->
		<link href="${ctx }/css/bootstrap.css" rel="stylesheet">
		<link href="${ctx }/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="${ctx }/css/issuetracker.css" rel="stylesheet">
		<script src="${ctx }/js/jquery-1.8.2.js"></script>
		<script src="${ctx }/js/bootstrap.js" ></script>
	</head>
	<body>

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="brand" href="#">Issue Tracker</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li><a href="#">Menu 01</a></li>
							<li><a href="#">Menu 02</a></li>
							<li><a href="#">Menu 03</a></li>
							<li><a href="#">Menu 04</a></li>
						</ul>
						<ul class="nav pull-right">
	                      <li><a href="#"><span class="badge badge-success">usuário logado</span></a></li>
	                      <li class="divider-vertical"></li>
	                      <li><a href="#">Sair</a></li>
	                    </ul>
					</div>
				</div>
			</div>
		</div>
	
		<div class="wrapper">
			<div class="container">
				<!-- corpo da página -->
			
			</div>
		</div>
		
		<footer>
			<div class="container">
				<p><a href="#">Issue Tracker</a> - Registrando Bugs e Features para toda a vida.</p>
			</div>
		</footer>
		
	</body>
</html>