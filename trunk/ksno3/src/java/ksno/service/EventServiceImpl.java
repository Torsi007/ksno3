/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.EventDao;
import ksno.model.BeginnerCourse;
import ksno.model.Event;
import ksno.util.JSFUtil;

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
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        List returnList = (List)JSFUtil.getValue("#{ApplicationBean1.events}", c);
        if(returnList == null){
            returnList = eventDao.getEvents();
            JSFUtil.setValue("#{ApplicationBean1.events}", returnList, c);
        }
        return returnList;
    }

    public List getEventsFromThisYear(){
        Class c = null;
        int year = Calendar.getInstance().get(Calendar.YEAR);
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        List returnList = (List)JSFUtil.getValue("#{ApplicationBean1.eventsFromThisYear}", c);
        if(returnList != null){
            Event event = (Event)returnList.get(0);
            Calendar evStart = Calendar.getInstance();
            evStart.setTime(event.getStartDate());
            if(evStart.get(Calendar.YEAR)< Calendar.getInstance().get(Calendar.YEAR)){
                returnList = null;
                clearEventsFromThisYearApplicationCache(); 
            }

        }
        if(returnList == null){
 
            Calendar start = Calendar.getInstance();
            start.set(Calendar.YEAR,year);
            start.set(Calendar.DAY_OF_YEAR,1); //first day of the year.
            returnList = eventDao.getEvents(start);
            JSFUtil.setValue("#{ApplicationBean1.eventsFromThisYear}", returnList, c);
        }
        return returnList;
    }

    public Long newEvent(Event event) {
        clearEventsApplicationCache();
        clearEventsFromThisYearApplicationCache();
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
        clearEventsApplicationCache();
        clearEventsFromThisYearApplicationCache();
        eventDao.deleteEvent(event);
    }

    public void updateEvent(Event event) {
        clearEventsApplicationCache();
        clearEventsFromThisYearApplicationCache();
        eventDao.updateEvent(event);
    }

    public BeginnerCourse getBeginnerCourse(Long id) {
        return eventDao.getBeginnerCourse(id);
    }
    
    private void clearEventsApplicationCache(){
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        JSFUtil.setValue("#{ApplicationBean1.events}", null, c);    
    }
    
    private void clearEventsFromThisYearApplicationCache(){
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        JSFUtil.setValue("#{ApplicationBean1.eventsFromThisYear}", null, c);    
    }
}
