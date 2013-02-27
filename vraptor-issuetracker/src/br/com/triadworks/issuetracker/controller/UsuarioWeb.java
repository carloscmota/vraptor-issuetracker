package br.com.triadworks.issuetracker.controller;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.triadworks.issuetracker.model.Usuario;

@SessionScoped
@Component
public class UsuarioWeb {

	private Usuario usuario;
	
	public void loga(Usuario usuario){
		
		this.usuario = usuario;
	}
	
	public void logoff(){
		
		this.usuario = null;
	}
	
	public Usuario getUsuario()	{
		
		return this.usuario; 
	}
	
	public boolean isLogado()	{
		
		return this.usuario!=null;
	}
}
