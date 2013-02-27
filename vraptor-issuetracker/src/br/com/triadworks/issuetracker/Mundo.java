package br.com.triadworks.issuetracker;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.triadworks.issuetracker.model.Usuario;

@Resource
public class Mundo {
	
	private Result result;
	
	public Mundo(Result r)	{
		this.result = r;
		
	}

	public String boasVindas() {

		result.include("user",this.usuario());
		
		return "kakakdakadhkjhak akjdhakdhaksdhajksd!";
	}

	public List<String> paises() {

		List<String> paises = new ArrayList<String>();
		
		paises.add("Brasil");
		paises.add("Spain");
		paises.add("França");
		paises.add("Chile");
		
		return paises;
		
	}
	
	public Usuario usuario()	{
		
		Usuario u = new Usuario();
		
		u.setEmail("asasd@adad.com");
		u.setNome("Teste");
		u.setLogin("teste");
		u.setSenha("123456");
		
		return u;
	}
}
