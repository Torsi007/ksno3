/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.ExperienceLevelDao;
import ksno.model.ExperienceLevel;

import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author tor.hauge
 */
public class ExperienceLevelDaoImpl implements ExperienceLevelDao {

    public ExperienceLevel getExperienceLevel(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        ExperienceLevel experienceLevel = (ExperienceLevel)session.get(ExperienceLevel.class,id);
        return experienceLevel;
    }

    public Long newExperienceLevel(ExperienceLevel experienceLevel) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(experienceLevel);
        return l;
    }

    public void updateExperienceLevel(ExperienceLevel experienceLevel) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(experienceLevel);
        }catch(Exception e){
            session.merge(experienceLevel);
        }
    }

    public void deleteExperienceLevel(ExperienceLevel experienceLevel) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(experienceLevel);
    }

    public List<ExperienceLevel> getExperienceLevels() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from ExperienceLevel c order by c.rank asc");
        returnVal =  q.list();
        return returnVal;
    }

}
