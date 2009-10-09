/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import ksno.dao.EventDao;
import ksno.model.BeginnerCourse;
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
        //session.beginTransaction();
        Long l;
        try{
            l = (Long)session.save(event);
        }finally{
            //session.getTransaction().commit();
            //session.close();          
        }
        return l;
    }
    
    public void deleteEvent(Event event) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        try{
            session.delete(event);
        }finally{
            //session.getTransaction().commit();
            //session.close();
        }        
    }      
    
    public void updateEvent(Event event) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        try{
            session.saveOrUpdate(event);
        }catch(Exception e){
            session.merge(event);
        }finally{
            //session.getTransaction().commit(); 
            //session.close();
        }
        

    }    

    public List getEvents() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from Event e order by e.startDate desc");
        returnVal =  q.list();

        return returnVal;                

    }

    public Event getEvent(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Event event = (Event)session.get(Event.class,id);
        return event;        
    }
    
    public BeginnerCourse getBeginnerCourse(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        BeginnerCourse course = (BeginnerCourse)session.get(BeginnerCourse.class,id);
        return course;        
    }    
    
    public List getOpenBeginnerCourses() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from BeginnerCourse bc where  bc.open = '1' order by bc.startDate desc");
        returnVal =  q.list();

        return returnVal;         
        

    }
    
    public List getOpenBeginnerCourses(Date fromDate, Date toDate, String location) {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from BeginnerCourse bc where bc.open = '1' and bc.location = :loc and bc.startDate between :sd and :ed order by bc.startDate desc");
        q.setParameter("sd",fromDate);
        q.setParameter("ed",toDate);
        q.setParameter("loc",location);
        returnVal =  q.list();

        return returnVal;         

    }      
    
    public List getBeginnerCourses() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from BeginnerCourse bc where order by bc.startDate asc");
        returnVal =  q.list();

        return returnVal;         
        

    }

    public List<BeginnerCourse> getBeginnerCourses(Calendar fromDate) {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();

        q=session.createQuery("from BeginnerCourse bc where bc.startDate > :fromdate order by bc.startDate asc");
        q.setParameter("fromdate",fromDate.getTime());
        returnVal =  q.list();

        return returnVal;
    }
    
    public List getBeginnerCourses(Date fromDate, Date toDate, String location) {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from BeginnerCourse bc where bc.location = :loc and bc.startDate between :sd and :ed order by bc.startDate asc");
        q.setParameter("sd",fromDate);
        q.setParameter("ed",toDate);
        q.setParameter("loc",location);
        returnVal =  q.list();

        return returnVal;         

    }

    public List getEvents(Calendar fromDate) {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();


        q=session.createQuery("from Event e where e.startDate > :fromdate order by e.startDate asc");
        q.setParameter("fromdate",fromDate.getTime());
        returnVal =  q.list();

        return returnVal;
    }
    
     
    
}
