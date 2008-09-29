/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.context.FacesContext;
import ksno.model.Article;
import ksno.model.Image;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.service.PersonService;
import ksno.util.JSFVariableResolver;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;


/**
 *
 * @author halsnehauge
 */
public class AdminArticle {

    ArticleService articleService;
    PersonService personService;
    ImageService imageService;
    private HtmlInputText name;
    private HtmlInputText avatarUrl;    
    private HtmlInputTextarea intro;    
    private HtmlInputTextarea body;
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
    private Long articleId;
    private boolean renderAddArticleImagesContinue;
    private UIData data;

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public boolean isRenderAddArticleImagesContinue() {
        return renderAddArticleImagesContinue;
    }

    public void setRenderAddArticleImagesContinue(boolean renderAddArticleImagesContinue) {
        this.renderAddArticleImagesContinue = renderAddArticleImagesContinue;
    }


    
    public List getArticles(){
        return articleService.getArticles();
    }

    public HtmlInputText getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(HtmlInputText avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

  
    public HtmlInputTextarea getIntro() {
        return intro;
    }

    public void setIntro(HtmlInputTextarea intro) {
        this.intro = intro;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public HtmlInputTextarea getBody() {
        return body;
    }

    public void setBody(HtmlInputTextarea body) {
        this.body = body;
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

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    public Article getArticle() {
        if(articleId != -1){
            return articleService.getArticle(articleId);
        }else{
            return null;
        }
    }    

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }
    
    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }
    
    public String createArticle() throws Exception{
        Article article = new Article();
        article.setName(name.getValue().toString());
        article.setIntro(intro.getValue().toString());
        String userName = JSFVariableResolver.getRequest().getUserPrincipal().getName();
        Person currentUser = personService.getPerson(userName);
        article.setAuthor(currentUser);
        articleId = articleService.newArticle(article);
        setRenderAddArticleImagesContinue(false);
        if(articleId != null){
            return "go";
        }else{
            return "nogo";
        }
    }   
    

    public String uploadImages() throws IOException {
        boolean allImagesSucceded = true;
        if(upImg1 != null){
            if(!(uploadAndPersistImage(upImg1, upLoadImg1Result))&& allImagesSucceded) {
                allImagesSucceded = false;
            }
        }
        if(upImg2 != null){
            if(!(uploadAndPersistImage(upImg2, upLoadImg2Result))&& allImagesSucceded) {
                allImagesSucceded = false;
            }
        }
        if(upImg3 != null){
            if(!(uploadAndPersistImage(upImg3, upLoadImg3Result)) && allImagesSucceded) {
                allImagesSucceded = false;
            }
        }
        if(upImg4 != null){
            if(!(uploadAndPersistImage(upImg4, upLoadImg4Result))&& allImagesSucceded) {
                allImagesSucceded = false;
            }
        }
        if(upImg5 != null){
            if(!(uploadAndPersistImage(upImg5, upLoadImg5Result))&& allImagesSucceded) {
                allImagesSucceded = false;
            }

        }
        if(upImg6 != null){
            if(!(uploadAndPersistImage(upImg6, upLoadImg6Result))&& allImagesSucceded) {
                allImagesSucceded = false;
            }

        }
        
        if(allImagesSucceded){
            return "go";
        }else{
            setRenderAddArticleImagesContinue(true);                    
            return "stay";
        }
        
    } 
    
    private boolean uploadAndPersistImage(UploadedFile upImg1, HtmlOutputText upLoadImgResult) {
        boolean success = true;
        String imgName = uploadImage(upImg1, upLoadImgResult);
        if(imgName != null){
            String fileName = imgName;
            try {
                fileName = JSFVariableResolver.getStringValue(FacesContext.getCurrentInstance(), "#{prop.image_context_path}") + imgName;
            } catch (Exception ex) {
                Logger.getLogger(AdminArticle.class.getName()).log(Level.SEVERE, null, ex);
            }
            upLoadImgResult.setValue("File uploaded succesfull, fila awailable at: " + fileName);
            success = persistImage(imgName, upLoadImgResult);
        }else{
            success = false;
        }
        return success;
    }   
    
    private String uploadImage(UploadedFile file, HtmlOutputText result){
        String strReturn = null;
        try{
            InputStream stream = file.getInputStream();
            String fromFullFileName = file.getName();
            if(file.getContentType().indexOf("jpeg") == -1){
                throw new Exception("Uppload failed, only jpeg images are allowed, this file attempted uploaded was of type " + upImg1.getContentType());
            }
            String toPath = JSFVariableResolver.getStringValue(FacesContext.getCurrentInstance(),"#{prop.image_repo}");
            String fileName = fromFullFileName.substring(fromFullFileName.lastIndexOf("\\")+1);
            String uniqueFileName = getUniqueFileName(toPath, fileName, "");  
            String toFullFileName = toPath + uniqueFileName;
            long size = file.getSize();
            byte[] buffer = new byte[(int) size];
            stream.read(buffer, 0, (int) size);
            stream.close();
            FileOutputStream fos = new FileOutputStream(toFullFileName);
            fos.write(buffer);
            fos.close();        
            strReturn = uniqueFileName;
        }catch (Exception ioe) {
            if(result != null){
                result.setValue("File uploaded failed. " + ioe.getMessage());
            }
        }
        return strReturn;
    }
    
    private String getUniqueFileName(String toPath, String fileName, String ext) {
        String[] nameAndType = fileName.split("\\.");
        String uniqueFileName = nameAndType[0] + ext + "." + nameAndType[1];
        File file = new File(toPath + uniqueFileName);
        if(file.exists()){
            int i = (int) (Math.random() * 10000);
            return getUniqueFileName(toPath, uniqueFileName, Integer.toHexString(i));
        }else{
            return uniqueFileName;
        }
    }    

    private boolean persistImage(String imgName, HtmlOutputText result) {
        boolean success = true;
        try{
            Image image = new Image();
            Person currentUser = personService.getPerson("Tor-Erik");
            image.setOwner(currentUser);
            image.setName(JSFVariableResolver.getStringValue(FacesContext.getCurrentInstance(), "#{prop.image_context_path}") + imgName);
            image.setArticle(getArticle());
            Long l = imageService.newImage(image);
        }catch(Exception e){
            success = false;
            result.setValue("Unable to store image metdata in database. The image is stored on server but you will not be able to access it. Please contact administrator. " + e.getMessage());
        }
        return success;
    }    
    
    public String saveArticle(){
        String returnString = "go";
        try{
            articleService.updateArticle(getArticle());
        }catch (Exception ex){
            returnString = "nogo";
        }
        return returnString;
    }
    
    public String addArticleBody(){
        String returnString = "go";
        Article article = getArticle();
        String bdy = body.getValue().toString();
        article.setBody(bdy.replaceAll("\"", "'"));
        article.setAvatarUrl(avatarUrl.getValue().toString());
        if(article.getAvatarUrl() == null || "".equals(article.getAvatarUrl())){
            article.setAvatarUrl("/resources/img/logos/ksno.gif");
        }
        setRenderAddArticleImagesContinue(false);
        try{
            articleService.updateArticle(article);
        }catch (Exception ex){
            Logger.getLogger(AdminArticle.class.getName()).log(Level.SEVERE,"Unable to store article", ex);
            returnString = "nogo";
        }
        return returnString;
    } 
    
    public String clearAndGotoImages(){
        getUpLoadImg1Result().setValue(null);
        getUpLoadImg2Result().setValue(null);
        getUpLoadImg3Result().setValue(null);
        getUpLoadImg4Result().setValue(null);
        getUpLoadImg5Result().setValue(null);
        getUpLoadImg6Result().setValue(null);        
        return "go";
    }
    
    public String selectEditArticle(){
        Article selectedArticle = (Article) this.getData().getRowData();
        JSFVariableResolver.getSessionMap().put("editArticle", selectedArticle);
        return "go";
    }
}
