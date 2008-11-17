/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.Event;

/**
 *
 * @author halsnehauge
 */
public interface EventService {
    public List getEvents();
    public Long newEvent(Event event);  
    public void deleteEvent(Event event); 
    public void updateEvent(Event event);
    public Event getEvent(Long id); 
    public List getBeginnerCourses();
    public List getOpenUpcommingWinterBeginnerCourses();  
    public List getOpenUpcommingSummerBeginnerCourses();   
    public List getUpcommingWinterBeginnerCourses();  
    public List getUpcommingSummerBeginnerCourses();      
    
}
