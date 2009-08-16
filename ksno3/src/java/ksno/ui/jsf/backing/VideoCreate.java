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
import org.apache.myfaces.component.html.ext.HtmlInputHidden;

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
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            getVideo().setOwner(currentUser);
            YoutubeClient youtubeClient = new YoutubeClient();
            YouTubeUploadUrlAndToken result = youtubeClient.uploadVideo(getVideo());
            this.getYouTubeUploadURL().setValue(result.getUrl());
            this.getYouTubeUploadToken().setValue(result.getToken());
            videoService.newVideo(video);

        } catch (Exception e) {
            this.getYouTubeUploadURL().setValue("");
            this.getYouTubeUploadToken().setValue("");
            getLogService().log(Level.SEVERE, "Unable to create video", e);
            errorMsg.setValue("Videoen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String uploadVideo(){
        String returnVal = "success";
        try{
            YoutubeClient youtubeClient = new YoutubeClient();
            VideoEntry videoEntry = youtubeClient.getVideoEntryInProgress(this.getId());
            getVideo().setUrl(videoEntry.getHtmlLink().getHref());
            getVideo().setThumbnail(videoEntry.getMediaGroup().getThumbnails().get(0).getUrl());
            videoService.newVideo(this.getVideo());
            this.setVideo(null);
            /*
            for(MediaThumbnail mediaThumbnail : videoEntry.getMediaGroup().getThumbnails()) {
              System.out.println("\t\tThumbnail URL: " + mediaThumbnail.getUrl());
              System.out.println("\t\tThumbnail Time Index: " +
              mediaThumbnail.getTime());
              System.out.println();
            }*/
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create video", e);
            errorMsg.setValue("Videoen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }
}
