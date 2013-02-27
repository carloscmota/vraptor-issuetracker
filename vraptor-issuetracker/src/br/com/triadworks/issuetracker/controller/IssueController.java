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
import br.com.triadworks.issuetracker.dao.IssueDao;
import br.com.triadworks.issuetracker.model.Issue;

@Resource
public class IssueController {

	private IssueDao dao;
	private Result result;
	private Validator validator;

	public IssueController(IssueDao p, Result result, Validator validator) {
		this.dao = p;
		this.result = result;
		this.validator = validator;
	}

	@Post("/issues")
	public void adiciona(Issue issue) {

		valida(issue);

		validator.onErrorUsePageOf(this).novo();

		this.dao.salva(issue);

		result.include("notice", "Issue adicionado com sucesso!");

		result.redirectTo(this).lista();

	}

	private void valida(Issue issue) {

		if (issue.getDescricao() == null || issue.getDescricao().length() < 5) {

			validator.add(new ValidationMessage(
					"Campo obrigatório e ter no mínimo 5 caracteres", "Descrição"));
		}

	}

	public void buscar(String buscaissue) {

		if (buscaissue == null || buscaissue.equals("")) {

			result.redirectTo(this).lista();

		} else {

			result.include("issueList", this.dao.buscaPorDescricao(buscaissue));

			result.include("valorbusca", buscaissue);

			result.use(Results.page()).of(IssueController.class).lista();
		}

	}

	@Get("/issues")
	public List<Issue> lista() {

		return this.dao.listaTudo();
	}

	@Get("/issues/novo")
	public void novo() {

	}

	@Delete("/issues/{id}")
	public void remove(Long id) {

		Issue u = dao.carrega(id);

		dao.remove(u);

		result.include("notice", "Issue excluído com sucesso!");

		result.redirectTo(this).lista();
	}

	@Get("/issues/{id}")
	public Issue edita(Long id) {

		return dao.carrega(id);

	}

	@Put("/issues/{issue.id}")
	public void altera(Issue issue, String confirmasenha) {

		valida(issue);

		validator.onErrorUsePageOf(this).edita(null);

		dao.atualiza(issue);

		result.include("notice", "Issue atualizado com sucesso!");

		result.redirectTo(this).lista();

	}
}
