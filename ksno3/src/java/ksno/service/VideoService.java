/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.service;

import java.util.List;
import ksno.model.Video;

/**
 *
 * @author Tor-Erik
 */
public interface VideoService {
    public Video getVideo(Long id);
    public Long newVideo(Video video);
    public void updateVideo(Video video);
    public void deleteVideo(Video video);
    public List<Video> getVideos();
}
