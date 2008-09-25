/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import ksno.dao.ImageDao;
import ksno.model.Image;

/**
 *
 * @author halsnehauge
 */
public class ImageServiceImpl implements ImageService {
    
    public ImageDao getImageDao() {
        return imageDao;
    }

    public void setImageDao(ImageDao imageDao) {
        this.imageDao = imageDao;
    }
    
   private ImageDao imageDao;

    public Integer newImage(Image image) {
        return imageDao.newImage(image);
    }

}
