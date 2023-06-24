package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.User;
import entity.Video;
import extensions.jpaUtils;

public class UserDAO {
	private EntityManager em = jpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	public User create(User entity) {
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		return entity;
	}
	public User update(User entity) {
		em.getTransaction().begin();			
		em.merge(entity);
		em.getTransaction().commit();
		return entity;
	}
	public void updatePassword(String id, String password) {
		try {
			em.getTransaction().begin();
			User entity = findById(id);
			entity.setPassword(password);
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
	public void delete(String id) {
		try {
			em.getTransaction().begin();
			User entity = findById(id);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
	
	public User findById(String id) {
		User entity = em.find(User.class, id);
		return entity;
	}
	public List<User> findAll() {
		String jpql = "SELECT o FROM User o";
		TypedQuery<User>  query = em.createQuery(jpql,User.class);
		List<User> list = query.getResultList();
		return list;
	}
	public List<User> findAllByPage(int page) {
		String jpql = "SELECT o FROM User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setMaxResults(6);
		query.setFirstResult((page - 1) * 6);
		List<User> list = query.getResultList();
		return list;
	}
}
