/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;


import ksno.dao.ArticleDao;
import ksno.model.Article;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author halsnehauge
 */
public class ArticleDaoImpl implements ArticleDao {

    public Article getArticle(Integer id) {
        Query q = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Article a where a.id = :aid");
        q.setParameter("aid",id);
        return (Article)q.list().get(0);
    }
    
    public boolean newArticle(String name){
        return false;
    }

}
