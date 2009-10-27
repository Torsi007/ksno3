/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Email;
import ksno.service.TextService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class EmailUpdate {
    private HtmlOutputText errorMsg;
    private TextService textService;

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
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
      
    public String update(){
 
        String returnVal = "success";
        try{
            Email email = (Email)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanTextModify);
            textService.updateText(email);
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanTextModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update event", e);
            returnVal = "no";
        }
        return returnVal;
    }       

}