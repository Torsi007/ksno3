/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.model.SelectItem;
import ksno.model.Image;
import ksno.model.Person;
import ksno.model.Transaction;
import ksno.service.DocumentService;
import ksno.service.ImageService;
import ksno.service.PersonService;
import ksno.service.TransactionService;

import ksno.util.ImageMeta;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author tor.hauge
 */
public class TransactionCreate {
    private HtmlInputText comment;
    private HtmlInputText date;    
    private HtmlInputText amount;      
    private HtmlSelectOneMenu category;
    private HtmlSelectOneMenu customerSelect;    
    private HtmlOutputText upAttachmentResult;
    private HtmlOutputText errorMsg;   
    private UploadedFile upAttachment;
    private TransactionService transactionService;
    private PersonService personService;
    private ImageService imageService;
    private DocumentService documentService;
    
    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlSelectOneMenu getCustomerSelect() {
        return customerSelect;
    }

    public void setCustomerSelect(HtmlSelectOneMenu customerSelect) {
        this.customerSelect = customerSelect;
    }
    
    public DocumentService getDocumentService() {
        return documentService;
    }

    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }
    
    public HtmlInputText getAmount() {
        return amount;
    }

    public void setAmount(HtmlInputText amount) {
        this.amount = amount;
    }

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    public UploadedFile getUpAttachment() {
        return upAttachment;
    }

    public void setUpAttachment(UploadedFile upAttachment) {
        this.upAttachment = upAttachment;
    }

    public HtmlOutputText getUpAttachmentResult() {
        return upAttachmentResult;
    }

    public void setUpAttachmentResult(HtmlOutputText upAttachmentResult) {
        this.upAttachmentResult = upAttachmentResult;
    }    

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }    

    public HtmlInputText getDate() {
        return date;
    }

    public void setDate(HtmlInputText date) {
        this.date = date;
    }    
    
    public HtmlSelectOneMenu getCategory() {
        return category;
    }

    public void setCategory(HtmlSelectOneMenu category) {
        this.category = category;
    }

    public HtmlInputText getComment() {
        return comment;
    }

    public void setComment(HtmlInputText comment) {
        this.comment = comment;
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
    
  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }    
    
    // </editor-fold>
  
    public SelectItem[] getCustomers(){
        List persons = personService.getPersons();
        return JSFUtil.toSelectItemArray(persons, true);        
    }   
    
    public String createTransaction(){
        String returnVal = "success";
        try{
            Transaction transaction = new Transaction();
            transaction.setComment(comment.getValue().toString());
            transaction.setCategory(category.getValue().toString());
            transaction.setDate((Calendar)date.getValue());
            transaction.setAmount(Double.parseDouble(amount.getValue().toString()));
            String userName = JSFUtil.getRequest().getUserPrincipal().getName();
            Person currentUser = personService.getPerson(userName);
            transaction.setOwner(currentUser);
            
            HashMap<ImageMeta,String> imageSize = imageService.uploadImage(upAttachment.getInputStream(), userName);
            Image image = new Image();
            image.setOwner(currentUser);
            image.setName(imageSize.get(ImageMeta.sizeMAX));
            image.setUrl(imageSize.get(ImageMeta.url));
            
            transaction.setImage(image);
            transactionService.newTransaction(transaction);
            
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create transaction", e);
            errorMsg.setValue("Transaksjonen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());            
            returnVal = "no";
        }
        return returnVal;
    }     

}
