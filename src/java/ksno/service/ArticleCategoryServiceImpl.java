/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.ArticleCategoryDao;
import ksno.model.Category;
import ksno.util.JSFUtil;


/**
 *
 * @author tor.hauge
 */
public class ArticleCategoryServiceImpl implements ArticleCategoryService {
   private ArticleCategoryDao articleCategoryDao;

    private Logger getLogService(){
      return Logger.getLogger(ArticleServiceImpl.class.getName());
    }

    public ArticleCategoryDao getArticleCategoryDao() {
        return articleCategoryDao;
    }

    public void setArticleCategoryDao(ArticleCategoryDao ArticleCategoryDao) {
        this.articleCategoryDao = ArticleCategoryDao;
    }

    public Category getArticleCategory(Long id) {
        return articleCategoryDao.getArticleCategory(id);
    }

    public Long newArticleCategory(Category category) {
        JSFUtil.clearApplicationCache("articleCategorys");   
        return articleCategoryDao.newArticleCategory(category);
    }

    public void updateArticleCategory(Category category) {
        JSFUtil.clearApplicationCache("articleCategorys");
        articleCategoryDao.updateArticleCategory(category);
    }
    
    public void deleteArticleCategory(Category category) {
        JSFUtil.clearApplicationCache("articleCategorys");
        articleCategoryDao.deleteArticleCategory(category);
    }
    
    public List<Category> getArticleCategorys() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<Category> returnList = (List)JSFUtil.getValue("#{ApplicationBean1.articleCategorys}", c);
        if(returnList == null){
            returnList = articleCategoryDao.getArticleCategorys();
            JSFUtil.setValue("#{ApplicationBean1.articleCategorys}", returnList, c);
        }
        return returnList;
    }



}
