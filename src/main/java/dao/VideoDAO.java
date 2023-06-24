package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.Video;
import extensions.jpaUtils;

public class VideoDAO {
	private EntityManager em = jpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	public Video findById(String id) {
		Video entity = em.find(Video.class, id);
		return entity;
	}

	public List<Video> findAll() {
		String jpql = "SELECT o FROM Video o ";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}
	
	public List<Video> findAllActive() {
		String jpql = "SELECT o FROM Video o WHERE o.active = 1";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}
	public List<Video> findAllByPage(int page) {
		String jpql = "SELECT o FROM Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setMaxResults(6);
		query.setFirstResult((page - 1) * 6);
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> findAllByPageActive(int page) {
		String jpql = "SELECT o FROM Video o WHERE o.active = 1";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setMaxResults(6);
		query.setFirstResult((page - 1) * 6);
		List<Video> list = query.getResultList();
		return list;
	}

	public Video create(Video entity) {
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		return entity;
	}

	public Video update(Video entity) {
		em.getTransaction().begin();
		em.merge(entity);
		em.getTransaction().commit();
		return entity;
	}

	public Video delete(String id) {
		Video entity = findById(id);
		entity.setActive(false);
		return update(entity);
	}
}
