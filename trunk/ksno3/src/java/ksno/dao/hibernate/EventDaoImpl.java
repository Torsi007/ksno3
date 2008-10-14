/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.EventDao;
import ksno.model.Event;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author halsnehauge
 */
public class EventDaoImpl implements EventDao {

    public Long newEvent(Event event) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Object o = session.save(event);
        session.getTransaction().commit();
        return new Long(-1);
    }

    public List getEvents() {
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Event e order by e.startDate desc");
        return q.list();
    }

    public Event getEvent(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Event event = (Event)session.get(Event.class,id);
        return event;
    }
    
}
