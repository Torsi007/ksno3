/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;


import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.component.html.HtmlOutputText;
import ksno.model.Event;
import ksno.service.EventService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;

/**
 *
 * @author halsnehauge
 */
public class EventsMaintain {
    EventService eventService;
    private HtmlInputText name;
    private UIData data;
    private HtmlOutputText errorMsg;

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
    }    

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }
    
    public List getEvents(){
        return eventService.getEvents();
    }

    public List getEventsFromThisYear(){
        return eventService.getEventsFromThisYear();
    }

    
   public String eventDelete(){
       String returnVal = "sucess";
        try{
           Event event = (Event)this.getData().getRowData();
           eventService.deleteEvent(event);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete event", e);
            errorMsg.setRendered(true);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }   
   
    public String eventUpdate(){ 
        
        String returnVal = "success";
        try{
            Event eventModify = (Event)this.getData().getRowData();
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanEventModify, eventModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to select event", e);
            errorMsg.setRendered(true);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
       return returnVal;        
      
    }

    public String participantsMaintain(){

        String returnVal = "success";
        try{
            Event eventModify = (Event)this.getData().getRowData();
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanEventModify, eventModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to select event", e);
            errorMsg.setRendered(true);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
       return returnVal;

    }

}
