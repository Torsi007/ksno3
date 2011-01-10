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
import javax.faces.model.SelectItem;
import ksno.model.Event;
import ksno.model.Instructor;
import ksno.model.OnDuty;
import ksno.service.EventService;
import ksno.service.OnDutyService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;
/**
 *
 * @author HalsneHauge
 */
public class OnDutysMaintain {
    private HtmlInputText txtStartDate;

    public HtmlInputText getTxtStartDate() {
        return txtStartDate;
    }

    public void setTxtStartDate(HtmlInputText txtStartDate) {
        this.txtStartDate = txtStartDate;
    }
    private HtmlSelectOneMenu slctOneInstructor;

    public HtmlSelectOneMenu getSlctOneInstructor() {
        return slctOneInstructor;
    }

    public void setSlctOneInstructor(HtmlSelectOneMenu slctOneInstructor) {
        this.slctOneInstructor = slctOneInstructor;
    }
    OnDutyService onDutyService;
    PersonService personService;

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }
    private HtmlOutputText errorMsg;
    private Instructor instructor;

    public SelectItem[] getInstructorObjectSelectItems() {
        List instructors = personService.getInstructors();
        return JSFUtil.toObjectSelectItemArray(instructors);
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public OnDutyService getOnDutyService() {
        return onDutyService;
    }

  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }

    public void setOnDutyService(OnDutyService onDutyService) {
        this.onDutyService = onDutyService;
    }
    private UIData data;

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public List getOnDutys(){
        return onDutyService.getOnDutys();
    }

   public String onDutyDelete(){
       String returnVal = "sucess";
        try{
            OnDuty onDuty = (OnDuty)this.getData().getRowData();
            getOnDutyService().deleteOnDuty(onDuty);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete ondutry", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }

       return returnVal;
    }

   public String onDutyCreate(){
       String returnVal = "sucess";
        try{
            OnDuty onDuty = new OnDuty();
            onDuty.setFromDate((Calendar)getTxtStartDate().getValue());
            Instructor onDutyInstructor = (Instructor)getSlctOneInstructor().getValue();

            onDuty.setInstructor(onDutyInstructor);
            getOnDutyService().newOnDuty(onDuty);

        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create ondutry", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
       return returnVal;
    }

   public Instructor getCurrenltyOnDuty(){
    return onDutyService.getCurrentlyOnDuty().getInstructor();
   }


}
