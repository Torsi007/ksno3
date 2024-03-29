/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;


import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.ArticleDao;
import ksno.model.Article;
import ksno.model.Category;
import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;


/**
 *
 * @author halsnehauge
 */
public class ArticleDaoImpl implements ArticleDao {

    private Logger getLogService(){
      return Logger.getLogger(ArticleDaoImpl.class.getName());
    }

    public Article getArticle(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Article article = (Article)session.get(Article.class,id);
        return article;
    }

    public Article getArticle(String prettyPrintId) {
        Article toReturn = null;
        try{
            Query q = null;
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            q=session.createQuery("from Article a where a.prettyPrintId = :ppid");
            q.setParameter("ppid",prettyPrintId);
            toReturn = (Article) q.list().get(0);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Not able to find article with pretty print id " + prettyPrintId + ". Technical error message: " + e.getMessage());
        }
        return toReturn;
    }


    
    public Long newArticle(Article article){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Long l;
        try{
            l = (Long)session.save(article);
        }finally{
            //session.getTransaction().commit();
            //session.close();          
        }
        return l;
        
    }

    public void updateArticle(Article article) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        try{
            session.saveOrUpdate(article);
        }catch(Exception e){
            session.merge(article);
        }finally{
            //session.getTransaction().commit(); 
            //session.close();
        }
        

    }
    
    public void deleteArticle(Article article) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        try{
            session.delete(article);
        }finally{
            //session.getTransaction().commit();
            //session.close();
        }

    }    

    public List<Article> getArticles() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        q=session.createQuery("from Article a order by a.createdDate desc");
        returnVal =  q.list();
        return returnVal;        
    }

    public Category getCategory(String name){
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        q=session.createQuery("from Category ac where ac.name = :pun");
        q.setParameter("pun",name);
        returnVal =  q.list();

        return (Category)returnVal.get(0);
    }

    public List<Category> getCategories() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        q=session.createQuery("from Category a order by a.name desc");
        returnVal =  q.list();
        return returnVal;
    }

    public Category getCategory(Long id) {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        q=session.createQuery("from Category ac where ac.id = :pun");
        q.setParameter("pun",id);
        returnVal =  q.list();

        return (Category)returnVal.get(0);
    }
    
    public List<Article> getVisibleArticles() {

        Query q = null;
        List<Article> returnVal = null;
                try{
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        q=session.createQuery("from Article a where a.visible = '1' order by a.createdDate desc");
        returnVal =  q.list();}
        catch(Exception ex){
           String s = ex.getMessage(); 
            
        }

        return returnVal;
    }






}
