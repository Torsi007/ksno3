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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public ksno.model.Article getArticle() {
        ksno.model.Article returnArticle = articleService.getArticle(id);
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
