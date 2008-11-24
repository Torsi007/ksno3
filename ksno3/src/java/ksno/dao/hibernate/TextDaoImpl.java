/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.TextDao;
import ksno.model.Text;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author tor.hauge
 */
public class TextDaoImpl implements TextDao {
    public Text getText(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Text Text = (Text)session.get(Text.class,id);
        return Text;
    }
    
    public Text getText(String name){
        
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();

        q=session.createQuery("from Text t where t.name = :nm");
        q.setParameter("nm",name);            
        returnVal =  q.list();

        return (Text)returnVal.get(0);          

    }    
    
    public Long newText(Text Text){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(Text);
        return l;
        
    }

    public void updateText(Text Text) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(Text);
        }catch(Exception e){
            session.merge(Text);
        }
    }
    
    public void deleteText(Text Text) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(Text);
    }    

    public List getTexts() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from Text t order by t.createdDate desc");
        returnVal =  q.list();
        return returnVal;        
    }
    
 

}
