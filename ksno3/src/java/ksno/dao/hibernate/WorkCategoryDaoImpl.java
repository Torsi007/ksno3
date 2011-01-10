/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.WorkCategoryDao;
import ksno.model.WorkCategory;

import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author tor.hauge
 */
public class WorkCategoryDaoImpl implements WorkCategoryDao {

    public WorkCategory getWorkCategory(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        WorkCategory category = (WorkCategory)session.get(WorkCategory.class,id);
        return category;
    }

    public Long newWorkCategory(WorkCategory category) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(category);
        return l;
    }

    public void updateWorkCategory(WorkCategory category) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(category);
        }catch(Exception e){
            session.merge(category);
        }
    }

    public void deleteWorkCategory(WorkCategory category) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(category);
    }

    public List<WorkCategory> getWorkCategorys() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from WorkCategory c order by c.name desc");
        returnVal =  q.list();
        return returnVal;
    }

}
