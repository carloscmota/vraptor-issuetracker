<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty notice}">
	<div class="alert alert-success fade in">
		<button type="button" class="close" data-dismiss="alert">x</button>
		${notice}
	</div>
</c:if>

<c:if test="${not empty errors}">

	<div class="alert alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">x</button>
		<c:forEach items="${errors}" var="error">
			${error.category} - ${error.message} <br>
		</c:forEach>
	</div>
</c:if>