/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.io.IOException;
import ksno.model.Article;
import ksno.model.Image;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class ArticleImagesUpdate {
    private ArticleService articleService;
    private PersonService personService;    
    private HtmlOutputText uploadFailedText;
    private HtmlOutputText upLoadImg1Result;    
    private HtmlOutputText upLoadImg2Result;    
    private HtmlOutputText upLoadImg3Result;    
    private HtmlOutputText upLoadImg4Result;    
    private HtmlOutputText upLoadImg5Result;
    private HtmlOutputText upLoadImg6Result;
    private UploadedFile upImg1;    
    private UploadedFile upImg2;    
    private UploadedFile upImg3;    
    private UploadedFile upImg4;    
    private UploadedFile upImg5;    
    private UploadedFile upImg6;        
    private boolean renderContinuePanel;

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

    public boolean isRenderContinuePanel() {
        return renderContinuePanel;
    }

    public void setRenderContinuePanel(boolean renderContinuePanel) {
        this.renderContinuePanel = renderContinuePanel;
    }

    public HtmlOutputText getUploadFailedText() {
        return uploadFailedText;
    }

    public void setUploadFailedText(HtmlOutputText uploadFailedText) {
        this.uploadFailedText = uploadFailedText;
    }


    public UploadedFile getUpImg1() {
        return upImg1;
    }

    public void setUpImg1(UploadedFile upImg1) {
        this.upImg1 = upImg1;
    }

    public UploadedFile getUpImg2() {
        return upImg2;
    }

    public void setUpImg2(UploadedFile upImg2) {
        this.upImg2 = upImg2;
    }

    public UploadedFile getUpImg3() {
        return upImg3;
    }

    public void setUpImg3(UploadedFile upImg3) {
        this.upImg3 = upImg3;
    }

    public UploadedFile getUpImg4() {
        return upImg4;
    }

    public void setUpImg4(UploadedFile upImg4) {
        this.upImg4 = upImg4;
    }

    public UploadedFile getUpImg5() {
        return upImg5;
    }

    public void setUpImg5(UploadedFile upImg5) {
        this.upImg5 = upImg5;
    }

    public UploadedFile getUpImg6() {
        return upImg6;
    }

    public void setUpImg6(UploadedFile upImg6) {
        this.upImg6 = upImg6;
    }

    public HtmlOutputText getUpLoadImg1Result() {
        return upLoadImg1Result;
    }

    public void setUpLoadImg1Result(HtmlOutputText upLoadImg1Result) {
        this.upLoadImg1Result = upLoadImg1Result;
    }

    public HtmlOutputText getUpLoadImg2Result() {
        return upLoadImg2Result;
    }

    public void setUpLoadImg2Result(HtmlOutputText upLoadImg2Result) {
        this.upLoadImg2Result = upLoadImg2Result;
    }

    public HtmlOutputText getUpLoadImg3Result() {
        return upLoadImg3Result;
    }

    public void setUpLoadImg3Result(HtmlOutputText upLoadImg3Result) {
        this.upLoadImg3Result = upLoadImg3Result;
    }

    public HtmlOutputText getUpLoadImg4Result() {
        return upLoadImg4Result;
    }

    public void setUpLoadImg4Result(HtmlOutputText upLoadImg4Result) {
        this.upLoadImg4Result = upLoadImg4Result;
    }

    public HtmlOutputText getUpLoadImg5Result() {
        return upLoadImg5Result;
    }

    public void setUpLoadImg5Result(HtmlOutputText upLoadImg5Result) {
        this.upLoadImg5Result = upLoadImg5Result;
    }

    public HtmlOutputText getUpLoadImg6Result() {
        return upLoadImg6Result;
    }

    public void setUpLoadImg6Result(HtmlOutputText upLoadImg6Result) {
        this.upLoadImg6Result = upLoadImg6Result;
    }
    
    public String uploadImages() throws IOException {
        int numberOfFailedUploads = 0;
        Article article = (Article)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanArticleModify);
        numberOfFailedUploads += uploadCreateAndAddImgToArticle(article,upImg1, upLoadImg1Result);
        numberOfFailedUploads += uploadCreateAndAddImgToArticle(article,upImg2, upLoadImg2Result);
        numberOfFailedUploads += uploadCreateAndAddImgToArticle(article,upImg3, upLoadImg3Result);
        numberOfFailedUploads += uploadCreateAndAddImgToArticle(article,upImg4, upLoadImg4Result);        
        numberOfFailedUploads += uploadCreateAndAddImgToArticle(article,upImg5, upLoadImg5Result);
        numberOfFailedUploads += uploadCreateAndAddImgToArticle(article,upImg6, upLoadImg6Result);        
        if(numberOfFailedUploads == 0){
            articleService.updateArticle(article);
            return "articleUpdate";
        }else{
            setRenderContinuePanel(true);
            uploadFailedText.setValue(Integer.toString(numberOfFailedUploads) + " failed to load (se meldinger over), Trykk 'Gå videre' om du vil ignorere dette, eller forsøk en gang til.");
            return "stay";
        }
        
    } 
    
    private int uploadCreateAndAddImgToArticle(Article article, UploadedFile upImg, HtmlOutputText upLoadImgResult) {
        int returnVal = 0;
        if(upImg != null){
            Image img = uploadAndCreateImage(upImg, upLoadImgResult);
            if(img == null) {
                returnVal = 1;
            }else{
                article.addImage(img);                                    
            }
        }
        return returnVal;
    }    
    
    private Image uploadAndCreateImage(UploadedFile upImg, HtmlOutputText upLoadImgResult) {
        Image image = new Image();        
        String imgName = JSFUtil.uploadImage(upImg, upLoadImgResult);
        if(imgName != null){
            Person currentUser = personService.getPerson(JSFUtil.getRequest().getUserPrincipal().getName());
            image.setOwner(currentUser);
            image.setName(imgName);        
            return image;
        }else{
            return null;
        }
    }
    
    public String saveArticle(){
        String returnString = "articlesMaintain";
        try{
            Article article = (Article)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanArticleModify);
            articleService.updateArticle(article);
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanArticleModify);
        }catch (Exception ex){
            returnString = "stay";
        }
        return returnString;
    }
  

}
