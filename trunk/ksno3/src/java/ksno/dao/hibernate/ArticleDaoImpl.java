/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;


import java.util.List;
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

    public Article getArticle(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Article article = (Article)session.get(Article.class,id);
        return article;
    }
    
    public Long newArticle(Article article){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Long l;
        try{
            l = (Long)session.save(article);
        }finally{
            session.getTransaction().commit();
            //session.close();          
        }
        return l;
        
    }

    public void updateArticle(Article article) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        try{
            session.saveOrUpdate(article);
        }catch(Exception e){
            session.merge(article);
        }finally{
            session.getTransaction().commit(); 
            //session.close();
        }
        

    }
    
    public void deleteArticle(Article article) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        try{
            session.delete(article);
        }finally{
            session.getTransaction().commit();
            //session.close();
        }

    }    

    public List getArticles() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Article a order by a.createdDate desc");
        returnVal =  q.list();
        return returnVal;        
    }
    
    public List getVisibleArticles() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        q=session.createQuery("from Article a where a.visible = '1' order by a.createdDate desc");
        returnVal =  q.list();

        return returnVal;
    }    

}
