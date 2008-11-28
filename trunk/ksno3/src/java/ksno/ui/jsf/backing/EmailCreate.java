/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Email;
import ksno.model.Person;
import ksno.service.PersonService;
import ksno.service.TextService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class EmailCreate {
    
    private HtmlInputText name;
    private HtmlInputText subject;
    private HtmlInputText toRecipients;
    private HtmlInputText ccRecipients;    
    private HtmlInputTextarea body;    
    private HtmlOutputText errorMsg;
    private TextService textService;
    private PersonService personService;

    public HtmlInputText getCcRecipients() {
        return ccRecipients;
    }

    public void setCcRecipients(HtmlInputText ccRecipients) {
        this.ccRecipients = ccRecipients;
    }

    public HtmlInputText getToRecipients() {
        return toRecipients;
    }

    public void setToRecipients(HtmlInputText toRecipients) {
        this.toRecipients = toRecipients;
    }

    
    
    public HtmlInputTextarea getBody() {
        return body;
    }

    public void setBody(HtmlInputTextarea body) {
        this.body = body;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public HtmlInputText getSubject() {
        return subject;
    }

    public void setSubject(HtmlInputText subject) {
        this.subject = subject;
    }

    public TextService getTextService() {
        return textService;
    }

    public void setTextService(TextService textService) {
        this.textService = textService;
    }
    
    private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
    }    
    
    public String createEmail(){
        String returnVal = "success";
        try{
            Email email = new Email();
            email.setName(name.getValue().toString());
            email.setSubject(subject.getValue().toString());
            email.setBody(body.getValue().toString());
            email.setToRecipients(toRecipients.getValue().toString());
            if(ccRecipients.getValue() != null){
                email.setCcRecipients(ccRecipients.getValue().toString());
            }
            
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            
            email.setAuthor(currentUser);
            
            textService.newText(email);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create text", e);
            errorMsg.setValue("Teksten ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
        return returnVal;
    }     

}
