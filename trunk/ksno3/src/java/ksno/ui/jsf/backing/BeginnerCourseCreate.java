/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.model.SelectItem;
import ksno.model.BeginnerCourse;
import ksno.model.Instructor;
import ksno.model.Person;
import ksno.service.EventService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;
import org.apache.myfaces.component.html.ext.HtmlSelectBooleanCheckbox;
/**
 *
 * @author halsnehauge
 */
public class BeginnerCourseCreate {
    private HtmlInputText startDate;
    private HtmlInputText endDate;    
    private HtmlInputText comment;
    private HtmlInputText maxSize;
    private HtmlSelectOneMenu location;
    private HtmlSelectOneMenu comboResponsible;
    private HtmlSelectBooleanCheckbox open;
    private HtmlOutputText errorMsg;
    private EventService eventService;
    private PersonService personService;
    private String responsibleId;

    public String getResponsibleId() {
        if(responsibleId == null || "".equals(responsibleId)){
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            responsibleId = Long.toString(currentUser.getId());
        }
        return responsibleId;
    }

    public void setResponsibleId(String responsibleId) {
        this.responsibleId = responsibleId;
    }

    public HtmlSelectOneMenu getComboResponsible() {
        return comboResponsible;
    }

    public void setComboResponsible(HtmlSelectOneMenu comboResponsible) {
        this.comboResponsible = comboResponsible;
    }

    public PersonService getPersonService() {
        return personService;
    }
    
    /*public String getResponsibleId(){
        String userName = JSFUtil.getRequest().getUserPrincipal().getName();
        Person currentUser = personService.getPerson(userName);
        return Long.toString(currentUser.getId());
    }*/

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public HtmlSelectBooleanCheckbox getOpen() {
        return open;
    }

    public void setOpen(HtmlSelectBooleanCheckbox open) {
        this.open = open;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    private Logger getLogService(){
      return Logger.getLogger(BeginnerCourseCreate.class.getName());
    }


    public HtmlSelectOneMenu getLocation() {
        return location;
    }

    public void setLocation(HtmlSelectOneMenu location) {
        this.location = location;
    }


    public EventService getCourseService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    public HtmlInputText getComment() {
        return comment;
    }

    public void setComment(HtmlInputText comment) {
        this.comment = comment;
    }

    public HtmlInputText getEndDate() {
        return endDate;
    }

    public void setEndDate(HtmlInputText endDate) {
        this.endDate = endDate;
    }

    public HtmlInputText getMaxSize() {
        return maxSize;
    }

    public void setMaxSize(HtmlInputText maxSize) {
        this.maxSize = maxSize;
    }

    public HtmlInputText getStartDate() {
        return startDate;
    }

    public void setStartDate(HtmlInputText startDate) {
        this.startDate = startDate;
    }
    
    public SelectItem[] getInstructorSelectItems() {
        List instructors = personService.getInstructors();
        return JSFUtil.toSelectItemArray(instructors);
    }
    
    public String createCourse(){
        String returnVal = "eventsMaintain";
        try{
            BeginnerCourse course = new BeginnerCourse();
            course.setStartDate((Date)startDate.getValue());
            course.setEndDate((Date)endDate.getValue());            
            course.setComment(comment.getValue().toString());                        
            course.setMaxSize(Integer.parseInt(maxSize.getValue().toString()));                                    
            course.setLocation(location.getValue().toString());
            Long insId = Long.decode(getResponsibleId());
            Instructor responsible = personService.getInstructor(insId);
            responsible.addEvent(course);
            //course.setResponsible(responsible);
            boolean op = (Boolean)open.getValue();
            course.setOpen(op);
            eventService.newEvent(course);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            errorMsg.setValue("Kurset ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
        return returnVal;
    }     


}
