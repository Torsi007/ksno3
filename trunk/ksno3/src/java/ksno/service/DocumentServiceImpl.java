/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.util.GoogleDocsClient;

/**
 *
 * @author tor.hauge
 */
public class DocumentServiceImpl implements DocumentService {

  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }    
    
    public String uploadDocument(String path, String userName) throws Exception {
        getLogService().log(Level.SEVERE, "start");
        try {
            GoogleDocsClient client = new GoogleDocsClient();
            getLogService().log(Level.SEVERE, "return");
            return client.uploadFile(path, "test");
        } catch (Exception ex) {
            getLogService().log(Level.SEVERE, "An error occured on attempt to upload the image", ex);
            throw new Exception("An error occured on attemt to upload the image",ex);
        }
    }

}
