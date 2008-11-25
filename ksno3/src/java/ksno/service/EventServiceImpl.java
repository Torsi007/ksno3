/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import ksno.dao.EventDao;
import ksno.model.BeginnerCourse;
import ksno.model.Event;

/**
 *
 * @author halsnehauge
 */
public class EventServiceImpl implements EventService {

    private EventDao eventDao;

    public EventDao getEventDao() {
        return eventDao;
    }

    public void setEventDao(EventDao eventDao) {
        this.eventDao = eventDao;
    }
    
    public List getEvents() {
        return eventDao.getEvents();
    }

    public Long newEvent(Event event) {
        return eventDao.newEvent(event);
    }
    
    public Event getEvent(Long id) {
        return eventDao.getEvent(id);
    }

    public List getBeginnerCourses() {
        return eventDao.getOpenBeginnerCourses();
    }

    public List getOpenUpcommingWinterBeginnerCourses() {
        Calendar oneYearAhead = Calendar.getInstance();
        oneYearAhead.add(Calendar.YEAR, 1);
        Date d = new Date(oneYearAhead.getTimeInMillis());
        return eventDao.getOpenBeginnerCourses(new Date(),d, "Haukeli"); 
    }
    
    public String getAwailableSeatsOnOpenUpcommingWinterBeginnerCourses(){
        String returnval = "";
        List courses = getOpenUpcommingWinterBeginnerCourses();
        Iterator courseIterator = courses.iterator();
        while(courseIterator.hasNext()){
            BeginnerCourse course = (BeginnerCourse)courseIterator.next();
            int numberOfParticipants = 0;
            if(course.getParticipations() != null){
                numberOfParticipants = course.getParticipations().size();    
            }
            int awailSeats = course.getMaxSize() - numberOfParticipants;
            returnval += course.getId().toString() + ":" + Integer.toString(awailSeats);
            if(courseIterator.hasNext()){
                returnval += "~";
            }
        }
        return returnval;
    }
    
    public List getUpcommingWinterBeginnerCourses() {
        Calendar oneYearAhead = Calendar.getInstance();
        oneYearAhead.add(Calendar.YEAR, 1);
        Date d = new Date(oneYearAhead.getTimeInMillis());
        return eventDao.getBeginnerCourses(new Date(),d, "Haukeli"); 
    }    
    
    public List getOpenUpcommingSummerBeginnerCourses() {
        Calendar oneYearAhead = Calendar.getInstance();
        oneYearAhead.add(Calendar.YEAR, 1);
        Date d = new Date(oneYearAhead.getTimeInMillis());
        return eventDao.getOpenBeginnerCourses(new Date(),d, "Jæren"); 
    } 
    
    public List getUpcommingSummerBeginnerCourses() {
        Calendar oneYearAhead = Calendar.getInstance();
        oneYearAhead.add(Calendar.YEAR, 1);
        Date d = new Date(oneYearAhead.getTimeInMillis());
        return eventDao.getBeginnerCourses(new Date(),d, "Jæren"); 
    }       

    public void deleteEvent(Event event) {
        eventDao.deleteEvent(event);
    }

    public void updateEvent(Event event) {
        eventDao.updateEvent(event);
    }

    public BeginnerCourse getBeginnerCourse(Long id) {
        return eventDao.getBeginnerCourse(id);
    }
        

}
