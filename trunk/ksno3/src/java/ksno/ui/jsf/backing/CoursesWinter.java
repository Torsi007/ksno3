/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import ksno.service.EventService;

/**
 *
 * @author tor.hauge
 */
public class CoursesWinter {
    private EventService eventService;

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    
    public List getCourses(){
        return eventService.getUpcommingWinterBeginnerCourses();
    }

}
