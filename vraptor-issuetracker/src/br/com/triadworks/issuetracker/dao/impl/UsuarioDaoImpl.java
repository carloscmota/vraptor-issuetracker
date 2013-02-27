package br.com.triadworks.issuetracker.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Usuario;

@Repository("usuarioDao")
public class UsuarioDaoImpl implements UsuarioDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Usuario> listaTudo() {
		return entityManager
				.createQuery("FROM Usuario ORDER BY nome", Usuario.class)
				.getResultList();
	}

	@Override
	@Transactional
	public void salva(Usuario usuario) {
		entityManager.persist(usuario);
	}

	@Override
	@Transactional
	public void atualiza(Usuario usuario) {
		entityManager.merge(usuario);
	}

	@Override
	@Transactional
	public void remove(Usuario usuario) {
		entityManager.remove(entityManager.merge(usuario));
	}

	@Override
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
	public Usuario buscaPor(String login, String senha) {
		return (Usuario) createCriteria()
			.add(Restrictions.eq("login", login))
			.add(Restrictions.eq("senha", senha))
			.uniqueResult();
	}

	@Override
	public Usuario carrega(Long id) {
		return entityManager.find(Usuario.class, id);
	}
	
	private Criteria createCriteria() {
		Session session = entityManager.unwrap(Session.class);
		return session.createCriteria(Usuario.class);
	}
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS, readOnly=true)
	public List<Usuario> buscaPorNome(String buscausuario)	{
		
		return entityManager
				.createQuery("FROM Usuario WHERE nome like lower('%"+buscausuario+"%') OR email like lower('%"+buscausuario+"%') ORDER BY nome", Usuario.class)
				.getResultList();
	}

}
