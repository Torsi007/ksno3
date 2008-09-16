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
    int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public Article getArticle() {
        return articleService.getArticle(id);
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
    ArticleService articleService;
}
