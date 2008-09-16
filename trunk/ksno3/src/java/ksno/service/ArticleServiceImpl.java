/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;



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

}
