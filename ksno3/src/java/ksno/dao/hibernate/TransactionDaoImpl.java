/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.TransactionDao;
import ksno.model.Transaction;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author tor.hauge
 */
public class TransactionDaoImpl implements TransactionDao {
    
    public Transaction getTransaction(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = (Transaction)session.get(Transaction.class,id);
        return transaction;
    }
    
    public Long newTransaction(Transaction transaction){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(transaction);
        return l;
        
    }

    public void updateTransaction(Transaction transaction) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(transaction);
        }catch(Exception e){
            session.merge(transaction);
        }finally{
            //session.getTransaction().commit(); 
            //session.close();
        }
        

    }
    
    public void deleteTransaction(Transaction transaction) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(transaction);

    }    

    public List getTransactions() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from Transaction a order by a.date desc");
        returnVal =  q.list();
        return returnVal;        
    }    

}
