/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import javax.faces.component.html.HtmlInputTextarea;
import javax.faces.context.FacesContext;
import ksno.model.Article;
import ksno.service.ArticleService;
import ksno.util.JSFVariableResolver;

/**
 *
 * @author halsnehauge
 */
public class UpdateArticle {

    ArticleService articleService;
    private HtmlInputTextarea body;

    public HtmlInputTextarea getBody() {
        return body;
    }

    public void setBody(HtmlInputTextarea body) {
        this.body = body;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
    
    public Article getArticle() throws Exception{
        String articleId = JSFVariableResolver.getStringValue(FacesContext.getCurrentInstance(),"#{CreateArticle_Backing.article.id}");
        return articleService.getArticle(Integer.parseInt(articleId));
    }
    
    public String updateArticle(){
        //Article article = new articleService.getArticle("h");

        //article.setBody(body.getValue().toString());
        return "r";
    }
}
