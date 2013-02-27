package br.com.triadworks.issuetracker.controller;

import java.util.List;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.caelum.vraptor.view.Results;
import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Usuario;

@Resource
public class UsuarioController {

	private UsuarioDao dao;
	private Result result;
	private Validator validator;
	
	public UsuarioController(UsuarioDao d, Result result, Validator validator)	{
		this.dao = d;
		this.result = result;
		this.validator = validator;
	}
	
	public void adiciona(Usuario usuario, String confirmasenha)	{
		
		valida(usuario, confirmasenha);
		
		validator.onErrorUsePageOf(this).novo();
		
		this.dao.salva(usuario);
		
		result.include("notice","Usuário adicionado com sucesso!");
		
		result.redirectTo(this).lista();
		
	}

	private void valida(Usuario usuario, String confirmasenha) {
		
		if	( usuario.getNome()==null || usuario.getNome().length() < 5 )	{
			
			validator.add(new ValidationMessage("Campo obrigatório e ter no mínimo 5 caracteres", "Nome"));
		}
		
		if	( usuario.getEmail()==null )	{
			
			validator.add(new ValidationMessage("Campo obrigatório", "Email"));
			
		}else if ( !usuario.getEmail().contains("@") || usuario.getEmail().length() < 7 )	{
			
			validator.add(new ValidationMessage("E-mail inválido", "Email"));
		}

		if	( usuario.getLogin()==null || usuario.getLogin().length() < 3 )	{
					
					validator.add(new ValidationMessage("Campo obrigatório e ter no mínimo 3 caracteres", "Login"));
				}
		
		System.out.println(usuario.getId());
		
		if	( (usuario.getSenha()==null || usuario.getSenha().length() < 6 ) && usuario.getId()==null)	{
			
			validator.add(new ValidationMessage("Campo obrigatório e ter no mínimo 6 caracteres", "Senha"));
			
		}else if ( (confirmasenha==null || !usuario.getSenha().equals(confirmasenha)) && usuario.getId()==null)	{
			
			validator.add(new ValidationMessage("Senhas não conferem", "Confirmação de Senha"));
		}
	}
	
	public List<Usuario> lista()	{
		
		return this.dao.listaTudo();
	}
	
	public void buscar(String buscausuario)	{
		
		if (buscausuario==null || buscausuario.equals(""))	{
			
			result.redirectTo(this).lista();
			
		}else	{
		
			result.include("usuarioList",this.dao.buscaPorNome(buscausuario));
			
			result.include("valorbusca",buscausuario);
			
			result.use(Results.page()).of(UsuarioController.class).lista();
		}
		
	}
	
	public void novo()	{
		
	}
	
	public void remove(Long id)	{
		
		Usuario u = dao.carrega(id);
		
		//dao.remove(u);
		
		//result.include("notice","Usuário excluído com sucesso!");
				
		//result.redirectTo(this).lista();
		
		//result.nothing();
		
		//result.use(Results.json()).from(u,"user").exclude("senha","email","login","id").serialize();
		
		result.use(Results.json()).withoutRoot().from(u).exclude("senha","email","login","id").serialize();
		
		result.use(Results.json()).withoutRoot().from(u).include().exclude("senha","email","login","id").serialize();
		
		
	}
	
	public Usuario edita(Long id){
		
		return dao.carrega(id);
		
	}
	public void altera(Usuario usuario, String confirmasenha)	{
		
		valida(usuario, confirmasenha);
		
		validator.onErrorUsePageOf(this).edita(null);
		
		dao.atualiza(usuario);
		
		result.include("notice","Usuário atualizado com sucesso!");
		
		result.redirectTo(this).lista();
		
	}
}
