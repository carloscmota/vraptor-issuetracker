<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/templates/head.jsp" %>
		<decorator:head></decorator:head>
	</head>
	<body>
	
		<%@ include file="/templates/menu.jsp" %>
	
		<div class="wrapper">
			<div class="container">
	
				<%@ include file="/templates/mensagens.jsp" %>
				<decorator:body></decorator:body>
				
			</div>
		</div>
	
		<%@ include file="/templates/rodape.jsp" %>
	
	</body>
</html>