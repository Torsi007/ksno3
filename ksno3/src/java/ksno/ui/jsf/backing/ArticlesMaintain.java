/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.component.html.HtmlOutputText;
import ksno.model.Article;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import javax.faces.model.SelectItem;
import ksno.model.Category;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;

/**
 *
 * @author halsnehauge
 */
public class ArticlesMaintain {
    private ArticleService articleService;
    private ImageService imageService;
    private HtmlOutputText errorMsg;
    private HtmlInputText name;
    private HtmlSelectOneMenu slctCategory;


    private UIData data;   
    
    
    public List getArticles(){
        List l = null;
        try{
            l = articleService.getArticles();
        }catch(Exception e){
            int i = 0;
        }
        return l;
    }  
    
    // <editor-fold defaultstate="collapsed" desc=" getters and setters">



    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    private Logger getLogService(){
      return Logger.getLogger(ArticlesMaintain.class.getName());
    }

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }


    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }    
    // </editor-fold>

    public String selectEditArticle(){
        String returnVal = "articleMasterUpdate";
        try{
            Article articleModify = (Article)this.getData().getRowData();
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanArticleModify, articleModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to select article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
       return returnVal;
    }
    
   public String articleDelete(){
       String returnVal = "sucess";
        try{
           Article article = (Article)this.getData().getRowData();
           articleService.deleteArticle(article);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }
    
    public String articlesUpdate(){ 
        
       String returnVal = "sucess";
        try{
            List articles = (List)getData().getValue();
            for(int i = 0; i< articles.size(); i++){
                Article article = (Article)articles.get(i);
                articleService.updateArticle(article); 
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update articles", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       
       return returnVal;        
    }
   
}
