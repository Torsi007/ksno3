/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.BeginnerCourse;
import ksno.service.EventService;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;

/**
 *
 * @author halsnehauge
 */
public class BeginnerCourseCreate {
    private HtmlInputText startDate;
    private HtmlInputText endDate;    
    private HtmlInputText comment;
    private HtmlInputText maxSize;
    private HtmlSelectOneMenu location;

    public HtmlSelectOneMenu getLocation() {
        return location;
    }

    public void setLocation(HtmlSelectOneMenu location) {
        this.location = location;
    }
    private EventService eventService;

    public EventService getCourseService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    public HtmlInputText getComment() {
        return comment;
    }

    public void setComment(HtmlInputText comment) {
        this.comment = comment;
    }

    public HtmlInputText getEndDate() {
        return endDate;
    }

    public void setEndDate(HtmlInputText endDate) {
        this.endDate = endDate;
    }

    public HtmlInputText getMaxSize() {
        return maxSize;
    }

    public void setMaxSize(HtmlInputText maxSize) {
        this.maxSize = maxSize;
    }

    public HtmlInputText getStartDate() {
        return startDate;
    }

    public void setStartDate(HtmlInputText startDate) {
        this.startDate = startDate;
    }
    
    public String createCourse(){
        String returnVal = "eventsMaintain";
        try{
            BeginnerCourse course = new BeginnerCourse();
            course.setStartDate((Date)startDate.getValue());
            course.setEndDate((Date)endDate.getValue());            
            course.setComment(comment.getValue().toString());                        
            course.setMaxSize(Integer.parseInt(maxSize.getValue().toString()));                                    
            course.setLocation(location.getValue().toString());
            eventService.newEvent(course);
        }catch(Exception e){
            Logger.getLogger(BeginnerCourseCreate.class.getName()).log(Level.SEVERE,"Unable to create article", e);
            returnVal = "no";
        }
        return returnVal;
    }     


}
