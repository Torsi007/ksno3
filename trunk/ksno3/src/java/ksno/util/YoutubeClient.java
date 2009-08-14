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

    private final String baseUrl;
    private YouTubeService service = null;

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

    private Logger getLogService() {
        return Logger.getLogger(YoutubeClient.class.getName());
    }

    /*public HashMap<VideoMeta, String> uploadVideo(InputStream stream, String userName) throws MalformedURLException, IOException, ServiceException, Exception {
        getLogService().log(Level.INFO, "start");
        String url = null;
        String id = "";
        HashMap<ImageMeta, String> returnImageMap = new HashMap<ImageMeta, String>();
        AlbumEntry entry = getAlbumByTitle(userName);

        if (entry == null) {
            entry = new AlbumEntry();
            entry.setName(userName);
            entry.setTitle(new PlainTextConstruct(userName));
            try {
                AlbumEntry temp = insertAlbum(entry);
                entry = temp;
            } catch (IOException ioex) {
                getLogService().log(Level.SEVERE, "An error occured on attempt to insert the album", ioex);
                throw ioex;
            } catch (ServiceException sex) {
                getLogService().log(Level.SEVERE, "An error occured on attempt to insert the album", sex);
                throw sex;
            }
        }

        PhotoEntry myPhoto = new PhotoEntry();
        //myPhoto.setTitle(new PlainTextConstruct("Puppies FTW"));
        //myPhoto.setDescription(new PlainTextConstruct("Puppies are the greatest."));
        //myPhoto.setClient("kitesurfingHauge-kitesurfingNo-1");
        MediaStreamSource myMedia = new MediaStreamSource(stream, "image/jpeg");

        myPhoto.setMediaSource(myMedia);


        PhotoEntry returnedPhoto = null;

        try {
            returnedPhoto = this.insert(entry, myPhoto);
        } catch (IOException ioex) {
            getLogService().log(Level.SEVERE, "An error occured on attempt to insert the photo", ioex);
            throw ioex;
        } catch (ServiceException sex) {
            getLogService().log(Level.SEVERE, "An error occured on attempt to insert the photo", sex);
            throw sex;
        }
        url = returnedPhoto.getMediaThumbnails().get(1).getUrl();
        returnImageMap.put(ImageMeta.sizeMIN, url);
        if (returnedPhoto.getWidth() > 800) {
            returnImageMap.put(ImageMeta.sizeMAX, url.replaceFirst("/s144/", "/s800/"));
        } else if (returnedPhoto.getWidth() > 400) {
            returnImageMap.put(ImageMeta.sizeMAX, url.replaceFirst("/s144/", "/s400/"));
        } else if (returnedPhoto.getWidth() > 288) {
            returnImageMap.put(ImageMeta.sizeMAX, url.replaceFirst("/s144/", "/s288/"));
        } else {
            returnImageMap.put(ImageMeta.sizeMAX, url);
        }
        returnImageMap.put(ImageMeta.url, returnedPhoto.getHtmlLink().getHref());

        return returnImageMap;

    }*/

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
        return service.getEntry(new URL(videoEntryUrl), VideoEntry.class);
    
    }

    public VideoEntry getVideoEntryInProgress(String id) throws ServiceException, IOException{
        String videoEntryUrl = "http://gdata.youtube.com/feeds/api/users/default/uploads/" + id;
        return service.getEntry(new URL(videoEntryUrl), VideoEntry.class);
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
}
