/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.component.html.HtmlSelectManyListbox;
import javax.faces.component.html.HtmlSelectOneListbox;
import javax.faces.model.SelectItem;
import ksno.model.Event;
import ksno.model.Instruction;
import ksno.model.Instructor;
import ksno.model.Participation;
import ksno.model.Person;
import ksno.service.EventService;
import ksno.service.ParticipationService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class EventUpdate {

    private HtmlOutputText errorMsg;
    private HtmlSelectManyListbox slctManyInstructors;
    private HtmlSelectOneListbox slctInstructor;
    private EventService eventService;
    private PersonService personService;
    private ParticipationService participationService;
    private UIData data;
    private String[] eventInstructors;
    private Instructor eventInstructor;

    public Instructor getEventInstructor() {
        return eventInstructor;
    }

    public void setEventInstructor(Instructor eventInstructor) {
        this.eventInstructor = eventInstructor;
    }

    public void setSlctInstructor(HtmlSelectOneListbox slctInstructor) {
        this.slctInstructor = slctInstructor;
    }

    public HtmlSelectOneListbox getSlctInstructor() {
        return slctInstructor;
    }

    public HtmlSelectManyListbox getSlctManyInstructors() {
        return slctManyInstructors;
    }

    public void setSlctManyInstructors(HtmlSelectManyListbox slctManyInstructors) {
        this.slctManyInstructors = slctManyInstructors;
    }
    
    

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public SelectItem[] getInstructorSelectItems() {
        List instructors = personService.getInstructors();
        return JSFUtil.toSelectItemArray(instructors, true);
    }

    public SelectItem[] getInstructorObjectSelectItems() {
        List instructors = personService.getInstructors();
        return JSFUtil.toObjectSelectItemArray(instructors);
    }
    
    public String[] getEventInstructors() {
        Event event = (Event)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
        Instructor[] instructors = event.getInstructors();
        this.eventInstructors = new String[instructors.length];
        for(int i = 0; i< instructors.length; i++){
            this.eventInstructors[i] = instructors[i].getId().toString();
        }
                
        return this.eventInstructors;
    }
    
    public void setEventInstructors(String[] instructorIds) {
        this.eventInstructors = instructorIds;
    }
    
    
    public ParticipationService getParticipationService() {
        return participationService;
    }

    public void setParticipationService(ParticipationService participationService) {
        this.participationService = participationService;
    }

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
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
            event.getInstructions().clear();
            for(int i = 0; i< this.eventInstructors.length; i++){
                Long instructorId = Long.parseLong(this.eventInstructors[i]);
                if(instructorId.intValue() != -1){
                    Instructor instructor = personService.getInstructor(instructorId);
                    if(instructor == event.getInstructor()){
                        errorMsg.setValue("Instruktør: " + instructor.getFirstName() + " kan ikke være både hovedinstruktør og hjelpeinstruktør");
                        return "no";
                    }
                    Instruction instruction = new Instruction();
                    instruction.setInstructor(instructor);
                    event.addInstruction(instruction);
                }
            }
            eventService.updateEvent(event);
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanEventModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update event", e);
            returnVal = "no";
        }
        return returnVal;
    }      

    public String selectEditParticipant(){
        String returnVal = "sucess";
        try{
            Participation participationModify = (Participation)this.getData().getRowData();
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanParticipationModify, participationModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to select participation", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
       return returnVal;
    }
    
   public String participantDelete(){
       String returnVal = "sucess";
        try{
            Participation participation = (Participation)this.getData().getRowData();
            Event event = (Event)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            if(event.getParticipations().contains(participation)){
                event.getParticipations().remove(participation);  
                eventService.updateEvent(event);
                participationService.deleteParticipation(participation);
            }


           
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }    
    
   public String participantUnknownAdd(){
       String returnVal = "sucess";
        try{
            Event event = (Event)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            Set participants = event.getParticipations();
            Iterator iter = participants.iterator();
            int maxDummy = 0;
            while(iter.hasNext()){
                Participation participant = (Participation)iter.next();
                String userName = participant.getParticipant().getUserName();
                if(userName.startsWith("dummy") && userName.endsWith("kitesurfing.no")){
                    String num = userName.split("@")[0].replaceAll("dummy", "");
                    maxDummy = Math.max(Integer.parseInt(num), maxDummy);
                }
            }
            maxDummy++;
            String dummyUserName = "dummy" + Integer.toString(maxDummy) + "@kitesurfing.no";
            if(maxDummy > 0 && maxDummy < 11){
                Person dummy = personService.getPerson(dummyUserName);
                Participation participation = new Participation();
                participation.setOnWaitList(false);                
                participation.setEvent(event);
                event.getParticipations().add(participation);                
                dummy.addParticipation(participation);
            }else{
                errorMsg.setValue("Operasjonen feilet, da det ikke er definert noen person med brukernavn: " + dummyUserName);            
                returnVal = "no";            
            }
            eventService.updateEvent(event);
           
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }   
   
}
