package br.com.triadworks.issuetracker.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.triadworks.issuetracker.dao.ProjetoDao;
import br.com.triadworks.issuetracker.model.Projeto;

@Repository("projetoDao")
public class ProjetoDaoImpl implements ProjetoDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Projeto> listaTudo() {
		return entityManager
				.createQuery("from Projeto", Projeto.class)
				.getResultList();
	}

	@Override
	@Transactional
	public void salva(Projeto projeto) {
		entityManager.persist(projeto);
	}

	@Override
	@Transactional
	public void atualiza(Projeto projeto) {
		entityManager.merge(projeto);
	}

	@Override
	@Transactional
	public void remove(Projeto projeto) {
		entityManager.remove(entityManager.merge(projeto));
	}

	@Override
	public Projeto carrega(Long id) {
		return entityManager.find(Projeto.class, id);
	}

	@Override
	public List<Projeto> buscaPorNome(String buscausuario) {
		
		return entityManager
				.createQuery("FROM Projeto WHERE nome like lower('%"+buscausuario+"%') ORDER BY nome", Projeto.class)
				.getResultList();
		
	}

}
