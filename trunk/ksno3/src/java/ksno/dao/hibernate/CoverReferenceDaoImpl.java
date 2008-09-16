/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.CoverReferenceDao;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;



/**
 *
 * @author halsnehauge
 */
public class CoverReferenceDaoImpl implements CoverReferenceDao {

    public List getCoverReferences() {
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from CoverReference");
        return q.list();
    }

}
