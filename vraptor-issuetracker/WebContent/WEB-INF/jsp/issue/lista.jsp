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
					var link = $(this);
					var uri = link.attr('HREF');
					
					$.ajax({
						url:uri,
						type: "DELETE",
						success: function(retorno){
							var nome = retorno.nome;
							//var nome = retorno.user.nome;
							alert("Usuário "+nome+" foi exluído com sucesso!");
							//alert("Registro excluido com sucesso!");
							var tr = link.parents("tr");
							tr.children().css("background-color","pink").fadeOut(1000,function(){
								tr.remove();
							});
						}
					});
					return false;
			});
		});
	</script>
</head>

<body>

	<legend>Cadastro de Issues</legend>

	<div class="pull-right">
		<a href="${ctx}/issue/novo" class="btn">nova issue</a>
	</div>
	<div>
		<form action="buscar" method="post" class="form-search">
			<input type="text" name="buscaissue"
				class="input-large search-query" placeholder="search…"
				value="${valorbusca}">
			<button type="submit" class="btn">buscar</button>
		</form>
	</div>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th><i class="icon-tasks"></i></th>
				<th>Descrição</th>
				<th>Tipo</th>
				<th>Status</th>
				<th style="text-align: center;"><i class="icon-cog"></i></th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${issueList}" var="issues" varStatus="s">
				<tr>
					<td>${s.index+1}</td>
					<td>${issues.descricao}</td>
					<td>${issues.tipo}</td>
					<td>${issues.status}</td>
					<td class="nowrap">
						<a href="edita?id=${issues.id}" class="btn btn-small">
							<i class="icon-pencil"></i>
						</a>
						<a href="remove?id=${issues.id}" class="btn btn-small btn-danger link-exclusao">
							<i class="icon-trash"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>