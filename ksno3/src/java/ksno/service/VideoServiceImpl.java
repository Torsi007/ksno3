/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.List;
import ksno.dao.VideoDao;
import ksno.model.Video;

/**
 *
 * @author Tor-Erik
 */
public class VideoServiceImpl implements VideoService {

    public VideoDao getVideoDao() {
        return VideoDao;
    }

    public void setVideoDao(VideoDao VideoDao) {
        this.VideoDao = VideoDao;
    }
    
   private VideoDao VideoDao;

    public Video getVideo(Long id) {
        return VideoDao.getVideo(id);
    }

    public Long newVideo(Video video) {
        if(video.getCreatedDate() == null){
            video.setCreatedDate(Calendar.getInstance());
            video.setLastUpdatedDate(video.getCreatedDate());
        }
        return VideoDao.newVideo(video);
    }

    public void updateVideo(Video video) {
        video.setLastUpdatedDate(Calendar.getInstance());
        VideoDao.updateVideo(video);
    }
    
    public void deleteVideo(Video video) {
        VideoDao.deleteVideo(video);
    }
    
    public List<Video> getVideos() {
        return VideoDao.getVideos();
    }  
    
}
