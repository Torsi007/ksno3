/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import ksno.dao.PersonDao;
import java.util.LinkedList;
import java.util.List;
import ksno.model.Instructor;
import ksno.model.Person;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;


/**
 *
 * @author Tor-Erik
 */
public class PersonDaoImpl implements PersonDao {

    public List getInstructors() {
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Instructor");
        return q.list();
    }
    
    public List getPersons() {
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Person");
        
        
        return q.list();
    }
    
    public Person getPerson(String userId){
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Person p where p.userName = :pun");
        q.setParameter("pun",userId);
        return (Person)q.list().get(0);
    }
    
    public Instructor getInstructor(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Instructor instructor = (Instructor)session.get(Instructor.class,id);
        return instructor;
    }
    
    public Long newPerson(Person person){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Long l = (Long)session.save(person);
        session.getTransaction().commit();
        return l;
        
    }    

}
