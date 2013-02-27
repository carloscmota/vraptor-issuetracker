<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<script src="${ctx}/js/projeto/projeto.js"></script>
	</head>
	<body>
	
		<legend>Cadastro de Projetos</legend>
	
		<form id="form" action="${ctx}/projetos/${projeto.id}" method="post"
			class="form-horizontal">
	
			<input type="hidden" name="_method" value="PUT">
	
			<div class="control-group">
				<label for="nome" class="control-label">Nome</label>
				<div class="controls">
					<input type="text" id="nome" name="projeto.nome" class="span4"
						value="${projeto.nome}" required />
				</div>
			</div>
	
			<div class="form-actions">
				<div class="pull-right">
					<a href="${ctx}/projetos" class="btn">Cancelar</a>
					<button type="submit" class="btn btn-primary">Salvar</button>
				</div>
			</div>
	
		</form>
	</body>
</html>