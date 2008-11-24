/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import ksno.model.Text;
import ksno.service.TextService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class TextsMaintain {
    TextService textService;
    private HtmlInputText name;
    private UIData data;
    private HtmlOutputText errorMsg;

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }

    public TextService getTextService() {
        return textService;
    }

    public void setTextService(TextService textService) {
        this.textService = textService;
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
    
    public List getTexts(){
        return textService.getTexts();
    }
    
   public String textDelete(){
       String returnVal = "sucess";
        try{
           Text text = (Text)this.getData().getRowData();
           textService.deleteText(text);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete Text", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }   
   
    public String textUpdate(){ 
        
        String returnVal = "success";
        try{
            Text TextModify = (Text)this.getData().getRowData();
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanTextModify, TextModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to select Text", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
       return returnVal; 
    }
}
