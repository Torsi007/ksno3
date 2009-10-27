/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;
import com.google.gdata.client.youtube.*;
//import com.google.gdata.data.media.*;
//import com.google.gdata.data.media.mediarss.*;
import com.google.gdata.data.youtube.*;
import com.google.gdata.util.AuthenticationException;
import com.google.gdata.util.ServiceException;
import java.io.IOException;
import com.google.gdata.util.common.xml.*;
import com.google.gdata.data.extensions.Email;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.model.SelectItem;
import ksno.model.Category;
import ksno.model.Video;
import ksno.service.ArticleCategoryService;
import ksno.service.ArticleService;
import ksno.service.VideoService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;

/**
 *
 * @author tor.hauge
 */
public class VideosMaintain {
    private VideoService videoService;
    private HtmlOutputText errorMsg;
    private UIData data;
    ArticleCategoryService categoryService;
    private HtmlSelectOneMenu slctCategory;


    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public SelectItem[] getCategorySelectItems() {
        List<Category> Categories = categoryService.getArticleCategorys();
        return JSFUtil.toObjectSelectItemArray(Categories);
    }


    public ArticleCategoryService getCategoryService() {
        return categoryService;
    }

    public void setCategoryService(ArticleCategoryService categoryService) {
        this.categoryService = categoryService;
    }


    public HtmlSelectOneMenu getSlctCategory() {
        return slctCategory;
    }

    public void setSlctCategory(HtmlSelectOneMenu slctCategory) {
        this.slctCategory = slctCategory;
    }

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
    
    public List getVideos() throws AuthenticationException, ServiceException, IOException{
        /*YouTubeService svc = new YouTubeService("kitesurfingHauge-kitesurfingNo-1","AI39si6PqsiS70ppVM_YcZhe3seipUzurCEQ9qCaR3Bzu7fHyCEiCyTlJfa-YtgLJkYkr8pzifUv4Vjg0Ncbb4w4agl4bM8WKw");
        svc.setUserCredentials("kitesurfing.no@gmail.com", "Sw1tchBlade");
        String videoEntryUrl = "http://gdata.youtube.com/feeds/api/videos/xx81BAyxAMI";
        VideoEntry entry = svc.getEntry(new URL(videoEntryUrl), VideoEntry.class);*/


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

   public String videosUpdate(){
       String returnVal = "sucess";
        try{
            List videos = (List)getData().getValue();
            for(int i = 0; i< videos.size(); i++){
                Video video = (Video)videos.get(i);
                videoService.updateVideo(video);
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update videos", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
       return returnVal;
    }

   

    

}
