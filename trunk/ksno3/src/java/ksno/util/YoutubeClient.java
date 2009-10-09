/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.util;

import com.google.gdata.client.youtube.*;
//import com.google.gdata.data.media.*;
//import com.google.gdata.data.media.mediarss.*;
import com.google.gdata.data.youtube.*;
import com.google.gdata.util.AuthenticationException;
import com.google.gdata.util.ServiceException;
import java.io.IOException;
import com.google.gdata.util.common.xml.*;
import com.google.gdata.data.extensions.Email;
import com.google.gdata.data.media.mediarss.MediaCategory;
import com.google.gdata.data.media.mediarss.MediaDescription;
import com.google.gdata.data.media.mediarss.MediaKeywords;
import com.google.gdata.data.media.mediarss.MediaTitle;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import ksno.model.Video;
import ksno.service.VideoService;
import ksno.util.JSFUtil;


import javax.faces.context.ExternalContext;
import ksno.model.Video;

public class YoutubeClient {

    /**
     * Constructs a new un-authenticated client.
     */
    public YoutubeClient() {
        ExternalContext context = JSFUtil.getServletContext();
        String applicationName = context.getInitParameter("applicationName");
        String userName = context.getInitParameter("youtube.userName");
        String passWord = context.getInitParameter("youtube.passWord");
        String developerKey = context.getInitParameter("youtube.devKey");
        this.baseUrl = context.getInitParameter("youtube.baseUrl");
        try{
            service = new YouTubeService(applicationName,"AI39si6PqsiS70ppVM_YcZhe3seipUzurCEQ9qCaR3Bzu7fHyCEiCyTlJfa-YtgLJkYkr8pzifUv4Vjg0Ncbb4w4agl4bM8WKw");
            service.setUserCredentials(userName, passWord);
        } catch (AuthenticationException e) {
            throw new IllegalArgumentException("Illegal username/password combination. " + e.getMessage());
        } catch (Exception e) {
            String msg = e.getMessage();
        }

    }

    public String getCurrentState(Video video) {
        String state = YoutubeClient.statePublished;
        getLogService().info("starting getCurrentState()");
        try{
            getLogService().info("attempting to open videoentry for video with id " + video.getYouTubeId());
            VideoEntry entry = service.getEntry(new URL(video.getYouTubeId()), VideoEntry.class);
            if(entry.isDraft()){
                getLogService().info("The video is a draft in state  " + entry.getPublicationState().getState().toString());
                state = entry.getPublicationState().getState().toString();
            }else{
                getLogService().info("The video is already published, who called me?");
            }
        }catch(Exception ex){
            getLogService().warning("Something failed, unable to get state, fallcack to " + YoutubeClient.stateProcessing + ex.getMessage());
            state = YoutubeClient.stateProcessing;
        }
        return state;
    }

    private final String baseUrl;
    private YouTubeService service = null;
    public static final String statePublished = "PUBLISHED";
    public static final String stateProcessing = "PROCESSING";
    public static final String stateRejected = "REJECTED";
    public static final String stateFailed = "FAILED";


    private Logger getLogService() {
        return Logger.getLogger(YoutubeClient.class.getName());
    }


    public YouTubeUploadUrlAndToken uploadVideo(Video video){
        VideoEntry newEntry = new VideoEntry();

        YouTubeMediaGroup mg = newEntry.getOrCreateMediaGroup();
        mg.setTitle(new MediaTitle());
        mg.getTitle().setPlainTextContent(video.getName());
        mg.addCategory(new MediaCategory(YouTubeNamespace.CATEGORY_SCHEME, "Sports"));
        //mg.addCategory(new MediaCategory(YouTubeNamespace.CATEGORY_SCHEME, "Travel"));
        mg.setKeywords(new MediaKeywords());
        mg.getKeywords().addKeyword("kitesurfing");
        mg.getKeywords().addKeyword("norway");
        mg.getKeywords().addKeyword("kite");
        mg.getKeywords().addKeyword("kiteboarding");
        mg.getKeywords().addKeyword("drageurfing");
        mg.getKeywords().addKeyword("norge");
        mg.getKeywords().addKeyword("drage");
        mg.getKeywords().addKeyword("www.kitesurfing.no");
        mg.setDescription(new MediaDescription());
        mg.getDescription().setPlainTextContent(video.getDescription());
        mg.setPrivate(false);
        mg.addCategory(new MediaCategory(YouTubeNamespace.DEVELOPER_TAG_SCHEME, "kitesurfingno"));
        mg.addCategory(new MediaCategory(YouTubeNamespace.DEVELOPER_TAG_SCHEME, "web"));

        //newEntry.setGeoCoordinates(new GeoRssWhere(37.0, -122.0));


        URL uploadUrl = null;
        try {
            uploadUrl = new URL("http://gdata.youtube.com/action/GetUploadToken");
        } catch (MalformedURLException ex) {
            Logger.getLogger(YoutubeClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        FormUploadToken token = null;
        try {
            token = service.getFormUploadToken(uploadUrl, newEntry);
        } catch (ServiceException ex) {
            Logger.getLogger(YoutubeClient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(YoutubeClient.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new YouTubeUploadUrlAndToken(token.getUrl(), token.getToken());

    }

    /**
     * Retrieves the videos for the given user.
     */
    public List<VideoEntry> getVideos() throws IOException, ServiceException {
        VideoFeed videoFeed = getFeed(this.baseUrl, VideoFeed.class);
        List<VideoEntry> entries = videoFeed.getEntries();
        return entries;
    }
    
    public VideoEntry getVideoEntry(String id) throws IOException, ServiceException{
        String videoEntryUrl = "http://gdata.youtube.com/feeds/api/videos/" + id;
        getLogService().info("attempting to open videoentry on " + videoEntryUrl);
        return service.getEntry(new URL(videoEntryUrl), VideoEntry.class);
    
    }

    public VideoEntry getVideoEntryInProgress(String id) throws ServiceException, IOException{
        String videoEntryUrl = "http://gdata.youtube.com/feeds/api/users/default/uploads/" + id;
                getLogService().info("attempting to open videoentry on " + videoEntryUrl);
        return service.getEntry(new URL(videoEntryUrl), VideoEntry.class);
    }

    public Video getVideoInProgress(String id) throws ServiceException, IOException{
        String videoEntryUrl = "http://gdata.youtube.com/feeds/api/users/default/uploads/" + id;
        VideoEntry entry = service.getEntry(new URL(videoEntryUrl), VideoEntry.class);
        Video video = new Video();
        video.setName(entry.getMediaGroup().getTitle().getPlainTextContent());
        video.setDescription(entry.getMediaGroup().getDescription().getPlainTextContent());
        video.setDuration(Util.prettyPrintTime(entry.getMediaGroup().getDuration()));
        //video.setUrl(entry.getHtmlLink().getHref());
        video.setUrl(entry.getMediaGroup().getContents().get(0).getUrl());
        //);

        video.setYouTubeId(entry.getId());
        if(entry.isDraft()){
            video.setState(entry.getPublicationState().getState().toString());
        }
        video.setThumbnail(entry.getMediaGroup().getThumbnails().get(1).getUrl());
        return video;
    }




    /**
     * Helper function to allow retrieval of a feed by string url, which will
     * create the URL object for you.  Most of the Link objects have a string
     * href which must be converted into a URL by hand, this does the conversion.
     */
    public <T extends VideoFeed> T getFeed(String feedHref, Class<T> feedClass) throws IOException, ServiceException {
        getLogService().info("Get Feed URL: " + feedHref);
        return service.getFeed(new URL(feedHref), feedClass);
    }

    public Long getDuration(Video video) {
        VideoEntry entry;
        Long toBeReturned = null;
        try {
            entry = service.getEntry(new URL(video.getYouTubeId()), VideoEntry.class);
            toBeReturned = entry.getMediaGroup().getDuration();
        } catch (IOException ex) {
            Logger.getLogger(YoutubeClient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ServiceException ex) {
            Logger.getLogger(YoutubeClient.class.getName()).log(Level.SEVERE, null, ex);
        }
        return toBeReturned;
    }
}
