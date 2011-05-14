/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.ui.jsf.backing;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
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
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;

/**
 *
 * @author tor.hauge
 */
public class CourseParticipantsMaintain {

    private UIData dataConfirmedParticipants;
    private UIData dataUnconfirmedParticipants;
    private HtmlOutputText errorMsg;
    private EventService eventService;
    private PersonService personService;
    private ParticipationService participationService;
    private HtmlSelectOneMenu eventSelect;
    private SelectItem[] eventInstructors;
    private SelectItem[] eventSelectItems;
    private SelectItem[] workGroupSelectItems;


// <editor-fold defaultstate="collapsed" desc="Getters and setters">
    public HtmlSelectOneMenu getEventSelect() {
        return eventSelect;
    }

    public void setEventSelect(HtmlSelectOneMenu eventSelect) {
        this.eventSelect = eventSelect;
    }

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public ParticipationService getParticipationService() {
        return participationService;
    }

    public void setParticipationService(ParticipationService participationService) {
        this.participationService = participationService;
    }

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    public UIData getDataConfirmedParticipants() {
        return dataConfirmedParticipants;
    }

    public void setDataConfirmedParticipants(UIData dataConfirmedParticipants) {
        this.dataConfirmedParticipants = dataConfirmedParticipants;
    }

    public UIData getDataUnconfirmedParticipants() {
        return dataUnconfirmedParticipants;
    }

    public void setDataUnconfirmedParticipants(UIData dataUnconfirmedParticipants) {
        this.dataUnconfirmedParticipants = dataUnconfirmedParticipants;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
// </editor-fold>

    public SelectItem[] getWorkGroupSelectItems() {
        if (workGroupSelectItems == null || workGroupSelectItems.length == 0) {
            workGroupSelectItems = new SelectItem[getEventInstructors().length * 4];
            int i = 0;
            for (int j = 0; j < getEventInstructors().length; j++) {
                SelectItem item = getEventInstructors()[j];
                i = j * 4;
                int index = i;
                int print = 1;
                workGroupSelectItems[index] = new SelectItem(item.getLabel() + " " + print, item.getLabel() + " " + print);
                index++;
                print++;
                workGroupSelectItems[index] = new SelectItem(item.getLabel() + " " + print, item.getLabel() + " " + print);
                index++;
                print++;
                workGroupSelectItems[index] = new SelectItem(item.getLabel() + " " + print, item.getLabel() + " " + print);
                index++;
                print++;
                workGroupSelectItems[index] = new SelectItem(item.getLabel() + " " + print, item.getLabel() + " " + print);
            }
        }
        return workGroupSelectItems;
    }


    public SelectItem[] getEventInstructors(){
        if(eventInstructors == null || eventInstructors.length == 0){
            Event eventToModify = (Event) JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            eventInstructors = new SelectItem[eventToModify.getInstructors().length + 1];
            for(int i = 0; i< eventToModify.getInstructors().length; i++ ){
                Instructor instructor = eventToModify.getInstructors()[i];
                eventInstructors[i] = new SelectItem(instructor,instructor.getLabel());
            }
            eventInstructors[eventToModify.getInstructors().length] = new SelectItem(eventToModify.getInstructor(),eventToModify.getInstructor().getLabel());
        }
        return eventInstructors;
    }

    public SelectItem[] getEventSelectItems(){
        if(eventSelectItems == null || eventSelectItems.length == 0){
            List events = eventService.getEvents();
            Event eventToModify = (Event) JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            SelectItem[] arr = JSFUtil.toSelectItemArray(events, true);
            List<SelectItem> result = new ArrayList<SelectItem>();
            for(SelectItem item : arr){
                if(Long.parseLong(item.getValue().toString()) != eventToModify.getId()){
                    result.add(item);
                }
            }
            SelectItem[] arr2 = new SelectItem[result.size()];
            for(int i = 0; i<arr2.length; i++){
                arr2[i] = result.get(i);
            }
            eventSelectItems = arr2;
        }
        return eventSelectItems;
    }

    public String unConfirmedParticipantDelete() {
        String returnVal = "sucess";
        try {
            Participation participation = (Participation) this.getDataUnconfirmedParticipants().getRowData();
            Event event = (Event) JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            if (event.getParticipations().contains(participation)) {
                event.getParticipations().remove(participation);
                eventService.updateEvent(event);
                participationService.deleteParticipation(participation);
            }
        } catch (Exception e) {
            getLogService().log(Level.SEVERE, "Unable to delete article", e);
            errorMsg.setRendered(true);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }

        return returnVal;
    }

    public String confirmParticipants() {
        String returnVal = "sucess";
        errorMsg.setRendered(false);
        try {
            Event event = (Event) JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            Iterator iterParticipations = event.getParticipations().iterator();
            while (iterParticipations.hasNext()) {
                Participation particiption = (Participation) iterParticipations.next();
                if(particiption.isuIChecked()){
                    particiption.setConfirmed(true);
                }
                particiption.setuIChecked(false);
            }
            eventService.updateEvent(event);
        } catch (Exception e) {
            getLogService().log(Level.SEVERE, "Unable to confirm participations", e);
            errorMsg.setRendered(true);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String unConfirmParticipants() {
        String returnVal = "sucess";
        try {
            Event event = (Event) JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            Iterator iterParticipations = event.getParticipations().iterator();
            while (iterParticipations.hasNext()) {
                Participation particiption = (Participation) iterParticipations.next();
                if(particiption.isuIChecked()){
                    particiption.setConfirmed(false);
                }
                particiption.setuIChecked(false);
            }
            eventService.updateEvent(event);
        } catch (Exception e) {
            errorMsg.setRendered(true);
            getLogService().log(Level.SEVERE, "Unable to unconfirm participations", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String deleteParticipants() {
        String returnVal = "sucess";
        try {
            Event event = (Event) JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            Iterator iterParticipations = event.getParticipations().iterator();
            HashSet<Participation> participationToRemove  = new HashSet<Participation>();
            while (iterParticipations.hasNext()) {
                Participation particiption = (Participation) iterParticipations.next();
                if(particiption.isuIChecked()){
                    //event.removeParticipation(particiption);
                    participationToRemove.add(particiption);
                }
            }
            event.removeParticipations(participationToRemove);
            eventService.updateEvent(event);
        } catch (Exception e) {
            getLogService().log(Level.SEVERE, "Unable to unconfirm participations", e);
            errorMsg.setRendered(true);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String moveParticipantsToCourse(){
        getLogService().log(Level.INFO, "Start moveParticipantsToCourse");
        String returnVal = "sucess";
        try {
            Event event = (Event) JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            Iterator iterParticipations = event.getParticipations().iterator();
            HashSet<Participation> participations  = new HashSet<Participation>();
            getLogService().log(Level.INFO, "Found the following particpants to move from event " + event.getStartDate().toString() + ":");
            while (iterParticipations.hasNext()) {
                Participation particiption = (Participation) iterParticipations.next();
                if(particiption.isuIChecked()){
                    participations.add(particiption);
                    getLogService().log(Level.INFO, particiption.getParticipant().getFirstName() + " " + particiption.getParticipant().getLastName());
                }
            }
            Event moveToEvent = getEventService().getEvent(Long.parseLong(getEventSelect().getValue().toString()));
            if(moveToEvent != null){
                getLogService().log(Level.INFO, "To event " + moveToEvent.getStartDate().toString() + ":");
                moveToEvent.addParticipations(participations);
                eventService.updateEvent(moveToEvent);
            }else{
                getLogService().log(Level.WARNING, "Unable to move participants, seems like the event to move participants to is not selected");
                errorMsg.setRendered(true);
                errorMsg.setValue("Operasjonen feilet, det ser ut til at du ikke har valgt kurs for flytting av deltagere");
                returnVal = "no";
            }
            getEventSelect().setValue(null);

        } catch (Exception e) {
            getLogService().log(Level.SEVERE, "Unable to move participations", e);
            errorMsg.setRendered(true);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String participantUnknownAdd() {
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
                participation.setConfirmed(true);
                event.getParticipations().add(participation);
                dummy.addParticipation(participation);
            }else{
                errorMsg.setRendered(true);
                errorMsg.setValue("Operasjonen feilet, da det ikke er definert noen person med brukernavn: " + dummyUserName);
                returnVal = "no";
            }
            eventService.updateEvent(event);

        }catch(Exception e){
            errorMsg.setRendered(true);
            getLogService().log(Level.SEVERE,"Unable to delete article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }

       return returnVal;

    }

    public String save(){

        String returnVal = "success";
        try{
            Event event = (Event)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanEventModify);
            eventService.updateEvent(event);
        }catch(Exception e){
            errorMsg.setRendered(true);
            getLogService().log(Level.SEVERE,"Unable to update event", e);
            returnVal = "no";
        }
        return returnVal;
    }

    public String close(){
        String returnVal = "success";
        try{
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanEventModify);
        }catch(Exception e){
            errorMsg.setRendered(true);
            getLogService().log(Level.SEVERE,"Unable to update event", e);
            returnVal = "no";
        }
        return returnVal;
    }
}
