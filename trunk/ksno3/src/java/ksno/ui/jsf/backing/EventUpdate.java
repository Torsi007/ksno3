/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Event;
import ksno.service.EventService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class EventUpdate {

    private HtmlOutputText errorMsg;
    private EventService eventService;
    
  private Logger getLogService(){

      return Logger.getLogger(this.getClass().getName());
  }
    

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    public String updateEvent(){
 
        String returnVal = "success";
        try{
            Event event = (Event)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            eventService.updateEvent(event);
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanEventModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update event", e);
            returnVal = "no";
        }
        return returnVal;
    }      

}
