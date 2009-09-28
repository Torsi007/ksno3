/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import ksno.service.EventService;

/**
 *
 * @author tor.hauge
 */
public class CoursesSummer {
    private EventService eventService;

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    
    public List getCourses(){
        return eventService.getUpcommingSummerBeginnerCourses();
    }

    public boolean isNoCourses(){
        return (this.getCourses() == null || this.getCourses().size() == 0);
    }

    public List getTwoNextCourses(){
        List<ksno.model.BeginnerCourse> courses = this.getCourses();
        Iterator <ksno.model.BeginnerCourse> courseIterator = courses.iterator();
        List<ksno.model.BeginnerCourse> returnList = new LinkedList<ksno.model.BeginnerCourse>();
        while(courseIterator.hasNext() && returnList.size()<2){
            ksno.model.BeginnerCourse course = courseIterator.next();
            returnList.add(course);
        }
        return returnList;


    }

}
