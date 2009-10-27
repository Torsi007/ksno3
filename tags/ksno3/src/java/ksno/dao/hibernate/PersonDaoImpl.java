/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import ksno.dao.PersonDao;
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
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
 
        q=session.createQuery("from Instructor");
        returnVal =  q.list();

        return returnVal;        

    }
    
    public List getPersons() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from Person p order by p.lastName asc");
        returnVal =  q.list();

        return returnVal;  
    }
    
    public Person getPerson(String userId){
        
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from Person p where p.userName = :pun");
        q.setParameter("pun",userId);            
        returnVal =  q.list();

        return (Person)returnVal.get(0);          

    }
    
    public Instructor getInstructor(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Instructor instructor = (Instructor)session.get(Instructor.class,id);
        return instructor;        

    }
    
    public Long newPerson(Person person){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Long l;
        try{
            l = (Long)session.save(person);
        }finally{
            //session.getTransaction().commit();
        }
        return l;

    }

    public void updatePerson(Person person) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(person);
        }catch(Exception e){
            session.merge(person);
        }finally{
        }

    }

    public Person getPerson(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Person person = (Person)session.get(Person.class,id);
        return person; 
    }

}
