/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.CourseDao;
import ksno.model.BeginnerCourse;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author halsnehauge
 */
public class CourseDaoImpl implements CourseDao {
    
    public List getCourses() {
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from BeginnerCourse bc order by bc.startDate desc");
        return q.list();
    }

    public Long newCourse(BeginnerCourse course) {
        //Long l = null;
        try{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(course);
        session.getTransaction().commit();
        }catch(Exception e){
            String s = e.getMessage();
        }
        return new Long(-1);
    }
}
