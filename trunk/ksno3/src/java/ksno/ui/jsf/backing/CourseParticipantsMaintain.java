/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.ui.jsf.backing;

import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import ksno.model.Event;
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
public class CourseParticipantsMaintain {

    private UIData dataConfirmedParticipants;
    private UIData dataUnconfirmedParticipants;
    private HtmlOutputText errorMsg;
    private EventService eventService;
    private PersonService personService;
    private ParticipationService participationService;

// <editor-fold defaultstate="collapsed" desc="Getters and setters">
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
