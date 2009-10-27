/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.ImageDao;
import ksno.model.Image;
import ksno.util.ImageMeta;
import ksno.util.PicasawebClient;

/**
 *
 * @author halsnehauge
 */
public class ImageServiceImpl implements ImageService {
    
  private Logger getLogService(){
      return Logger.getLogger(ImageServiceImpl.class.getName());
  }
    
    public ImageDao getImageDao() {
        return imageDao;
    }

    public void setImageDao(ImageDao imageDao) {
        this.imageDao = imageDao;
    }
    
   private ImageDao imageDao;

    public Long newImage(Image image) {
        return imageDao.newImage(image);
    }

    public HashMap<ImageMeta,String> uploadImage(InputStream stream, String userName) throws Exception {
        getLogService().log(Level.SEVERE, "start");
        try {
            PicasawebClient client = new PicasawebClient();
            getLogService().log(Level.SEVERE, "return");
            return client.uploadImage(stream, userName);
        } catch (Exception ex) {
            getLogService().log(Level.SEVERE, "An error occured on attempt to upload the image", ex);
            throw new Exception("An error occured on attemt to upload the image",ex);
        } 
    }


}
