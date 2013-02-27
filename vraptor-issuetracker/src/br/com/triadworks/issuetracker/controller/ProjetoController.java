package br.com.triadworks.issuetracker.controller;

import java.util.List;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.caelum.vraptor.view.Results;
import br.com.triadworks.issuetracker.dao.ProjetoDao;
import br.com.triadworks.issuetracker.model.Projeto;

@Resource
public class ProjetoController {

	private ProjetoDao dao;
	private Result result;
	private Validator validator;

	public ProjetoController(ProjetoDao p, Result result, Validator validator) {
		this.dao = p;
		this.result = result;
		this.validator = validator;
	}

	@Post("/projetos")
	public void adiciona(Projeto projeto) {

		valida(projeto);

		validator.onErrorUsePageOf(this).novo();

		this.dao.salva(projeto);

		result.include("notice", "Projeto adicionado com sucesso!");

		result.redirectTo(this).lista();

	}

	private void valida(Projeto projeto) {

		if (projeto.getNome() == null || projeto.getNome().length() < 5) {

			validator.add(new ValidationMessage(
					"Campo obrigatório e ter no mínimo 5 caracteres", "Nome"));
		}

	}

	public void buscar(String buscaprojeto) {

		if (buscaprojeto == null || buscaprojeto.equals("")) {

			result.redirectTo(this).lista();

		} else {

			result.include("projetoList", this.dao.buscaPorNome(buscaprojeto));

			result.include("valorbusca", buscaprojeto);

			result.use(Results.page()).of(ProjetoController.class).lista();
		}

	}

	@Get("/projetos")
	public List<Projeto> lista() {

		return this.dao.listaTudo();
	}

	@Get("/projetos/novo")
	public void novo() {

	}

	@Delete("/projetos/{id}")
	public void remove(Long id) {

		Projeto u = dao.carrega(id);

		dao.remove(u);

		result.include("notice", "Projeto excluído com sucesso!");

		result.redirectTo(this).lista();
	}

	@Get("/projetos/{id}")
	public Projeto edita(Long id) {

		return dao.carrega(id);

	}

	@Put("/projetos/{projeto.id}")
	public void altera(Projeto projeto, String confirmasenha) {

		valida(projeto);

		validator.onErrorUsePageOf(this).edita(null);

		dao.atualiza(projeto);

		result.include("notice", "Projeto atualizado com sucesso!");

		result.redirectTo(this).lista();

	}
}
