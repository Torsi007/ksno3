/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import ksno.model.Article;
import ksno.service.ArticleService;

/**
 *
 * @author halsnehauge
 */
public class ViewArticle {
    Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public Article getArticle() {
        Article returnArticle = articleService.getArticle(id);
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
