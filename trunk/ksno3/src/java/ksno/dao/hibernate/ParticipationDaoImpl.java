/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.ParticipationDao;
import ksno.model.Participation;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;


/**
 *
 * @author halsnehauge
 */
public class ParticipationDaoImpl implements ParticipationDao {
    
    public Participation getParticipation(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Participation participation = (Participation)session.get(Participation.class,id);
        return participation;
    }
    
    public Long newParticipation(Participation participation){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Long l = (Long)session.save(participation);
        session.getTransaction().commit();
        return l;
        
    }

    public void updateParticipation(Participation participation) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        try{
            session.saveOrUpdate(participation);
        }catch(Exception e){
            session.merge(participation);
        }
        
        session.getTransaction().commit();
    }

    public List getParticipations() {
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Participation p order by p.createdDate desc");
        return q.list();
    }
}
