/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.ws.Response;
import ksno.model.Person;
import ksno.model.Video;
import ksno.service.PersonService;
import ksno.service.VideoService;
import ksno.util.JSFUtil;
import ksno.util.YoutubeClient;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class VideoCreate {
    
    private HtmlInputText name;
    private HtmlInputText url;
    private HtmlOutputText errorMsg;
    private VideoService videoService;
    private PersonService personService;


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
    
    private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
    }    
    
    public String createVideo(){
        String returnVal = "success";
        try{
            Video video = new Video();
            video.setName(name.getValue().toString());
            video.setUrl(url.getValue().toString());
            
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            
            video.setOwner(currentUser);
            
            videoService.newVideo(video);
            YoutubeClient youtubeClient = new YoutubeClient();
            String result = youtubeClient.uploadVideo();
            int i = 0;

        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create video", e);
            errorMsg.setValue("Videoen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }     

}
