package com.project.stylezone;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceUnit;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Component;

@Component
public class QueryExecutor {

	@PersistenceUnit(name = "StyleZoneEntityUnit")
	private EntityManager em;

	private CriteriaBuilder cb = null;

	public void init() {
		if (cb == null) {
			cb = em.getCriteriaBuilder();
		}
	}

	/*public Object execute(Class<?> clz,Object obj) {
		CriteriaQuery<?> q = cb.createQuery(clz);
		Root<?> c = q.from(clz);
		ParameterExpression<Integer> p = cb.parameter(Integer.class);
		q.select(c).where(cb.gt(c.get("population"), p));
	}*/

}
