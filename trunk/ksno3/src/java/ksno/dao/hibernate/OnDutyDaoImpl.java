/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.OnDutyDao;
import ksno.model.OnDuty;
import ksno.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Query;
/**
 *
 * @author HalsneHauge
 */
public class OnDutyDaoImpl implements OnDutyDao {

    public Long newOnDuty(OnDuty onDuty) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(onDuty);
        return l;
    }

    public OnDuty getOnDuty(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        OnDuty onDuty = (OnDuty)session.get(OnDuty.class,id);
        return onDuty;
    }

    public void updateOnDuty(OnDuty onDuty) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(onDuty);
        }catch(Exception e){
            session.merge(onDuty);
        }
    }

    public void deleteOnDuty(OnDuty onDuty) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(onDuty);
    }

    public List<OnDuty> getOnDutys() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from OnDuty a order by a.fromDate desc");
        returnVal =  q.list();
        return returnVal;
    }

}
