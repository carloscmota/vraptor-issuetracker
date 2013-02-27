<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<script src="${ctx}/js/usuario/usuario.js"></script>
</head>
<body>

	<legend>Cadastro de Usuários</legend>

	<form id="form" action="altera" method="post" class="form-horizontal">

		<input type="hidden" name="usuario.id" value="${usuario.id}">

		<div class="control-group">
			<label for="nome" class="control-label">Nome</label>
			<div class="controls">
				<input type="text" id="nome" name="usuario.nome" class="span4"value="${usuario.nome}" required/>
			</div>
		</div>

		<div class="control-group">
			<label for="e-mail" class="control-label">E-mail</label>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"> <i class="icon-envelope"></i>
					</span> <input type="text" id="email" name="usuario.email" class="span3" value="${usuario.email}" required/>
				</div>
			</div>
		</div>

		<div class="control-group">
			<label for="login" class="control-label">Login</label>
			<div class="controls">
				<input type="text" id="login" name="usuario.login" class="span2" value="${usuario.login}" required/>
			</div>
		</div>

		<legend>
			<small>Entre com a senha e confirmação de senha</small>
		</legend>

		<div class="control-group">
			<label for="senha" class="control-label">Senha</label>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"> <i class="icon-lock"></i></span>
					<input type="password" id="senha" name="usuario.senha" class="span2"/>
				</div>
			</div>
		</div>

		<div class="control-group required">
			<label for="senha" class="control-label">Confirma</label>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"> <i class="icon-lock"></i></span>
					<input type="password" id="confirmasenha" name="confirmasenha" class="span2"/>
				</div>
			</div>
		</div>

		<div class="form-actions">
			<div class="pull-right">
				<a href="${ctx}/usuario/lista" class="btn">Cancelar</a>
				<button type="submit" class="btn btn-primary">Salvar</button>
			</div>
		</div>

	</form>

</body>
</html>