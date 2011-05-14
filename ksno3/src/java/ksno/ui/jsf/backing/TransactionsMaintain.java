/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import ksno.model.Transaction;
import ksno.service.TransactionService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class TransactionsMaintain {
    private TransactionService transactionService;
    private HtmlOutputText errorMsg;
    private UIData data;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }     
    
    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public TransactionService getTransactionService() {
        return transactionService;
    }

    public void setTransactionService(TransactionService transactionService) {
        this.transactionService = transactionService;
    }
    // </editor-fold>
    
    public List getTransactions(){
        List l = null;
        try{
            l = transactionService.getTransactions();
        }catch(Exception e){
            int i = 0;
        }
        return l;
    }  
    
    public String selectEditTransaction(){
        String returnVal = "transactionUpdate";
        try{
            Transaction transactionModify = (Transaction)this.getData().getRowData();
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanTransactionModify, transactionModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to select transaction", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
       return returnVal;
    }
    
   public String transactionDelete(){
       String returnVal = "sucess";
        try{
           Transaction transaction = (Transaction)this.getData().getRowData();
           transactionService.deleteTransaction(transaction);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete transaction", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }       

       return returnVal;
    }

   
    

}
