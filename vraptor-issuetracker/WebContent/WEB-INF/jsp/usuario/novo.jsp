<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<script src="${ctx}/js/usuario/usuario.js"></script>
</head>
<body>

	<legend>Cadastro de Usuários</legend>

	<form id="form" action="adiciona" method="post" class="form-horizontal">

		<div class="control-group required">
			<label for="nome" class="control-label">Nome</label>
			<div class="controls">
				<input type="text" id="nome" name="usuario.nome" class="span4" value="${usuario.nome}" required onblur="validaForm(this,10,60,1,'help-nome');"/>
				<span class="help-inline" id="help-nome" style="visibility: hidden;">mínimo de 10 caracteres</span>
			</div>
		</div>

		<div class="control-group required">
			<label for="e-mail" class="control-label">E-mail</label>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on">
						<i class="icon-envelope"></i>
					</span>
					<input type="text" id="email" name="usuario.email" class="span2" value="${usuario.email}" required onblur="validaForm(this,7,40,1,'help-email');"/>
					<span class="help-inline" id="help-email" style="visibility: hidden;">mínimo de 7 caracteres</span>
				</div>
			</div>
			
		</div>

		<div class="control-group required">
			<label for="login" class="control-label">Login</label>
			<div class="controls">
				<input type="text" id="login" name="usuario.login" class="span2" value="${usuario.login}" required onblur="validaForm(this,6,20,1,'help-login');"/>
				<span class="help-inline" id="help-login" style="visibility: hidden;">mínimo de 6 caracteres</span>
			</div>
		</div>

		<legend>
			<small>Entre com a senha e confirmação de senha</small>
		</legend>

		<div class="control-group required">
			<label for="senha" class="control-label">Senha</label>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"> <i class="icon-lock"></i></span>
					<input type="password" id="senha" name="usuario.senha" class="span2" required/>
					<span class="help-inline" id="help-senha" style="visibility: hidden;">mínimo de 6 caracteres</span>
				</div>
			</div>
		</div>

		<div class="control-group required">
			<label for="senha" class="control-label">Confirma</label>
			<div class="controls">
				<div class="input-prepend">
					<span class="add-on"> <i class="icon-lock"></i></span>
					<input type="password" id="confirmasenha" name="confirmasenha" class="span2" required/>
					<span class="help-inline" id="help-confsenha" style="visibility: hidden;">mínimo de 6 caracteres</span>
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