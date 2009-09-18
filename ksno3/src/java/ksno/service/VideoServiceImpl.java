/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.VideoDao;
import ksno.model.Video;
import ksno.util.*;

/**
 *
 * @author Tor-Erik
 */
public class VideoServiceImpl implements VideoService {

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

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

    
    public List<Video> getPublishedVideos() {
        List<Video> toBeReturned = new LinkedList<Video>();
        getLogService().info("Startting getVideos()");
        List<Video> videos = this.getVideos();
        if (videos != null) {
            getLogService().info("Found " + videos.size() + " videos");
            if (getSecondsSinceLastScan() > 60) {
                updateVideoState(videos);
            }
            for (Video video : videos) {
                if (video.getState().equalsIgnoreCase(YoutubeClient.statePublished)) {
                    toBeReturned.add(video);
                }
            }
        }

        return toBeReturned;
    }

    private long getSecondsSinceLastScan(){
        Class c = null;
        long lastScannedTimeMs = 0;
        try {
            c = Class.forName("java.util.Calendar");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        Calendar lastScannedTime = (Calendar)JSFUtil.getValue("#{ApplicationBean1.youTubeListLastScanned}", c);
        if(lastScannedTime != null){
            getLogService().info("The youtube video list was last time queried " + lastScannedTime);
            lastScannedTimeMs = lastScannedTime.getTimeInMillis();
        }
        long now = Calendar.getInstance().getTimeInMillis();
        long seconds = (now - lastScannedTimeMs)/ 1000;
        getLogService().info("i.e. " + seconds +  " seconds ago...");
        return seconds;
    }

    private void updateVideoState(List<Video> videos) {
        getLogService().info("Start updateVideoState");
        if (haveVideosPossibleInProcesingState(videos)) {
            getLogService().info("There are videoes possible still processing hence checking");
            YoutubeClient ytClient = new YoutubeClient();
            for (Video video : videos) {
                String state = video.getState();
                getLogService().info("Processing video " + video.getName() + " in state " + state);
                if (!state.equalsIgnoreCase(YoutubeClient.statePublished) && !state.equalsIgnoreCase(YoutubeClient.stateFailed) && !state.equalsIgnoreCase(YoutubeClient.stateRejected)) {
                    String stateInYouTube = ytClient.getCurrentState(video);
                    getLogService().info("In YouTube its now in state " + stateInYouTube);
                    if (!video.getState().equalsIgnoreCase(stateInYouTube)) {
                        getLogService().info("Hence updating the state...(since their not equal)");
                        video.setState(stateInYouTube);
                        long duration = ytClient.getDuration(video);
                        String strDur = Util.prettyPrintTime(duration);
                        video.setDuration(strDur);
                        updateVideo(video);
                    }
                } else {
                    getLogService().info("Video was already persisted in state " + state + " hence not neccessary to update status.");
                }
            }
            setVideoStateProcessedTime();
        }else{
            getLogService().info("No videoes possible still processing no checking performed");
        }



    }

    private boolean haveVideosPossibleInProcesingState(List<Video> videos) {
        boolean returnval = false;
        for(Video video : videos){
            if(video.getState().equalsIgnoreCase(YoutubeClient.stateProcessing)){
                returnval = true;
                break;
            }
        }
        return returnval;
    }

    private void setVideoStateProcessedTime() {
        Class c = null;
        try {
            c = Class.forName("java.util.Calendar");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        getLogService().info("Setting ApplicationBean1.youTubeListLastScanned value to " + Calendar.getInstance());
        JSFUtil.setValue("#{ApplicationBean1.youTubeListLastScanned}", Calendar.getInstance()  ,c);
    }
}
