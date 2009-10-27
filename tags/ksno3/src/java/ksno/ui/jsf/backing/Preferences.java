/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.html.HtmlOutputText;
import ksno.model.Person;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputSecret;
import org.apache.myfaces.component.html.ext.HtmlSelectBooleanCheckbox;

/**
 *
 * @author tor.hauge
 */
public class Preferences {
    private PersonService personService;
    private HtmlSelectBooleanCheckbox allowMail;
    private HtmlInputSecret inpPw1;
    private HtmlOutputText errorMsg;
    private HtmlOutputText outTxtPassword;
    private String test;

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }
    

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlInputSecret getInpPw1() {
        return inpPw1;
    }

    public void setInpPw1(HtmlInputSecret inpPw1) {
        this.inpPw1 = inpPw1;
    }    
    
    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }    
    
    
  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  } 
  private Person user;
    
    public Person getUser() {
        if(user == null){
            user = personService.getPerson(JSFUtil.getCurrentUserName());
        }
        return user;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }   
    
    public HtmlSelectBooleanCheckbox getAllowMail() {
        if(allowMail != null){
            allowMail.setValue(getUser().isAllowMail());
            return allowMail;        
        }else{
            return allowMail;
        }

    }

    public void setAllowMail(HtmlSelectBooleanCheckbox allowMail) {
        this.allowMail = allowMail;
    }    
    // </editor-fold>
    
    public String update(){
        String returnvalue = "success";
        try{
            Person person = this.getUser();
            //person.setAllowMail(Boolean.getBoolean(this.getAllowMail().toString()));
            if(inpPw1.getValue() != null && inpPw1.getValue().toString().length() > 5){
                person.setPassWord(inpPw1.getValue().toString());
            }
            personService.updatePerson(person);   
        }catch(Exception ex){
            getLogService().log(Level.SEVERE,"Unable to create article", ex);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + ex.getMessage());
            returnvalue = "nogo";
        }        
        
        try{
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanArticleModify);            
        }catch(Exception ex){
            returnvalue = "nogo";
        }
        return returnvalue;

    }    
}
