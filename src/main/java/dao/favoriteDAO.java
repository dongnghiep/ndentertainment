package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.Favorite;
import entity.User;
import entity.Video;
import extensions.jpaUtils;

public class favoriteDAO {
	private EntityManager em = jpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	public List<Favorite> findByUserid(String id) {
		String jpql = "SELECT o FROM Favorite o WHERE o.user.id =:id";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("id", id);
		List<Favorite> list = query.getResultList();
		return list;
	}

	public Favorite findById(String id) {
		Favorite entity = em.find(Favorite.class, id);
		return entity;
	}

	public Favorite findByVidUid(String videoid, String userid) {
		String jpql = "select o from Favorite o where o.video.id =:videoid and o.user.id =:userid";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("videoid", videoid);
		query.setParameter("userid", userid);
		Favorite entity = query.getSingleResult();
		return entity;
	}

	public Favorite create(Favorite entity) {
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		return entity;
	}

	public void delete(String videoid, String userid) {
		try {
			em.getTransaction().begin();
			Favorite entity = findByVidUid(videoid, userid);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
