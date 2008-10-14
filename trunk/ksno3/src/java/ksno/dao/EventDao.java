/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.Event;

/**
 *
 * @author halsnehauge
 */
public interface EventDao {
      public Long newEvent(Event event);
      public List getEvents();
      public Event getEvent(Long id);      
}
