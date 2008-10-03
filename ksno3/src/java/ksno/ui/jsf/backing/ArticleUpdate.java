/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import javax.faces.component.html.HtmlInputTextarea;
import ksno.model.Article;
import ksno.service.ArticleService;
import ksno.util.JSFUtil;

/**
 *
 * @author halsnehauge
 */
public class ArticleUpdate {
    ArticleService articleService;
    private HtmlInputTextarea body;

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public HtmlInputTextarea getBody() {
        return body;
    }

    public void setBody(HtmlInputTextarea body) {
        this.body = body;
    }
    

    public String saveArticle(){
        String returnvalue = "articlesMaintain";
        try{
            Article article = (Article)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanArticleModify);
            String bdy = body.getValue().toString();
            article.setBody(bdy.replaceAll("\"", "'"));
            articleService.updateArticle(article);        
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanArticleModify);            
        }catch(Exception ex){
            returnvalue = "nogo";
        }
        return returnvalue;

    }
}
