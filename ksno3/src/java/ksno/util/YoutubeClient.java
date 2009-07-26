/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.util;

import com.google.gdata.client.*;
import com.google.gdata.client.youtube.*;
import com.google.gdata.data.*;
import com.google.gdata.data.geo.impl.*;
import com.google.gdata.data.media.*;
import com.google.gdata.data.media.mediarss.*;
import com.google.gdata.data.youtube.*;
import com.google.gdata.data.extensions.*;
import com.google.gdata.util.*;


import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.context.ExternalContext;

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

    public String uploadVideo(){
        VideoEntry newEntry = new VideoEntry();

        YouTubeMediaGroup mg = newEntry.getOrCreateMediaGroup();
        mg.setTitle(new MediaTitle());
        mg.getTitle().setPlainTextContent("My Test Movie");
        mg.addCategory(new MediaCategory(YouTubeNamespace.CATEGORY_SCHEME, "Autos"));
        mg.setKeywords(new MediaKeywords());
        mg.getKeywords().addKeyword("cars");
        mg.getKeywords().addKeyword("funny");
        mg.setDescription(new MediaDescription());
        mg.getDescription().setPlainTextContent("My description");
        mg.setPrivate(false);
        mg.addCategory(new MediaCategory(YouTubeNamespace.DEVELOPER_TAG_SCHEME, "mydevtag"));
        mg.addCategory(new MediaCategory(YouTubeNamespace.DEVELOPER_TAG_SCHEME, "anotherdevtag"));

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

        return token.getToken() + "~" + token.getUrl();

    }

    /**
     * Retrieves the videos for the given user.
     */
    public List<VideoEntry> getVideos() throws IOException, ServiceException {
        VideoFeed videoFeed = getFeed(this.baseUrl, VideoFeed.class);
        List<VideoEntry> entries = videoFeed.getEntries();
        return entries;
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
