/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.io.IOException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.html.HtmlInputTextarea;
import javax.faces.component.html.HtmlOutputText;
import ksno.model.Article;
import ksno.model.Image;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.service.PersonService;
import ksno.util.ImageMeta;
import ksno.util.JSFUtil;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class ArticleUpdate {
    ArticleService articleService;
    private HtmlInputTextarea body;
    private HtmlOutputText errorMsg;
    private HtmlOutputText upLoadImgResult;
    private UploadedFile upImg;
    private ImageService imageService;
    private PersonService personService;

    public PersonService getPersonService() {
        return personService;
    }

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
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

    public String uploadImage() throws IOException {
        getLogService().log(Level.INFO,"Starting uploadImage");
        Article article = (Article)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanArticleModify);
        Image img = uploadAndCreateImage(upImg, upLoadImgResult);
        if(img != null){
            article.addImage(img);
            articleService.updateArticle(article);
            return "jkj";
        }else{
              //uploadFailedText.setValue("Bildet ble ikke lastet opp (se meldinger over), Trykk 'Gå videre' om du vil ignorere dette, eller forsøk en gang til.");
            return "stay";
        }
    }

    private Image uploadAndCreateImage(UploadedFile upImg, HtmlOutputText upLoadImgResult) {
        getLogService().log(Level.INFO,"Starting uploadAndCreateImage");
        Image image = new Image();
        String userName = JSFUtil.getRequest().getUserPrincipal().getName();
        HashMap<ImageMeta, String> imageSize = new HashMap<ImageMeta, String>();
        try {
            getLogService().log(Level.INFO,"Attempt to upload image fir user " + userName);
            imageSize = imageService.uploadImage(upImg.getInputStream(), userName);
        } catch (Exception ex) {
            getLogService().log(Level.WARNING,"Upload failed");
            upLoadImgResult.setValue("File uploaded failed. " + ex.getMessage());
            Logger.getLogger(ArticleImageUpload.class.getName()).log(Level.SEVERE, null, ex);
        }
        getLogService().log(Level.INFO,"Succeded");
        String imgName = imageSize.get(ImageMeta.sizeMAX);
        if(imgName != null){
            Person currentUser = personService.getPerson(JSFUtil.getRequest().getUserPrincipal().getName());
            image.setOwner(currentUser);
            image.setName(imgName);
            image.setUrl(imageSize.get(ImageMeta.url));
            return image;
        }else{
            return null;
        }
    }
}
