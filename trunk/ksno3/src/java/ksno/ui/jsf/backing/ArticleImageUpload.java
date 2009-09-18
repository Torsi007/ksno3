/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.io.IOException;
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
import org.apache.myfaces.component.html.ext.HtmlInputHidden;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class ArticleImageUpload {
    private ArticleService articleService;
    private PersonService personService;    
    private HtmlOutputText uploadFailedText;
    private HtmlOutputText upLoadImgResult;
    private UploadedFile upImg;    
    private HtmlInputHidden renderHidden;

    public HtmlInputHidden getRenderHidden() {
        return renderHidden;
    }

    public void setRenderHidden(HtmlInputHidden renderHidden) {
        this.renderHidden = renderHidden;
    }
      
    ImageService imageService;

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }    

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public HtmlOutputText getUploadFailedText() {
        return uploadFailedText;
    }

    public void setUploadFailedText(HtmlOutputText uploadFailedText) {
        this.uploadFailedText = uploadFailedText;
    }


    public UploadedFile getUpImg() {
        return upImg;
    }

    public void setUpImg(UploadedFile upImg) {
        this.upImg = upImg;
    }

    public HtmlOutputText getUpLoadImgResult() {
        return upLoadImgResult;
    }

    public void setUpLoadImgResult(HtmlOutputText upLoadImgResult) {
        this.upLoadImgResult = upLoadImgResult;
    }



}
