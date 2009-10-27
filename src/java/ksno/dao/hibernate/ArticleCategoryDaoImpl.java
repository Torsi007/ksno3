/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;

import java.util.List;
import ksno.dao.ArticleCategoryDao;
import ksno.model.Category;

import ksno.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author tor.hauge
 */
public class ArticleCategoryDaoImpl implements ArticleCategoryDao {

    public Category getArticleCategory(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Category category = (Category)session.get(Category.class,id);
        return category;
    }

    public Long newArticleCategory(Category category) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Long l = (Long)session.save(category);
        return l;
    }

    public void updateArticleCategory(Category category) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            session.saveOrUpdate(category);
        }catch(Exception e){
            session.merge(category);
        }
    }

    public void deleteArticleCategory(Category category) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.delete(category);
    }

    public List<Category> getArticleCategorys() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        q=session.createQuery("from Category c order by c.name desc");
        returnVal =  q.list();
        return returnVal;
    }

}
