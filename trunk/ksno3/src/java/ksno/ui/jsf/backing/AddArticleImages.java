/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.context.FacesContext;
import ksno.model.Person;
import ksno.model.Image;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.service.PersonService;
import ksno.util.JSFVariableResolver;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class AddArticleImages {
    ImageService imageService;  
    ArticleService articleService;
    PersonService personService;
    private HtmlOutputText upLoadResult;
    private UploadedFile upFile;

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

    public UploadedFile getUpFile() {
        return upFile;
    }

    public void setUpFile(UploadedFile upFile) {
        this.upFile = upFile;
    }


    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    public HtmlOutputText getUpLoadResult() {
        return upLoadResult;
    }

    public void setUpLoadResult(HtmlOutputText upLoadResult) {
        this.upLoadResult = upLoadResult;
    }


    public String upload() throws IOException {
        try {
            InputStream stream = upFile.getInputStream();
            String fromFullFileName = upFile.getName();

            if(upFile.getContentType().indexOf("jpeg") == -1){
                throw new Exception("Uppload failed, only jpeg images are allowed, this file attempted uploaded was of type " + upFile.getContentType());
            }

            String fileName = fromFullFileName.substring(fromFullFileName.lastIndexOf("\\")+1);
            String toFullFileName = JSFVariableResolver.getStringValue(FacesContext.getCurrentInstance(),"#{prop.image_repo}") + fileName;            
            long size = upFile.getSize();
            byte[] buffer = new byte[(int) size];
            stream.read(buffer, 0, (int) size);
            stream.close();
            FileOutputStream fos = new FileOutputStream(toFullFileName);
            fos.write(buffer);
            fos.close();
            Image image = new Image();
            String articleId = JSFVariableResolver.getStringValue(FacesContext.getCurrentInstance(),"#{CreateArticle_Backing.article.id}");
            image.setArticle(articleService.getArticle(Integer.parseInt(articleId)));
            Person currentUser = personService.getPerson("Tor-Erik");
            image.setOwner(currentUser);
            image.setName("/images/uploaded/" + fileName);
            imageService.newImage(image);
            upLoadResult.setValue("File uploaded successfully from " + fromFullFileName + " to " + toFullFileName);
            return "ok";
        } catch (Exception ioe) {
            upLoadResult.setValue("File uploaded failed. " + ioe.getMessage());
            return "no";
        }
    }
}
