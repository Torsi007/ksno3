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
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.util.ImageSize;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class ArticleMasterUpdate {
    private HtmlOutputText upAvatarResult;
    private UploadedFile upAvatar;
    private HtmlOutputText errorMsg;       
    ArticleService articleService;
    ImageService imageService;

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    public ImageService getImageService() {
        return imageService;
    }
    
    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }    
    
  private Logger getLogService(){
      return Logger.getLogger(ArticleCreate.class.getName());
  }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
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
    
    public String updateArticle(){
        String returnVal = "articleUpd";
        try{
            Article article = (Article)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanArticleModify);
            
            if(upAvatar != null){
                HashMap<ImageSize,String> imageSize = imageService.uploadImage(upAvatar.getInputStream(), article.getAuthor().getUserName());
                Image image = new Image();
                image.setOwner(article.getAuthor());
                image.setName(imageSize.get(ImageSize.MAX));
                article.setAvatarUrl(imageSize.get(ImageSize.MIN));
                article.addImage(image);
            }
            articleService.updateArticle(article);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            returnVal = "no";
        }
        return returnVal;
    }   
    
        public String updateIntro(){
        String returnVal = "success";
        try{
            returnVal = this.updateArticle();
            if(!"no".equals(returnVal)){
                JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanArticleModify);
                returnVal = "success";
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }   
    


}
