/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

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
      public Event getEvent(Long id);
      public BeginnerCourse getBeginnerCourse(Long id);     
      public List getBeginnerCourses();
      public List getBeginnerCourses(Date fromDate, Date toDate, String location);      
      public List getOpenBeginnerCourses();
      public List getOpenBeginnerCourses(Date fromDate, Date toDate, String location);
}
