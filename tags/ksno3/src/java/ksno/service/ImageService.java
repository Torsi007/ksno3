/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.io.InputStream;
import java.util.HashMap;
import ksno.model.Image;
import ksno.util.ImageMeta;

/**
 *
 * @author halsnehauge
 */
public interface ImageService {
        public Long newImage(Image image);
        public HashMap<ImageMeta,String> uploadImage(InputStream stream, String userName) throws Exception;

}
