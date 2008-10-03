/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Article;
import ksno.model.Image;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class ArticleCreate {
    private HtmlInputText name;
    private HtmlInputTextarea intro; 
    private HtmlOutputText upAvatarResult;
    private UploadedFile upAvatar;
    ArticleService articleService;
    PersonService personService;

    public UploadedFile getUpAvatar() {
        return upAvatar;
    }

    public void setUpAvatar(UploadedFile upAvatar) {
        this.upAvatar = upAvatar;
    }

    public HtmlOutputText getUpAvatarResult() {
        return upAvatarResult;
    }

    public void setUpAvatarResult(HtmlOutputText upAvatarResult) {
        this.upAvatarResult = upAvatarResult;
    }    
    
    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public HtmlInputTextarea getIntro() {
        return intro;
    }

    public void setIntro(HtmlInputTextarea intro) {
        this.intro = intro;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }
    
    public String createArticle(){
        String returnVal = "articleImagesUpdate";
        try{
            Article article = new Article();
            article.setName(name.getValue().toString());
            article.setIntro(intro.getValue().toString());
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            article.setAuthor(currentUser);
            
            String imgName = JSFUtil.uploadImage(upAvatar,upAvatarResult);
            Image image = new Image();
            image.setOwner(currentUser);
            image.setName(imgName);

            article.setAvatarUrl(imgName);
            
            article.addImage(image);
            
            articleService.newArticle(article);
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanArticleModify, article);
            
        }catch(Exception e){
            Logger.getLogger(ArticleCreate.class.getName()).log(Level.SEVERE,"Unable to create article", e);
            returnVal = "no";
        }
        return returnVal;
    }   
    
    public String createIntro(){
        String returnVal = "articlesMaintain";
        try{
            this.createArticle();
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanArticleModify);
            
        }catch(Exception e){
            Logger.getLogger(ArticleCreate.class.getName()).log(Level.SEVERE,"Unable to create article", e);
            returnVal = "no";
        }
        return returnVal;
    }   

    
    
        
    
    

}
