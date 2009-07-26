/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;



import java.util.Date;
import java.util.List;
import ksno.dao.ArticleDao;
import ksno.model.Article;
import ksno.model.Category;

/**
 *
 * @author Tor-Erik
 */
public class ArticleServiceImpl implements ArticleService {

    public ArticleDao getArticleDao() {
        return articleDao;
    }

    public void setArticleDao(ArticleDao articleDao) {
        this.articleDao = articleDao;
    }
    
   private ArticleDao articleDao;

    public Article getArticle(Long id) {
        return articleDao.getArticle(id);
    }

    public Long newArticle(Article article) {
        if(article.getCreatedDate() == null){
            article.setCreatedDate(new Date());
            article.setLastUpdatedDate(article.getCreatedDate());
        }
        return articleDao.newArticle(article);
    }

    public void updateArticle(Article article) {
        articleDao.updateArticle(article);
    }
    
    public void deleteArticle(Article article) {
        articleDao.deleteArticle(article);
    }
    
    public List getArticles() {
        return articleDao.getArticles();
    }  
    
    public List<Article> getVisibleArticles() {
        return articleDao.getVisibleArticles();
    }

    public List<Category> getCategories() {
        return articleDao.getCategories();
    }

    public Category getCategory(String name) {
        return articleDao.getCategory(name);
    }


}
