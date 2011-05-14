/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.WorkHoursDao;
import ksno.model.Instructor;
import ksno.model.WorkHours;

import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author tor.hauge
 */
public class WorkHoursDaoImpl implements WorkHoursDao {

    public WorkHours getWorkHours(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        WorkHours task = (WorkHours)session.get(WorkHours.class,id);
        return task;
    }

    public Long newWorkHours(WorkHours task) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(task);
        return l;
    }

    public void updateWorkHours(WorkHours task) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(task);
        }catch(Exception e){
            session.merge(task);
        }
    }

    public void deleteWorkHours(WorkHours task) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(task);
    }

    public List<WorkHours> getWorkHoursList() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from WorkHours c order by c.workDate desc");
        returnVal =  q.list();
        return returnVal;
    }

    public List<WorkHours> getWorkHoursListByInstructor(Instructor instructor) {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from WorkHours c where c.instructor = :ins order by c.workDate desc");
        q.setParameter("ins",instructor);
        returnVal =  q.list();
        return returnVal;
    }


    public List<WorkHours> getWorkHours() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
