/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.

 */

package ksno.util;

import com.google.gdata.data.PlainTextConstruct;
//import com.google.gdata.client.docs.*;
import com.google.gdata.data.MediaContent;
import com.google.gdata.data.acl.*;
//import com.google.gdata.data.docs.*;
import com.google.gdata.data.extensions.*;
import com.google.gdata.util.*;
import javax.faces.context.ExternalContext;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.net.*;
import java.io.*;
 


public class GoogleDocsClient {

   
 // private final String baseUrl;
//  private final DocsService service;


  public GoogleDocsClient() {
     /*
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
      }*/
  }


  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }
/*
  public DocumentListEntry createFolder(String title) throws IOException, ServiceException{
    DocumentListEntry newEntry = new FolderEntry();
    newEntry.setTitle(new PlainTextConstruct(title));
    return service.insert(new URL("http://docs.google.com/feeds/documents/private/full"), newEntry);

  }
*/

  public String uploadFile(String filepath, String title)    throws IOException, ServiceException  {
//      DocumentListEntry folderEntry = createFolder("Bilag");
//      File file = new File(filepath);
 //     String mimeType = DocumentListEntry.MediaType.fromFileName(file.getName()).getMimeType();
 //     DocumentListEntry newDocument = new DocumentListEntry();
 //     newDocument.setFile(file,mimeType);
 //     newDocument.setTitle(new PlainTextConstruct(title));
 //     DocumentListEntry uploaded = service.insert(new URL("http://docs.google.com/feeds/documents/private/full" + folderEntry.getResourceId()), newDocument);
 //     return uploaded.getLinks().get(0).getHref();
      return "";
  }
     
}

