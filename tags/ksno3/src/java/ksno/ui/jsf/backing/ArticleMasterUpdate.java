/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.model.SelectItem;
import ksno.model.Article;
import ksno.model.Category;
import ksno.model.Image;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.util.ImageMeta;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;
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
    private HtmlSelectOneMenu slctCategory;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlSelectOneMenu getSlctCategory() {
        return slctCategory;
    }

    public void setSlctCategory(HtmlSelectOneMenu slctCategory) {
        this.slctCategory = slctCategory;
    }

    public SelectItem[] getCategorySelectItems() {
        List<Category> Categories = articleService.getCategories();
        return JSFUtil.toSelectItemArray(Categories);
    }

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
      return Logger.getLogger(ArticleMasterUpdate.class.getName());
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
    // </editor-fold>
    
    public String updateArticle(){
        String returnVal = "articleUpd";
        try{
            Article article = (Article)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanArticleModify);
            getLogService().log(Level.INFO,"The article to update is: " +  article.getName());
            
            if(upAvatar != null){
                HashMap<ImageMeta,String> imageSize = imageService.uploadImage(upAvatar.getInputStream(), article.getAuthor().getUserName());
                Image image = new Image();
                image.setOwner(article.getAuthor());
                image.setName(imageSize.get(ImageMeta.sizeMAX));
                image.setUrl(imageSize.get(ImageMeta.url));
                article.setAvatarUrl(imageSize.get(ImageMeta.sizeMIN));
                article.addImage(image);
            }
            Category cat = articleService.getCategory(Long.parseLong(slctCategory.getValue().toString()));
            article.setCategory(cat);
            getLogService().log(Level.INFO,"Setting category: " +  cat);
            articleService.updateArticle(article);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            returnVal = "no";
        }
        return returnVal;
    }   
    
    public String updateIntro(){
        getLogService().log(Level.INFO,"About to update intro on article");
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
