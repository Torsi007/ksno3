/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.ui.jsf.backing;

import com.google.gdata.data.youtube.VideoEntry;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.ws.Response;
import ksno.model.Person;
import ksno.model.Video;
import ksno.service.PersonService;
import ksno.service.VideoService;
import ksno.util.JSFUtil;
import ksno.util.YouTubeUploadUrlAndToken;
import ksno.util.YoutubeClient;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import com.google.gdata.util.common.xml.*;
import com.google.gdata.data.extensions.Email;
import com.google.gdata.data.media.mediarss.MediaThumbnail;
import java.util.List;
import javax.faces.model.SelectItem;
import ksno.model.Category;
import ksno.service.ArticleCategoryService;
import org.apache.myfaces.component.html.ext.HtmlInputHidden;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;

/**
 *
 * @author tor.hauge
 */
public class VideoCreate {

    private HtmlInputText name;
    private HtmlInputText url;
    private HtmlInputTextarea description;
    private HtmlOutputText errorMsg;
    private VideoService videoService;
    private PersonService personService;
    private HtmlInputHidden youTubeUploadURL;
    private HtmlInputHidden youTubeUploadToken;
    private Video video;
    String id;
    String status;
    String code;
    private HtmlSelectOneMenu slctCategory;
    private ArticleCategoryService categoryService;

    public ArticleCategoryService getCategoryService() {
        return categoryService;
    }

    public void setCategoryService(ArticleCategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public HtmlSelectOneMenu getSlctCategory() {
        return slctCategory;
    }

    public SelectItem[] getCategorySelectItems() {
        List<Category> Categories = categoryService.getArticleCategorys();
        return JSFUtil.toSelectItemArray(Categories);
    }

    public void setSlctCategory(HtmlSelectOneMenu slctCategory) {
        this.slctCategory = slctCategory;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public HtmlInputTextarea getDescription() {
        return description;
    }

    public void setDescription(HtmlInputTextarea description) {
        this.description = description;
    }

    public HtmlInputHidden getYouTubeUploadToken() {
        return youTubeUploadToken;
    }

    public void setYouTubeUploadToken(HtmlInputHidden youTubeUploadToken) {
        this.youTubeUploadToken = youTubeUploadToken;
    }

    public HtmlInputHidden getYouTubeUploadURL() {
        return youTubeUploadURL;
    }

    public void setYouTubeUploadURL(HtmlInputHidden youTybeUploadURL) {
        this.youTubeUploadURL = youTybeUploadURL;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
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

    public HtmlInputText getUrl() {
        return url;
    }

    public void setUrl(HtmlInputText url) {
        this.url = url;
    }

    public VideoService getVideoService() {
        return videoService;
    }

    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }
    // </editor-fold>

    public String createVideoMeta() {
        String returnVal = "success";
        try {
            setVideo(new Video());
            getVideo().setName(JSFUtil.getText(name));
            getVideo().setDescription(JSFUtil.getText(description));
            long categoryId = Long.parseLong(slctCategory.getValue().toString());
            Category category = categoryService.getArticleCategory(categoryId);
            getVideo().setCategory(category);

            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            getVideo().setOwner(currentUser);
            YoutubeClient youtubeClient = new YoutubeClient();
            YouTubeUploadUrlAndToken result = youtubeClient.uploadVideo(getVideo());
            this.getYouTubeUploadURL().setValue(result.getUrl());
            this.getYouTubeUploadToken().setValue(result.getToken());
            //videoService.newVideo(video);

        } catch (Exception e) {
            this.getYouTubeUploadURL().setValue("");
            this.getYouTubeUploadToken().setValue("");
            getLogService().log(Level.SEVERE, "Unable to create video", e);
            errorMsg.setValue("Videoen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String storeVideo(){
        String returnVal = "success";
        try{
            YoutubeClient youtubeClient = new YoutubeClient();
            Video video = youtubeClient.getVideoInProgress(this.getId());
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            video.setOwner(currentUser);
            long l = 1;
            Category category = categoryService.getArticleCategory(l);
            video.setCategory(category);
            videoService.newVideo(video);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create video", e);
            errorMsg.setValue("Videoen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }
}
