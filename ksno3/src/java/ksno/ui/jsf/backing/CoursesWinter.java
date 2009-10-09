/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Category;
import ksno.model.Video;
import ksno.service.ArticleService;
import ksno.service.EventService;
import ksno.service.VideoService;

/**
 *
 * @author tor.hauge
 */
public class CoursesWinter {
    private EventService eventService;
    private ArticleService articleService;
    private VideoService videoService;

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public VideoService getVideoService() {
        return videoService;
    }

    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }



    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    
    public List getCourses(){
        return eventService.getOpenUpcommingWinterBeginnerCourses();
    }

    public List<ksno.model.Article> getCourseArticles(){
        getLogService().log(Level.INFO, "Start getCourseArticles()");
        Category category = new Category();
        category.setName("Vinterkurs");
        List<ksno.model.Article> returnList = getArticleService().getArticlesByCategory(category);
        getLogService().log(Level.INFO, "Found a list of " + returnList.size() + " articles.");
        while(returnList.size() > 5){
            returnList.remove(returnList.size()-1);
        }
        return returnList;
    }

    public List<Video> getCourseVideos(){
        getLogService().log(Level.INFO, "Start getCourseVideos()");
        Category category = new Category();
        category.setName("Vinterkurs");
        List<Video> returnList = getVideoService().getVideosByCategory(category);
        getLogService().log(Level.INFO, "Found a list of " + returnList.size() + " videos.");
        while(returnList.size() > 5){
            returnList.remove(returnList.size()-1);
        }
        return returnList;
    }


    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

    public List getFiveNextCourses(){
        getLogService().log(Level.INFO, "Start getting four next courses");
        List<ksno.model.BeginnerCourse> courses = this.getCourses();
        Iterator <ksno.model.BeginnerCourse> courseIterator = courses.iterator();
        List<ksno.model.BeginnerCourse> returnList = new LinkedList<ksno.model.BeginnerCourse>();
        while(courseIterator.hasNext() && returnList.size()<5){
            ksno.model.BeginnerCourse course = courseIterator.next();
            returnList.add(course);
        }
        getLogService().log(Level.INFO, "Finished getting four next courses, returning a list of " + returnList.size() + " courses.");
        return returnList;


    }

    public boolean isMoreThanFourCourses(){
        return this.getCourses().size() > 4;
    }


}
