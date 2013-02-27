<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/templates/head.jsp" %>
		<link href="${ctx}/css/login.css" rel="stylesheet">
	</head>
	
	<body>
		<%@ include file="/templates/mensagens.jsp" %>
		<div class="login-form">
			<form action="${ctx}/login" method="post">
				<h2>Login</h2>
				<input type="text" name="login" placeholder="Login"> 
				<input type="password" name="senha" placeholder="Senha">
				<button class="btn btn-primary" type="submit">logar</button>
			</form>
		</div>
	</body>
	
</html>