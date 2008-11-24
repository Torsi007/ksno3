/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;
import java.util.Properties;

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

/**
 *
 * @author tor.hauge
 */
public class SendMail {

    private String to;
    private String subject;
    private String text;

    public SendMail(String to, String subject, String text){
        this.to = to;
        this.subject = subject;
        this.text = text;
    }
        
    SecurityManager security = System.getSecurityManager();
	
    public void send(){
        Properties props = new Properties();
        props.put("mail.smtp.user", "kitesurfing1");                
        props.put("mail.smtp.host", "smtp.domeneshop.no");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable","true");                
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.fallback", "false");                
                
        Authenticator auth = new SMTPAuthenticator(); 
               
        Session session = Session.getInstance(props, auth);
            //session.setDebug(true);
 

	Message simpleMessage = new MimeMessage(session);
		
        InternetAddress fromAddress = null;
        InternetAddress toAddress = null;
        try {
            fromAddress = new InternetAddress("info@kitesurfing.no");
            toAddress = new InternetAddress(to);
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        try {
            simpleMessage.setFrom(fromAddress);
            simpleMessage.setRecipient(RecipientType.TO, toAddress);
            simpleMessage.setSubject(subject);
            simpleMessage.setText(text);
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
            return new PasswordAuthentication("kitesurfing1", "CrossB0w");
        }
    }
}
