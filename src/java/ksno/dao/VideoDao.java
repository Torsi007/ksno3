/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;
import java.util.List;
import ksno.model.Video;


/**
 *
 * @author halsnehauge
 */
public interface VideoDao {
      public Long newVideo(Video video);
      public Video getVideo(Long id);
      public void updateVideo(Video video);
      public void deleteVideo(Video video);
      public List<Video> getVideos();

}
