/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.EventDao;
import ksno.model.BeginnerCourse;
import ksno.model.Event;
import ksno.util.JSFUtil;
import ksno.util.KSNOutil;

/**
 *
 * @author halsnehauge
 */
public class EventServiceImpl implements EventService {

    private EventDao eventDao;

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

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
        //TODO: To be removed
        year = year - 1;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        List returnList = (List)JSFUtil.getValue("#{ApplicationBean1.eventsFromThisYear}", c);
        if(returnList != null && returnList.size()>0){
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
    
    public List getBeginnerCourses() {
        return eventDao.getOpenBeginnerCourses();
    }

    public List<BeginnerCourse> getBeginnerCoursesFromThisYear(){
        Class c = null;
        getLogService().log(Level.INFO,"About to get beginnercourses from start of current year...");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        List returnList = (List)JSFUtil.getValue("#{ApplicationBean1.beginnerCoursesFromThisYear}", c);
        if(returnList != null){
            getLogService().log(Level.INFO,"Found it in the cache");
            if(returnList.size()>0){
                BeginnerCourse course = (BeginnerCourse)returnList.get(0);
                Calendar evStart = Calendar.getInstance();
                evStart.setTime(course.getStartDate());
                if(evStart.get(Calendar.YEAR)< Calendar.getInstance().get(Calendar.YEAR)){
                    returnList = null;
                    clearEventsApplicationCache();
                    getLogService().log(Level.INFO,"But we have entered a new year since last time we accesses the list, need to clear cache");
                }
            }


        }
        if(returnList == null){
            getLogService().log(Level.INFO,"Cache was empty need to query dao");
            Calendar start = Calendar.getInstance();
            start.set(Calendar.YEAR,year);
            start.set(Calendar.DAY_OF_YEAR,1); //first day of the year.
            returnList = eventDao.getBeginnerCourses(start);
            JSFUtil.setValue("#{ApplicationBean1.beginnerCoursesFromThisYear}", returnList, c);
        }
        getLogService().log(Level.INFO,"Returning a list of " + returnList.size() + " courses");
        return returnList;
    }



    public List<BeginnerCourse> getOpenUpcommingWinterBeginnerCourses() {
        getLogService().log(Level.INFO,"About to get winter courses from this year");
        List<BeginnerCourse> returnList = new LinkedList<BeginnerCourse>();
        List<BeginnerCourse> beginnerCoursesFromThisYear = getBeginnerCoursesFromThisYear();
        getLogService().log(Level.INFO,"Found " + beginnerCoursesFromThisYear.size() + " courses from this year");
        for (BeginnerCourse beginnerCourse : beginnerCoursesFromThisYear) {
            getLogService().log(Level.INFO,"About to get winter courses from this year");
            Date now = new Date();
            if (beginnerCourse.getLocation().equalsIgnoreCase("haukeliseter") && beginnerCourse.isOpen() && now.getTime() < beginnerCourse.getStartDate().getTime()) {
                returnList.add(beginnerCourse);
                getLogService().log(Level.INFO, "Course had location " + beginnerCourse.getLocation() + " and open = " + beginnerCourse.isOpen() + " hence adding it to the returnlist");
            }
        }
        getLogService().log(Level.INFO, "Return a list of " + returnList.size() + " courses");
        return returnList;
    }



    public List getUpcommingWinterBeginnerCourses() {
        getLogService().log(Level.INFO,"About to get winter courses from this year");
        List<BeginnerCourse> returnList = new LinkedList<BeginnerCourse>();
        List<BeginnerCourse> beginnerCoursesFromThisYear = getBeginnerCoursesFromThisYear();
        getLogService().log(Level.INFO,"Found " + beginnerCoursesFromThisYear.size() + " courses from this year");
        for (BeginnerCourse beginnerCourse : beginnerCoursesFromThisYear) {
            getLogService().log(Level.INFO,"About to get winter courses from this year");
            if (beginnerCourse.getLocation().equalsIgnoreCase("haukeliseter")) {
                returnList.add(beginnerCourse);
                getLogService().log(Level.INFO, "Course had location " + beginnerCourse.getLocation() + " hence adding it to the returnlist");
            }
        }
        getLogService().log(Level.INFO, "Return a list of " + returnList.size() + " courses");
        return returnList;
    }

    public List getOpenUpcommingSummerBeginnerCourses() {
        getLogService().log(Level.INFO,"About to get summer courses from this year");
        List<BeginnerCourse> returnList = new LinkedList<BeginnerCourse>();
        List<BeginnerCourse> beginnerCoursesFromThisYear = getBeginnerCoursesFromThisYear();
        getLogService().log(Level.INFO,"Found " + beginnerCoursesFromThisYear.size() + " courses from this year");
        for (BeginnerCourse beginnerCourse : beginnerCoursesFromThisYear) {
            getLogService().log(Level.INFO,"About to get winter courses from this year");
            Date now = new Date();
            if (beginnerCourse.getLocation().equalsIgnoreCase("jæren") && beginnerCourse.isOpen() && now.getTime() < beginnerCourse.getStartDate().getTime()) {
                returnList.add(beginnerCourse);
                getLogService().log(Level.INFO, "Course had location " + beginnerCourse.getLocation() + " and open = " + beginnerCourse.isOpen() + " hence adding it to the returnlist");
            }
        }
        getLogService().log(Level.INFO, "Return a list of " + returnList.size() + " courses");
        return returnList;
    }

    public List getUpcommingSummerBeginnerCourses() {
        getLogService().log(Level.INFO,"About to get summer courses from this year");
        List<BeginnerCourse> returnList = new LinkedList<BeginnerCourse>();
        List<BeginnerCourse> beginnerCoursesFromThisYear = getBeginnerCoursesFromThisYear();
        getLogService().log(Level.INFO,"Found " + beginnerCoursesFromThisYear.size() + " courses from this year");
        for (BeginnerCourse beginnerCourse : beginnerCoursesFromThisYear) {
            getLogService().log(Level.INFO,"About to get winter courses from this year");
            if (beginnerCourse.getLocation().equalsIgnoreCase("jæren")) {
                returnList.add(beginnerCourse);
                getLogService().log(Level.INFO, "Course had location " + beginnerCourse.getLocation() + " hence adding it to the returnlist");
            }
        }
        getLogService().log(Level.INFO, "Return a list of " + returnList.size() + " courses");
        return returnList;
    }




    public Long newEvent(Event event) {
        clearEventsApplicationCache();
        clearEventsFromThisYearApplicationCache();
        event.setPrettyPrintId("/" + event.getLocation().toLowerCase() + KSNOutil.getPrettyPrintId(event.getStartDate()));
        return eventDao.newEvent(event);
    }
    
    public Event getEvent(Long id) {
        return eventDao.getEvent(id);
    }

    public void deleteEvent(Event event) {
        clearEventsApplicationCache();
        clearEventsFromThisYearApplicationCache();
        eventDao.deleteEvent(event);
    }

    public void updateEvent(Event event) {
        clearEventsApplicationCache();
        clearEventsFromThisYearApplicationCache();
        event.setPrettyPrintId("/" + event.getLocation().toLowerCase() + KSNOutil.getPrettyPrintId(event.getStartDate()));
        eventDao.updateEvent(event);
    }

    public BeginnerCourse getBeginnerCourse(Long id) {
        return eventDao.getBeginnerCourse(id);
    }

    public BeginnerCourse getBeginnerCourse(String prettyPrintId) {
        return eventDao.getBeginnerCourse(prettyPrintId);
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
        JSFUtil.setValue("#{ApplicationBean1.beginnerCoursesFromThisYear}", null, c);
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


}
