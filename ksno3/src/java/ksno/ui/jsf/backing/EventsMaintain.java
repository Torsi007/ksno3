/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;


import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.component.html.HtmlOutputText;
import ksno.model.Event;
import ksno.service.EventService;
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
      return Logger.getLogger(ArticlesMaintain.class.getName());
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
    
   public String eventDelete(){
       String returnVal = "sucess";
        try{
           Event event = (Event)this.getData().getRowData();
           eventService.deleteEvent(event);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete event", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }   
   
    public String eventsUpdate(){ 
        
       String returnVal = "sucess";
        try{
            List articles = (List)getData().getValue();
            for(int i = 0; i< articles.size(); i++){
                Event event = (Event)articles.get(i);
                eventService.updateEvent(event);
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update articles", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       
       return returnVal;        
    }   

}
