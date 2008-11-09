/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.html.HtmlInputTextarea;
import javax.faces.component.html.HtmlOutputText;
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
    private HtmlOutputText errorMsg;  
    
  private Logger getLogService(){
      return Logger.getLogger(ArticleUpdate.class.getName());
  }    

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }


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
        String returnvalue = tempSaveArticle();
        try{
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanArticleModify);            
        }catch(Exception ex){
            returnvalue = "nogo";
        }
        return returnvalue;

    }
    
    public String tempSaveArticle(){
        String returnvalue = "articlesMaintain";
        try{
            Article article = (Article)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanArticleModify);
            String bdy = body.getValue().toString();
            article.setBody(bdy.replaceAll("\"", "'"));
            articleService.updateArticle(article);        
        }catch(Exception ex){
            getLogService().log(Level.SEVERE,"Unable to create article", ex);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + ex.getMessage());
            returnvalue = "nogo";
        }
        return returnvalue;

    }    
    
    public String goToArticleImagesUpdate(){
        String returnvalue = "articleImagesUpdate";
        if("nogo".equals(this.tempSaveArticle())){
            returnvalue = "nogo";
        }
        return returnvalue;    
    }
    
    public String goToArticleMasterUpdate(){
        String returnvalue = "articleMasterUpdate";
        if("nogo".equals(this.tempSaveArticle())){
            returnvalue = "nogo";
        }
        return returnvalue;    
    }    
}
