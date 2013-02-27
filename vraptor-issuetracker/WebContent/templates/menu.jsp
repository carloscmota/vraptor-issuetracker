<%@ page pageEncoding="UTF-8"%>

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" href="#">Issue Tracker</a>
			<div class="nav-collapse collapse">
				<c:if test="${usuarioWeb.logado}">
					<ul class="nav">
						<li><a href="${ctx}/usuario/lista">Usuários</a></li>
						<li><a href="${ctx}/projetos">Projetos</a></li>
						<li><a href="${ctx}/issues">Issues</a></li>
					</ul>
					<ul class="nav pull-right">
						<li><a href="#"><span class="badge badge-success">${usuarioWeb.usuario.nome}</span></a></li>
						<li class="divider-vertical"></li>
						<li><a href="${ctx}/logoff">Sair</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</div>