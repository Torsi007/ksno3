/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.BeginnerCourse;
import ksno.model.Event;

/**
 *
 * @author halsnehauge
 */
public interface EventService {
    public List getEvents();
    public List getEventsFromThisYear();
    public Long newEvent(Event event);  
    public void deleteEvent(Event event); 
    public void updateEvent(Event event);
    public Event getEvent(Long id); 
    public BeginnerCourse getBeginnerCourse(Long id);    
    public List getOpenUpcommingWinterBeginnerCourses(); 
    public String getAwailableSeatsOnOpenUpcommingWinterBeginnerCourses();
    public List getOpenUpcommingSummerBeginnerCourses();   
    public List getUpcommingWinterBeginnerCourses();  
    public List getUpcommingSummerBeginnerCourses();      
    
}
