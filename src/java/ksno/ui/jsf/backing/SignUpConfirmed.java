/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;


import ksno.model.Event;
import ksno.service.EventService;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class SignUpConfirmed {
    private EventService eventService;
    Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }    

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }
    
    
    public Event getEvent(){
        long id;
        if(getId() == null){
            Object evId = JSFUtil.getSessionMap().get(JSFUtil.sessionBeanSignedOnEvent);
            id = Long.parseLong(evId.toString());        
        }else{
            id = getId().longValue();
        }

        Event ev = eventService.getEvent(id);
         return ev;
    }



}
