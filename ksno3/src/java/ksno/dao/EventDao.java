/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import ksno.model.BeginnerCourse;
import ksno.model.Event;

/**
 *
 * @author halsnehauge
 */
public interface EventDao {
      public Long newEvent(Event event);
      public void deleteEvent(Event event);
      public void updateEvent(Event event);      
      public List getEvents();
      public List getEvents(Calendar fromDate);
      public Event getEvent(Long id);
      public BeginnerCourse getBeginnerCourse(Long id);
      public BeginnerCourse getBeginnerCourse(String prettyPrintId);
      public List getBeginnerCourses();
      public List<BeginnerCourse> getBeginnerCourses(Calendar fromDate);
      public List getBeginnerCourses(Date fromDate, Date toDate, String location);      
      public List getOpenBeginnerCourses();
      public List getOpenBeginnerCourses(Date fromDate, Date toDate, String location);
}
