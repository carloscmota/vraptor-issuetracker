package br.com.triadworks.issuetracker.controller.interceptor;

import java.util.Arrays;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.triadworks.issuetracker.controller.LoginController;
import br.com.triadworks.issuetracker.controller.UsuarioWeb;

@Intercepts
public class AutenticacaoInterceptor implements Interceptor {
	UsuarioWeb usuarioWeb;
	Result result;
	
	public AutenticacaoInterceptor(UsuarioWeb usuarioWeb, Result result) {
		this.usuarioWeb = usuarioWeb;
		this.result = result;
	}

	@Override
	public boolean accepts(ResourceMethod method) {
		boolean logado = usuarioWeb.isLogado();
		boolean login = method.getMethod().getDeclaringClass().equals(LoginController.class);
		
		return !logado && !login;
	}

	@Override
	public void intercept(InterceptorStack stack, ResourceMethod m, Object o) throws InterceptionException {
		result.include("errors", Arrays.asList(new ValidationMessage("Usuário não logado", "Login")));
		result.redirectTo(LoginController.class).login();
	}

}
