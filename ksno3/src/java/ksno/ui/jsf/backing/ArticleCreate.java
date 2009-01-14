/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Article;
import ksno.model.Image;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.service.PersonService;
import ksno.util.ImageMeta;
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
    private HtmlOutputText errorMsg;   
    private UploadedFile upAvatar;
    ArticleService articleService;
    PersonService personService;
    ImageService imageService;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    
      
  private Logger getLogService(){
      return Logger.getLogger(ArticleCreate.class.getName());
  }

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }
    

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

    // </editor-fold>
    
    
    public String createArticle(){
        String returnVal = "success";
        try{
            Article article = new Article();
            article.setName(name.getValue().toString());
            article.setIntro(intro.getValue().toString());
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            article.setAuthor(currentUser);

            HashMap<ImageMeta,String> imageSize = imageService.uploadImage(upAvatar.getInputStream(), userName);
            Image image = new Image();
            image.setOwner(currentUser);
            image.setName(imageSize.get(ImageMeta.sizeMAX));
            image.setUrl(imageSize.get(ImageMeta.url));

            article.setAvatarUrl(imageSize.get(ImageMeta.sizeMIN));
            
            article.addImage(image);
            
            articleService.newArticle(article);
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanArticleModify, article);
            
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
        return returnVal;
    }   
    
    public String createIntro(){
        String returnVal = "success";
        try{
            returnVal = this.createArticle();
            if(!"no".equals(returnVal)){
                JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanArticleModify);
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }   

    
    
        
    
    

}
