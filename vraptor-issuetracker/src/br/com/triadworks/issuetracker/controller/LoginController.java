package br.com.triadworks.issuetracker.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.triadworks.issuetracker.model.Usuario;
import br.com.triadworks.issuetracker.service.Autenticador;

@Resource
public class LoginController {
	
	private Autenticador autenticador;
	private Validator validator;
	private Result result;
	private UsuarioWeb usarioWeb; 
	
	public LoginController(Autenticador autenticador, Result result, Validator validator, UsuarioWeb usarioWeb)	{
		this.autenticador = autenticador;
		this.validator = validator;
		this.result = result;
		this.usarioWeb = usarioWeb;
	}

	@Get("/login")
	public void login()	{
		
	}
	
	@Get("/logoff")
	public void deslogar()	{
		
		usarioWeb.logoff();
		
		result.redirectTo(this).login();
	}
	
	@Post("/login")
	public void logar(String login, String senha)	{
		
		Usuario user = this.autenticador.autentica(login, senha);
		
		if (user== null){
			
			validator.add(new ValidationMessage("Login e/ou senha incorreto.", "Login"));
			
			validator.onErrorForwardTo(this).login();
			
		}
		
		usarioWeb.loga(user);
		
		result.redirectTo(ProjetoController.class).lista();
	}
}
