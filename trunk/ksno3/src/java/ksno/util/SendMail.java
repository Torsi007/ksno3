/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

/**
 *
 * @author tor.hauge
 */
public class SendMail {

    private String subject;
    private String text;
    private String [] tos;
    private String [] ccs;

    public SendMail(String to, String subject, String text){
        this.tos = new String[1];
        this.tos[0] = to;
        this.subject = subject;
        this.text = text;
    }
    
    public SendMail(String to, String cc, String subject, String text){
        this.tos = new String[1];
        this.tos[0] = to;
        this.ccs = new String[1];
        this.ccs[0] = cc;        
        this.subject = subject;
        this.text = text;
    }    
    
    public SendMail(String[] tos, String[] ccs, String subject, String text){
        this.tos = tos;
        this.ccs = ccs;        
        this.subject = subject;
        this.text = text;
    }
        
    SecurityManager security = System.getSecurityManager();
	
    public void send(){
        Authenticator auth = new SMTPAuthenticator(); 
        Session session = Session.getInstance(getProps(), auth);
	Message simpleMessage = new MimeMessage(session);
		
        InternetAddress fromAddress = getFromAdress();
        InternetAddress[] toAddresses = getToAdresses();
        InternetAddress[] ccAddresses = getCCAdresses();        

        try {
            simpleMessage.setFrom(fromAddress);
            simpleMessage.setRecipients(RecipientType.TO, toAddresses);
            if(ccAddresses != null){
                simpleMessage.setRecipients(RecipientType.CC, ccAddresses);
            }
            simpleMessage.setSubject(this.subject);                
            simpleMessage.setText(this.text);
            Transport.send(simpleMessage);			
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
              e.printStackTrace();
        }		
    }
        
    private class SMTPAuthenticator extends javax.mail.Authenticator
    {
        public PasswordAuthentication getPasswordAuthentication()
        {
            return new PasswordAuthentication("kitesurfing1", "Sw1tchBlade");
        }
    }
    
    
    private InternetAddress getFromAdress(){
        InternetAddress fromAddress = null;
        try {
            fromAddress = new InternetAddress("info@kitesurfing.no");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }   
        return fromAddress;
    }
    
    private InternetAddress[] getToAdresses(){
        InternetAddress[] adresses = new InternetAddress[this.tos.length];
        if(this.tos != null){
            for(int i = 0; i<this.tos.length; i++){
                try {
                    adresses[i] = new InternetAddress(this.tos[i]);
                }catch (AddressException e) {
                    e.printStackTrace();
                }   
            }
            return adresses;        
        }else{
            return null;
        }

    }    
    
    private InternetAddress[] getCCAdresses(){
        InternetAddress[] adresses = new InternetAddress[this.ccs.length];
        if(this.ccs != null){
            for(int i = 0; i<this.ccs.length; i++){
                try {
                    adresses[i] = new InternetAddress(this.ccs[i]);
                }catch (AddressException e) {
                    e.printStackTrace();
                }   
            }
            return adresses;        
        }else{
            return null;
        }
    }     
    
    private Properties getProps(){
        Properties props = new Properties();
        props.put("mail.smtp.user", "kitesurfing1");                
        props.put("mail.smtp.host", "smtp.domeneshop.no");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable","true");                
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.fallback", "false");  
        return props;
    }    
}
