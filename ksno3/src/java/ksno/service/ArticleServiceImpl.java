/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;



import java.util.Date;
import java.util.List;
import ksno.dao.ArticleDao;
import ksno.model.Article;

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

    public Article getArticle(int id) {
        return articleDao.getArticle(id);
    }

    public Integer newArticle(Article article) {
        if(article.getCreatedDate() == null){
            article.setCreatedDate(new Date());
            article.setLastUpdatedDate(article.getCreatedDate());
        }
        return articleDao.newArticle(article);
    }

    public void updateArticle(Article article) {
        articleDao.updateArticle(article);
    }
    
    public List getArticles() {
        return articleDao.getArticles();
    }    

}
