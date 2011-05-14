/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.model.SelectItem;
import ksno.model.ExperienceLevel;
import ksno.model.Instructor;
import ksno.model.Participation;
import ksno.model.Person;
import ksno.service.ExperienceLevelService;
import ksno.service.ParticipationService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import ksno.util.Util;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;


/**
 *
 * @author halsnehauge
 */
public class ParticipationAddInfo {
    private PersonService personService;
    private ParticipationService participationService;
    private ExperienceLevelService experienceLevelService;
    private HtmlSelectOneMenu experienceLevel;
    private HtmlSelectOneMenu weight;
    private HtmlSelectOneMenu harnessSize;
    private javax.faces.component.html.HtmlSelectOneMenu partner;
    private HtmlInputText partnerName;
    private Participation participation;
    private HtmlOutputText errorMsg;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlSelectOneMenu getHarnessSize() {
        return harnessSize;
    }

    public void setHarnessSize(HtmlSelectOneMenu harnessSize) {
        this.harnessSize = harnessSize;
    }


    public ExperienceLevelService getExperienceLevelService() {
        return experienceLevelService;
    }

    public void setExperienceLevelService(ExperienceLevelService experienceLevelService) {
        this.experienceLevelService = experienceLevelService;
    }

    public SelectItem[] getExperienceLevelSelectItems() {

        List<ExperienceLevel> experienceLevels = experienceLevelService.getExperienceLevels();
        return JSFUtil.toObjectSelectItemArray(experienceLevels, false);
    }

    public SelectItem[] getPartnerSelectItems() {
        Set<Participation> eventParticipatipants = null;
        if(getParticipation() != null){
            eventParticipatipants = getParticipation().getEvent().getParticipations();
        }
        return JSFUtil.toObjectSelectItemArray(Util.getAsList(eventParticipatipants), true);
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public ParticipationService getParticipationService() {
        return participationService;
    }

    public void setParticipationService(ParticipationService participationService) {
        this.participationService = participationService;
    }

    public Participation getParticipation() {
        if(participation == null){
            Person person = personService.getPerson(JSFUtil.getCurrentUserName());
            Date today = new Date();
            if(person.getParticipations() != null){
                Iterator participationIterator = person.getParticipations().iterator();
                while(participationIterator.hasNext()){
                    Participation part = (Participation)participationIterator.next();
                    if(today.before(part.getEvent().getEndDate())){
                        participation = part;
                        break;
                    }
                }
            }
        }
        return participation;
    }

    public void setParticipation(Participation participation) {
        this.participation = participation;
    }


    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public HtmlSelectOneMenu getExperienceLevel() {
        return experienceLevel;
    }

    public void setExperienceLevel(HtmlSelectOneMenu experienceLevel) {
        this.experienceLevel = experienceLevel;
    }

    public javax.faces.component.html.HtmlSelectOneMenu getPartner() {
        return partner;
    }

    public void setPartner(javax.faces.component.html.HtmlSelectOneMenu partner) {
        this.partner = partner;
    }

    public HtmlInputText getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(HtmlInputText partnerName) {
        this.partnerName = partnerName;
    }

    public HtmlSelectOneMenu getWeight() {
        return weight;
    }

    public void setWeight(HtmlSelectOneMenu weight) {
        this.weight = weight;
    }

    private Logger getLogService(){
        return Logger.getLogger(Instructor.class.getName());
    }
    // </editor-fold>



    public String store(){
        getLogService().log(Level.INFO,"About to update participation profile");
        String returnVal = "success";
        try{
            Participation part = getParticipation();
            part.setLevel((ExperienceLevel)getExperienceLevel().getValue());
            part.setWeight(JSFUtil.getText(getWeight()));
            part.setHarnessSize(JSFUtil.getText(getHarnessSize()));
            Participation partner = null;


            if(getPartner().getValue() != null){
                partner = (Participation)getPartner().getValue();
            }
            String partnerName = "";
            if(partner != null){
                partnerName = partner.getParticipant().getFirstName() + " " + partner.getParticipant().getLastName();
            }else{
                if(getPartnerName().getValue() != null){
                    partnerName = getPartnerName().getValue().toString();
                }
            }
            part.setPartner(partnerName);

            participationService.updateParticipation(part);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update participation", e);
            errorMsg.setValue("Dine profildata ble ikke endret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }   
    

}
