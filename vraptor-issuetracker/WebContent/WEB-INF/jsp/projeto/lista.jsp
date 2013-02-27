<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<script>
	$(document).ready(function(){
		$(".link-exclusao").click(
			function(){
				var c = confirm('Deseja excluir este registro?');
				if (!c){
					return false;
				}
				alert($(this).Attr('href'));
				//$ajax({
					//url:$(this).Attr('href')
				//});
				
				
				return false;
		});
	});
	</script>
</head>
<body>

	<legend>Cadastro de Projetos</legend>

	<div class="pull-right">
		<a href="${ctx}/projetos/novo" class="btn">Novo projeto</a>
	</div>

	<div>
		<form action="${ctx}/projeto/buscar" method="post" class="form-search">
			<input type="text" name="buscaprojeto"
				class="input-large search-query" placeholder="search…"
				value="${valorbusca}">
			<button type="submit" class="btn">buscar</button>
		</form>
	</div>

	<table class="table table-striped">
		<thead>
			<tr>
				<th><i class="icon-tasks"></i></th>
				<th>Nome</th>
				<th style="text-align: center;"><i class="icon-cog"></i></th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${projetoList}" var="projeto" varStatus="s">
				<tr>
					<td>${s.index+1}</td>
					<td>${projeto.nome}</td>
					<td class="nowrap">
						<a href="${ctx}/projetos/${projeto.id}"
							class="btn btn-link"> <i class="icon-pencil"></i>
						</a>
						<form action="${ctx}/projetos/${projeto.id}" method="post"
							class="link-excluir">
							<button class="btn btn-link link-exclusao" type="submit" name="_method" value="DELETE">
								<i class="icon-trash"></i>
							</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>