/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import javax.faces.context.ExternalContext;
//import com.google.gdata.client.docs.DocsService;
import com.google.gdata.data.media.MediaStreamSource;


import com.google.gdata.util.AuthenticationException;
import com.google.gdata.util.ServiceException;
//import com.google.gdata.data.docs.DocumentListEntry;
//import com.google.gdata.data.docs.DocumentEntry;
import com.google.gdata.data.PlainTextConstruct;


import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tor.hauge
 */
public class GoogleDocsClient {
/*  private final String baseUrl;
  private final DocsService service;


  public GoogleDocsClient() {
     ExternalContext context = JSFUtil.getServletContext();
     String applicationName = context.getInitParameter("applicationName");
     String userName = context.getInitParameter("picasaWeb.userName");
     String passWord = context.getInitParameter("picasaWeb.passWord");
     this.baseUrl = context.getInitParameter("picasaWeb.baseUrl");
     service = new DocsService(applicationName);
      try {     
         service.setUserCredentials(userName, passWord);
      }catch (AuthenticationException e) {
        throw new IllegalArgumentException("Illegal username/password combination.");
      }         
  }

  
  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }

  
  public String uploadDocument(InputStream stream, String userName) throws MalformedURLException, IOException, ServiceException, Exception{
    getLogService().log(Level.INFO, "start");
    String url = null;
    String id = "";
    DocumentEntry newDocument = new DocumentEntry();
    MediaStreamSource myMedia = new MediaStreamSource(stream, "application/pdf");    
    newDocument.setMediaSource(myMedia);


  // Set the title for the new document. For this example we just use the
  // filename of the uploaded file.
  newDocument.setTitle(new PlainTextConstruct("Test"));

  DocumentListEntry uploaded = service.insert(new URL("http://docs.google.com/feeds/documents/private/full"), newDocument);
  
return uploaded.getLinks().get(0).getHref();
          
  }*/

}
