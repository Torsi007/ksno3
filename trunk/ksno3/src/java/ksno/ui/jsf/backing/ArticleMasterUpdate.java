/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Article;
import ksno.model.Image;
import ksno.service.ArticleService;
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
    ArticleService articleService;

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
                String imgName = JSFUtil.uploadImage(upAvatar,upAvatarResult);
                Image image = new Image();
                image.setOwner(article.getAuthor());
                image.setName(imgName);
                article.setAvatarUrl(imgName);
                article.addImage(image);
            }
            articleService.updateArticle(article);
        }catch(Exception e){
            Logger.getLogger(ArticleCreate.class.getName()).log(Level.SEVERE,"Unable to create article", e);
            returnVal = "no";
        }
        return returnVal;
    }   
    


}
