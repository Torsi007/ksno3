/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import ksno.model.Video;
import ksno.service.VideoService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class VideosMaintain {
    private VideoService videoService;
    private HtmlOutputText errorMsg;
    private UIData data;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }     
    
    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public VideoService getVideoService() {
        return videoService;
    }

    public void setVideoService(VideoService VideoService) {
        this.videoService = VideoService;
    }
    // </editor-fold>
    
    public List getVideos(){
        List l = null;
        try{
            l = videoService.getVideos();
        }catch(Exception e){
            int i = 0;
        }
        return l;
    }  
    
    public String selectEditVideo(){
        String returnVal = "videoUpdate";
        try{
            Video videoModify = (Video)this.getData().getRowData();
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanVideoModify, videoModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to select video", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
       return returnVal;
    }
    
   public String videoDelete(){
       String returnVal = "sucess";
        try{
           Video video = (Video)this.getData().getRowData();
           videoService.deleteVideo(video);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete video", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }    
   

    

}
