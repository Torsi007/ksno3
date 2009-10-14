/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;



import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.ArticleDao;
import ksno.model.Article;
import ksno.model.Category;
import ksno.util.JSFUtil;

/**
 *
 * @author Tor-Erik
 */
public class ArticleServiceImpl implements ArticleService {

    private Logger getLogService(){
      return Logger.getLogger(ArticleServiceImpl.class.getName());
    }

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
        JSFUtil.clearApplicationCache("articles");
        if(article.getCreatedDate() == null){
            article.setCreatedDate(new Date());
            article.setLastUpdatedDate(article.getCreatedDate());
        }
        return articleDao.newArticle(article);
    }

    public void updateArticle(Article article) {
        JSFUtil.clearApplicationCache("articles");
        articleDao.updateArticle(article);
    }
    
    public void deleteArticle(Article article) {
        JSFUtil.clearApplicationCache("articles");
        articleDao.deleteArticle(article);
    }
    
    public List<Article> getArticles() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<Article> returnList = (List)JSFUtil.getValue("#{ApplicationBean1.articles}", c);
        if(returnList == null){
            returnList = articleDao.getArticles();
            JSFUtil.setValue("#{ApplicationBean1.articles}", returnList, c);
        }
        return returnList;
    }

    public List<Article> getArticlesByCategory(Category category) {
        getLogService().log(Level.INFO, "About to get articles for category " + category);
        List<Article> articleList = this.getArticles();
        List<Article> returnList = new LinkedList<Article>();
        getLogService().log(Level.INFO, "Found " + articleList.size() + "articles");
        for (Article article : articleList) {
            getLogService().log(Level.INFO, "Article " + article.getName() + " is of category " + article.getCategory());
            if (article.getCategory().equals(category)) {
                getLogService().log(Level.INFO, "Hence adding it to return list");
                returnList.add(article);
            }
        }
        return returnList;
    }

    
    public List<Article> getVisibleArticles() {
        List<Article> returnList = new LinkedList<Article>();
        for(Article article : this.getArticles()){
            if(article.isVisible()){
                returnList.add(article);
            }
        }
        return returnList;
    }

    public List<Category> getCategories() {
        return articleDao.getCategories();
    }

    public Category getCategory(String name) {
        return articleDao.getCategory(name);
    }

    public Category getCategory(Long id) {
        return articleDao.getCategory(id);
    }


}
