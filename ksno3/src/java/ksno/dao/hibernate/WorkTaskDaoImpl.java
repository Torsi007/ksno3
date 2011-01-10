/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.WorkTaskDao;
import ksno.model.WorkTask;

import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author tor.hauge
 */
public class WorkTaskDaoImpl implements WorkTaskDao {

    public WorkTask getWorkTask(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        WorkTask task = (WorkTask)session.get(WorkTask.class,id);
        return task;
    }

    public Long newWorkTask(WorkTask task) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(task);
        return l;
    }

    public void updateWorkTask(WorkTask task) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(task);
        }catch(Exception e){
            session.merge(task);
        }
    }

    public void deleteWorkTask(WorkTask task) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(task);
    }

    public List<WorkTask> getWorkTasks() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from WorkTask c order by c.name desc");
        returnVal =  q.list();
        return returnVal;
    }

}
