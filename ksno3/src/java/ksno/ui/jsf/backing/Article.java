/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import ksno.service.ArticleService;

/**
 *
 * @author halsnehauge
 */
public class Article {
    Long id;
    String prettyPrintId;

    public String getPrettyPrintId() {
        return prettyPrintId;
    }

    public void setPrettyPrintId(String prettyPrintId) {
        this.prettyPrintId = prettyPrintId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public ksno.model.Article getArticle() {
        ksno.model.Article returnArticle = null;
        if(this.getId() != null){
            returnArticle = articleService.getArticle(id);
        }else{
            returnArticle = articleService.getArticle(prettyPrintId);
        }

        return returnArticle;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
    ArticleService articleService;
}
