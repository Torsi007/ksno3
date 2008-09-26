/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import ksno.service.ArticleService;

/**
 *
 * @author halsnehauge
 */
public class Current {
    ArticleService articleService;

    public String getArticleUrl() {
        return "Article.jsp";
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public List getArticles() {
        return articleService.getArticles();
    }
}
