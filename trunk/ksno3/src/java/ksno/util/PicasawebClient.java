/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;


import com.google.gdata.client.photos.PicasawebService;
import com.google.gdata.data.Link;
import com.google.gdata.data.PlainTextConstruct;
import com.google.gdata.data.media.MediaStreamSource;
import com.google.gdata.data.photos.AlbumEntry;
import com.google.gdata.data.photos.AlbumFeed;
import com.google.gdata.data.photos.CommentEntry;
import com.google.gdata.data.photos.GphotoEntry;
import com.google.gdata.data.photos.GphotoFeed;
import com.google.gdata.data.photos.PhotoEntry;
import com.google.gdata.data.photos.TagEntry;
import com.google.gdata.data.photos.UserFeed;
import com.google.gdata.util.AuthenticationException;
import com.google.gdata.util.ServiceException;

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



  public class PicasawebClient {

  private final String baseUrl;
  private final PicasawebService service;

  /**
   * Constructs a new un-authenticated client.
   */
  public PicasawebClient() {
     ExternalContext context = JSFUtil.getServletContext();
     String applicationName = context.getInitParameter("applicationName");
     String userName = context.getInitParameter("picasaWeb.userName");
     String passWord = context.getInitParameter("picasaWeb.passWord");
     this.baseUrl = context.getInitParameter("picasaWeb.baseUrl");
     service = new PicasawebService(applicationName);
      try {     
         service.setUserCredentials(userName, passWord);
      }catch (AuthenticationException e) {
        throw new IllegalArgumentException("Illegal username/password combination.");
      }         
  }

  
  private Logger getLogService(){
      return Logger.getLogger(PicasawebClient.class.getName());
  }

  
  public HashMap<ImageMeta,String> uploadImage(InputStream stream, String userName) throws MalformedURLException, IOException, ServiceException, Exception{
    getLogService().log(Level.INFO, "start");
    String url = null;
    String id = "";
    HashMap<ImageMeta,String> returnImageMap = new HashMap<ImageMeta,String>();
    AlbumEntry entry = getAlbumByTitle(userName);
    
    if(entry == null){
        entry = new AlbumEntry();
        entry.setName(userName);
        entry.setTitle(new PlainTextConstruct(userName));
        try{
            AlbumEntry temp = insertAlbum(entry);
            entry = temp;
        }catch(IOException ioex) {
            getLogService().log(Level.SEVERE, "An error occured on attempt to insert the album", ioex);
            throw ioex;
        } catch(ServiceException sex){
            getLogService().log(Level.SEVERE, "An error occured on attempt to insert the album", sex);
            throw sex;
        }
    }

    PhotoEntry myPhoto = new PhotoEntry();
    myPhoto.setTitle(new PlainTextConstruct("Kitesurfing.no Picture"));
    myPhoto.setDescription(new PlainTextConstruct("Picture uploaded by kitesurfing.no."));
    myPhoto.setClient("kitesurfingHauge-kitesurfingNo-1");
    MediaStreamSource myMedia = new MediaStreamSource(stream, "image/jpeg");
      
    myPhoto.setMediaSource(myMedia);


    PhotoEntry returnedPhoto= null;
    
    try{
       returnedPhoto= this.insert(entry, myPhoto);
    }catch(IOException ioex) {
        getLogService().log(Level.SEVERE, "An error occured on attempt to insert the photo", ioex);
        throw ioex;
    } catch(ServiceException sex){
        getLogService().log(Level.SEVERE, "An error occured on attempt to insert the photo", sex);
        throw sex;
    }    
    url = returnedPhoto.getMediaThumbnails().get(1).getUrl();
    returnImageMap.put(ImageMeta.sizeMIN , url);
    if(returnedPhoto.getWidth() > 1200){
        returnImageMap.put(ImageMeta.sizeMAX , url.replaceFirst("/s144/", "/s1200/"));
    }else if(returnedPhoto.getWidth() > 800){
        returnImageMap.put(ImageMeta.sizeMAX , url.replaceFirst("/s144/", "/s800/"));
    }else if(returnedPhoto.getWidth() > 400){
        returnImageMap.put(ImageMeta.sizeMAX , url.replaceFirst("/s144/", "/s400/"));
    }else if(returnedPhoto.getWidth() > 288){
        returnImageMap.put(ImageMeta.sizeMAX , url.replaceFirst("/s144/", "/s288/"));
    }else{
        returnImageMap.put(ImageMeta.sizeMAX , url);
    }
    returnImageMap.put(ImageMeta.sizeMed , url.replaceFirst("/s144/", "/s288/"));
    returnImageMap.put(ImageMeta.url , returnedPhoto.getHtmlLink().getHref());

    return returnImageMap;
          
  }
/**
   * Retrieves the albums for the given user.
   */
  public List<AlbumEntry> getAlbums() throws IOException, ServiceException {
    UserFeed userFeed = getFeed(this.baseUrl, UserFeed.class);

    List<GphotoEntry> entries = userFeed.getEntries();
    List<AlbumEntry> albums = new ArrayList<AlbumEntry>();
    for (GphotoEntry entry : entries) {
      GphotoEntry adapted = entry.getAdaptedEntry();
      if (adapted instanceof AlbumEntry) {
        albums.add((AlbumEntry) adapted);
      }
    }
    return albums;
  }
  
  public AlbumEntry getAlbumByTitle(String title) throws IOException, ServiceException{
    getLogService().log(Level.INFO, "start searching for album named: " + title);
    AlbumEntry album = null;
    URL feedUrl = new URL(this.baseUrl + "?kind=album");      
    UserFeed myUserFeed = this.service.getFeed(feedUrl, UserFeed.class);
    getLogService().log(Level.INFO, "Traversing albums on feed: " + feedUrl.toString());
    for (AlbumEntry myAlbum : myUserFeed.getAlbumEntries()) {
        String albumTitle = myAlbum.getTitle().getPlainText();
        getLogService().log(Level.INFO, "Found album " + albumTitle);
        if(albumTitle != null &&  title.equals(albumTitle)){
            getLogService().log(Level.INFO, "Found it!");
            album = myAlbum;
            break;
        }
    }        
    if(album == null){
        getLogService().log(Level.INFO, "Did not find any album named: " + title + " returning null");
    }else{
        getLogService().log(Level.INFO, "return");
    }
    return album;
  }

  /**
   * Retrieves the tags for the given user.  These are tags aggregated across
   * the entire account.
   */
  public List<TagEntry> getTags(String uname) throws IOException,
      ServiceException {
    String tagUrl = this.baseUrl + "?kind=tag";
    UserFeed userFeed = getFeed(tagUrl, UserFeed.class);

    List<GphotoEntry> entries = userFeed.getEntries();
    List<TagEntry> tags = new ArrayList<TagEntry>();
    for (GphotoEntry entry : entries) {
      GphotoEntry adapted = entry.getAdaptedEntry();
      if (adapted instanceof TagEntry) {
        tags.add((TagEntry) adapted);
      }
    }
    return tags;
  }

  /**
   * Retrieves the photos for the given album.
   */
  public List<PhotoEntry> getPhotos(AlbumEntry album) throws IOException,
      ServiceException {

    String feedHref = getLinkByRel(album.getLinks(), Link.Rel.FEED);
    AlbumFeed albumFeed = getFeed(feedHref, AlbumFeed.class);

    List<GphotoEntry> entries = albumFeed.getEntries();
    List<PhotoEntry> photos = new ArrayList<PhotoEntry>();
    for (GphotoEntry entry : entries) {
      GphotoEntry adapted = entry.getAdaptedEntry();
      if (adapted instanceof PhotoEntry) {
        photos.add((PhotoEntry) adapted);
      }
    }
    return photos;
  }

  /**
   * Retrieves the comments for the given photo.
   */
  public List<CommentEntry> getComments(PhotoEntry photo) throws IOException,
      ServiceException {

    String feedHref = getLinkByRel(photo.getLinks(), Link.Rel.FEED);
    AlbumFeed albumFeed = getFeed(feedHref, AlbumFeed.class);

    List<GphotoEntry> entries = albumFeed.getEntries();
    List<CommentEntry> comments = new ArrayList<CommentEntry>();
    for (GphotoEntry entry : entries) {
      GphotoEntry adapted = entry.getAdaptedEntry();
      if (adapted instanceof CommentEntry) {
        comments.add((CommentEntry) adapted);
      }
    }
    return comments;
  }

  /**
   * Retrieves the tags for the given taggable entry.  This is valid on user,
   * album, and photo entries only.
   */
  public List<TagEntry> getTags(GphotoEntry<?> parent) throws IOException,
      ServiceException {

    String feedHref = getLinkByRel(parent.getLinks(), Link.Rel.FEED);
    feedHref = addKindParameter(feedHref, "tag");
    AlbumFeed albumFeed = getFeed(feedHref, AlbumFeed.class);

    List<GphotoEntry> entries = albumFeed.getEntries();
    List<TagEntry> tags = new ArrayList<TagEntry>();
    for (GphotoEntry entry : entries) {
      GphotoEntry adapted = entry.getAdaptedEntry();
      if (adapted instanceof TagEntry) {
        tags.add((TagEntry) adapted);
      }
    }
    return tags;
  }

  /**
   * Album-specific insert method to insert into the gallery of the current
   * user, this bypasses the need to have a top-level entry object for parent.
   */
  public AlbumEntry insertAlbum(AlbumEntry album)
      throws IOException, ServiceException {
    String feedUrl = this.baseUrl;
    return service.insert(new URL(feedUrl), album);
  }

  /**
   * Insert an entry into another entry.  Because our entries are a hierarchy,
   * this lets you insert a photo into an album even if you only have the
   * album entry and not the album feed, making it quicker to traverse the
   * hierarchy.
   */
  public <T extends GphotoEntry> T insert(GphotoEntry<?> parent, T entry)
      throws IOException, ServiceException {

    String feedUrl = getLinkByRel(parent.getLinks(), Link.Rel.FEED);
    return service.insert(new URL(feedUrl), entry);
  }

  /**
   * Helper function to allow retrieval of a feed by string url, which will
   * create the URL object for you.  Most of the Link objects have a string
   * href which must be converted into a URL by hand, this does the conversion.
   */
  public <T extends GphotoFeed> T getFeed(String feedHref,
      Class<T> feedClass) throws IOException, ServiceException {
    System.out.println("Get Feed URL: " + feedHref);
    return service.getFeed(new URL(feedHref), feedClass);
    }

  /**
   * Helper function to add a kind parameter to a url.
   */
  public String addKindParameter(String url, String kind) {
    if (url.contains("?")) {
      return url + "&kind=" + kind;
    } else {
      return url + "?kind=" + kind;
    }
  }

  /**
   * Helper function to get a link by a rel value.
   */
  public String getLinkByRel(List<Link> links, String relValue) {
    for (Link link : links) {
      if (relValue.equals(link.getRel())) {
        return link.getHref();
      }
    }
    throw new IllegalArgumentException("Missing " + relValue + " link.");
  }
}
