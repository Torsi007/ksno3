/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import ksno.util.KSNOutil;

/**
 *
 * @author tor.hauge
 */
public class Email extends Text {
    private String toRecipients;
    private String ccRecipients;

    public String getCcRecipients() {
        return ccRecipients;
    }
    
    public String getCcRecipients(HashMap<String, String> hm) {
        return KSNOutil.injectPlaceHolders(this.getCcRecipients(), hm);
    }    

    public void setCcRecipients(String ccRecipients) {
        this.ccRecipients = ccRecipients;
    }

    public String getToRecipients(HashMap<String, String> hm) {
        return KSNOutil.injectPlaceHolders(this.getToRecipients(), hm);
    }
    
    public String getToRecipients() {
        return toRecipients;
    }    

    public void setToRecipients(String toRecipients) {
        this.toRecipients = toRecipients;
    }
    
    public String[] getCCs(HashMap<String, String> hm){
        String replaced = this.getCcRecipients(hm);
        if(replaced != null && !"".equals(replaced)){
            return replaced.split(",");
        }else{
            return null;
        }
    }
    
    public String[] getTos(HashMap<String, String> hm){
        String replaced = this.getToRecipients(hm);
        if(replaced != null && !"".equals(replaced)){
            return replaced.split(",");
        }else{
            return null;
        }
    }     

}
