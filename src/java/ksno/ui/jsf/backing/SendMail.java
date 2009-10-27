/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.component.html.HtmlSelectOneMenu;
import javax.faces.model.SelectItem;
import ksno.model.Event;
import ksno.model.Participation;
import ksno.model.Person;
import ksno.service.EventService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectBooleanCheckbox;

/**
 *
 * @author tor.hauge
 */
public class SendMail {
    private UIData dataRecipients;
    private HtmlOutputText errorMsg;
    private HtmlOutputText confirmMsg;
    private HtmlInputText subject;
    private HtmlInputTextarea body;
    private HtmlSelectBooleanCheckbox induvidualMails;
    PersonService personService;
    EventService eventService;
    private HtmlSelectOneMenu coursesSelect;

    public HtmlOutputText getConfirmMsg() {
        return confirmMsg;
    }

    public void setConfirmMsg(HtmlOutputText confirmMsg) {
        this.confirmMsg = confirmMsg;
    }
    
    

    private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
    }
    
    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    
    public HtmlSelectBooleanCheckbox getInduvidualMails() {
        return induvidualMails;
    }

    public void setInduvidualMails(HtmlSelectBooleanCheckbox induvidualMails) {
        this.induvidualMails = induvidualMails;
    }
    
    public HtmlInputTextarea getBody() {
        return body;
    }

    public void setBody(HtmlInputTextarea body) {
        this.body = body;
    }

    public HtmlInputText getSubject() {
        return subject;
    }

    public void setSubject(HtmlInputText subject) {
        this.subject = subject;
    }    
    
    public HtmlSelectOneMenu getCoursesSelect() {
        return coursesSelect;
    }

    public void setCoursesSelect(HtmlSelectOneMenu coursesSelect) {
        this.coursesSelect = coursesSelect;
    }    
    
    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }
    
    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public UIData getDataRecipients() {
        return dataRecipients;
    }

    public void setDataRecipients(UIData dataRecipients) {
        this.dataRecipients = dataRecipients;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    // </editor-fold>
    
    public List getRecipients(){
        Class c = null;
        try {
            c = Class.forName("java.lang.Long");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE,null,ex);
        }
        List lstRecipients = null;
        Long selectedCourseId = (Long) JSFUtil.getValue("#{SessionBean1.longVal1}", c);
        
        if(selectedCourseId == null || selectedCourseId < 1){
            lstRecipients = personService.getPersons();
        }else{
            lstRecipients = new ArrayList();
            Event e = eventService.getEvent(selectedCourseId);
            Iterator iter = e.getParticipations().iterator();
            while(iter.hasNext()){
                Participation p = (Participation)iter.next();
                lstRecipients.add(p.getParticipant());
            }
        }
       return lstRecipients;        
    } 
    
    public SelectItem[] getCourses(){
        List events = eventService.getEvents();
        return JSFUtil.toSelectItemArray(events, true);        
    }   

    public String filter(){
        try {
            JSFUtil.setValue("#{SessionBean1.longVal1}", coursesSelect.getValue().toString(), Class.forName("java.lang.Long"));
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        return "hj";
    }
    
    public String send(){
        String returnVal = "success";
        try{
            List recipients = (List)getDataRecipients().getValue();
            ArrayList<String> tos = new ArrayList<String>(); 
            boolean ivMails = Boolean.valueOf(getInduvidualMails().getValue().toString()); 
            if(ivMails){
                for(int i = 0; i< recipients.size(); i++){
                    Person person = (Person)recipients.get(i);
                    if(person.isUiSendMail()){
                        ksno.util.SendMail sendMail = new ksno.util.SendMail(person.getUserName(), "info@kitesurfing.no", getSubject().getValue().toString() , getBody().getValue().toString());
                        sendMail.send();
                        confirmMsg.setValue("Mail sent successfully to: " + person.getUserName());            
                    }
                } 
            }else{
                String[] ccs = {"info@kitesurfing.no"};                
                for(int i = 0; i< recipients.size(); i++){
                    Person person = (Person)recipients.get(i);
                    if(person.isUiSendMail()){
                        tos.add(person.getUserName()); 
                    }
                } 
                String s[] = new String[tos.size()];
                s = tos.toArray(s);
                ksno.util.SendMail sendMail = new ksno.util.SendMail(s, ccs, getSubject().getValue().toString(), getBody().getValue().toString());             
                sendMail.send();
                confirmMsg.setValue("Mail sent successfully to: " + s.toString());                        
            }
            

        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create send mail", e);
            errorMsg.setValue("Mailen ble ikke sendt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
        return returnVal;
    }        
}
