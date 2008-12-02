/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.Image;
import ksno.model.Transaction;
import ksno.service.ImageService;
import ksno.service.TransactionService;
import ksno.util.ImageSize;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author tor.hauge
 */
public class TransactionUpdate {
    private HtmlOutputText errorMsg;
    private HtmlOutputText upAttachmentResult;
    private UploadedFile upAttachment;
    private TransactionService transactionService;
    private ImageService imageService;
    
    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
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


      
    public String update(){
 
        String returnVal = "success";
        try{
            Transaction transaction = (Transaction)JSFUtil.getSessionMap().get(JSFUtil.sessionBeanTransactionModify);
            if(upAttachment != null){
                HashMap<ImageSize,String> imageSize = imageService.uploadImage(upAttachment.getInputStream(), JSFUtil.getRequest().getUserPrincipal().getName());
                Image image = new Image();
                image.setOwner(transaction.getOwner());
                image.setName(imageSize.get(ImageSize.MAX));
                transaction.setImage(image);
            }            
            
            transactionService.updateTransaction(transaction);
            JSFUtil.getSessionMap().remove(JSFUtil.sessionBeanTransactionModify);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update transaction", e);
            returnVal = "no";
        }
        return returnVal;
    }           

}
