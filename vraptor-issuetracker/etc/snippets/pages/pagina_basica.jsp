<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
	<head>
		<title>Issue Tracker</title>
		<!-- Bootstrap -->
		<link href="${ctx}/css/bootstrap.css" rel="stylesheet">
		<link href="${ctx}/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="${ctx}/css/issuetracker.css" rel="stylesheet">
		<script src="${ctx}/js/jquery-1.8.2.js"></script>
		<script src="${ctx}/js/bootstrap.js" ></script>
	</head>
	<body>

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="brand" href="#">Issue Tracker</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class="active"><a href="${ctx}/dashboard">Dashboard</a></li>
							<li><a href="${ctx}/projetos">Projetos</a></li>
							<li><a href="${ctx}/usuarios">Usuários</a></li>
							<li><a href="${ctx}/issues">Issues</a></li>
						</ul>
						<ul class="nav pull-right">
	                      <li><a href="#"><span class="badge badge-success">${usuarioWeb.usuario.nome }</span></a></li>
	                      <li class="divider-vertical"></li>
	                      <li><a href="${ctx }/logout">Sair</a></li>
	                    </ul>
					</div>
				</div>
			</div>
		</div>
	
		<div class="wrapper">
			<div class="container">
				
				<c:if test="${not empty errors }">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<h4>Erro(s):</h4>
						<ul class="clearfix">
							<c:forEach items="${errors}" var="error">
								<li><strong>${error.category}</strong> - ${error.message}</li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				<!-- Success Messages -->
				<c:if test="${not empty notice }">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						${notice }
					</div>
				</c:if>
				
				<!-- corpo da página -->
				
			</div>
		</div>
		
		<footer>
			<div class="container">
				<p><a href="${ctx}">Issue Tracker</a> - Registrando Bugs e Features para toda a vida.</p>
			</div>
		</footer>
		
	</body>
</html>