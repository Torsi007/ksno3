/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;
import java.util.HashMap;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.model.SelectItem;
import ksno.model.BeginnerCourse;
import ksno.model.Email;
import ksno.model.Participation;
import ksno.model.Person;
import ksno.model.Text;
import ksno.service.EventService;
import ksno.service.ParticipationService;
import ksno.service.PersonService;
import ksno.service.TextService;
import ksno.util.JSFUtil;
import ksno.util.SendMail;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;
/**
 *
 * @author tor.hauge
 */
public class SignUpSummer {
    private HtmlInputText email;
    private HtmlInputText firstName;    
    private HtmlInputText lastName;
    private HtmlInputText phone;
    private HtmlSelectOneMenu wetSuitSize;    
    private HtmlSelectOneMenu shoeSize;        
    private HtmlSelectOneMenu helmetSize;  
    private HtmlSelectOneMenu coursesSelect;
    private long courseId;
    private EventService eventService;
    private PersonService personService;
    private TextService textService;    
    private ParticipationService participationService;
    private HtmlOutputText errorMsg;
    private HtmlInputTextarea comment;

    public TextService getTextService() {
        return textService;
    }

    public void setTextService(TextService textService) {
        this.textService = textService;
    }
    
    
    
    public HtmlInputTextarea getComment() {
        return comment;
    }

    public void setComment(HtmlInputTextarea comment) {
        this.comment = comment;
    }
    
    
        
    private Logger getLogService(){
      return Logger.getLogger(BeginnerCourseCreate.class.getName());
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public HtmlSelectOneMenu getCoursesSelect() {
        return coursesSelect;
    }

    public void setCoursesSelect(HtmlSelectOneMenu coursesSelect) {
        this.coursesSelect = coursesSelect;
    }

    public ParticipationService getParticipationService() {
        return participationService;
    }

    public void setParticipationService(ParticipationService participationService) {
        this.participationService = participationService;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    public long getCourseId() {
        return courseId;
    }

    public void setCourseId(long courseId) {
        this.courseId = courseId;
    }

    public HtmlInputText getEmail() {
        return email;
    }

    public void setEmail(HtmlInputText email) {
        this.email = email;
    }

    public HtmlInputText getFirstName() {
        return firstName;
    }

    public void setFirstName(HtmlInputText firstName) {
        this.firstName = firstName;
    }

    public HtmlSelectOneMenu getHelmetSize() {
        return helmetSize;
    }

    public void setHelmetSize(HtmlSelectOneMenu helmetSize) {
        this.helmetSize = helmetSize;
    }

    public HtmlInputText getLastName() {
        return lastName;
    }

    public void setLastName(HtmlInputText lastName) {
        this.lastName = lastName;
    }

    public HtmlInputText getPhone() {
        return phone;
    }

    public void setPhone(HtmlInputText phone) {
        this.phone = phone;
    }

    public HtmlSelectOneMenu getShoeSize() {
        return shoeSize;
    }

    public void setShoeSize(HtmlSelectOneMenu shoeSize) {
        this.shoeSize = shoeSize;
    }

    public HtmlSelectOneMenu getWetSuitSize() {
        return wetSuitSize;
    }

    public void setWetSuitSize(HtmlSelectOneMenu wetSuitSize) {
        this.wetSuitSize = wetSuitSize;
    }
    
    public SelectItem[] getCoursesSelectItems() {
        
        List events = eventService.getOpenUpcommingSummerBeginnerCourses();
        return JSFUtil.toSelectItemArray(events);
    }
    
    public String signOn(){
        
        String returnVal = "SignUpConfirmed";
        try{
            Person person = null;
            try{
                person = personService.getPerson(email.getValue().toString());
            }catch (IndexOutOfBoundsException ioobe){
                getLogService().log(Level.INFO,"Could not find person with username " + email.getValue().toString() + " hence creating a new");
            }
            if(person != null){
                getLogService().log(Level.SEVERE,"Unable to sign on participant");
                errorMsg.setValue("Brukeren " + person.getFirstName() + " " + person.getLastName() + " er allerede registrert med mail: " + email.getValue().toString() + ". Kitesurfing.no beklager at vår web løsning ikke håndterer dette, vennligst meld deg på via mail eller telefon (se kontakt detaljer nederst på siden).");            
                returnVal = "no";                
            }else{
                person = new Person();
            }
            person.setUserName(email.getValue().toString());
            person.setFirstName(firstName.getValue().toString());
            person.setLastName(lastName.getValue().toString());
            person.setPhone(Integer.parseInt(phone.getValue().toString()));

            BeginnerCourse course = eventService.getBeginnerCourse(Long.parseLong(coursesSelect.getValue().toString()));

            Participation participation = new Participation();
            participation.setEvent(course);
            boolean wait = (course.getParticipations().size() >= course.getMaxSize())?true:false;
            participation.setOnWaitList(wait);            
            course.getParticipations().add(participation);
            //event.addParticipation(participation);
            person.addParticipation(participation);
            if(comment.getValue() != null){
                participation.setComment(comment.getValue().toString());
            }
            setSummerValues(participation);


            participationService.newParticipation(participation);
            
            HashMap<String, String> hm = new HashMap<String, String>();
            hm.put("course", course.getStartDate().toString() + " - " + course.getEndDate().toString());
            hm.put("name", person.getFirstName() +  " " + person.getLastName());
            if(wait){
                int pos = course.getNumberOfParticipants() - course.getMaxSize();
                hm.put("position", Integer.toString(pos));   
                try{
                    Email mail = textService.getEmail("SignOnWaitSummer");
                    SendMail sendMail = new SendMail(mail.getTos(hm),mail.getCCs(hm), mail.getSubject(hm), mail.getBody(hm));
                    sendMail.send(); 
                }catch(Exception e){
                    getLogService().log(Level.SEVERE,"Participant will be signed on, but mail transport failed", e);
                    participation.appendCommentKSNO("Bekreftelses mail gikk ikke igjennom.");
                }               
                 
            }else{
                try{
                    Email mail = textService.getEmail("SignOnConfirmedSummer");
                    SendMail sendMail = new SendMail(mail.getTos(hm),mail.getCCs(hm), mail.getSubject(hm), mail.getBody(hm));
                    sendMail.send(); 
                }catch(Exception e){
                    getLogService().log(Level.SEVERE,"Participant will be signed on, but mail transport failed", e);
                    participation.appendCommentKSNO("Bekreftelses mail gikk ikke igjennom.");
                }
            }
            
            JSFUtil.getSessionMap().put(JSFUtil.sessionBeanSignedOnEvent, course.getId());

        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to sign on participant", e);
            errorMsg.setValue("Påmeldingen feilet, vennligst forsøk på nytt. Om det fortsatt ikke fungerer, ta kontakt med oss på email eller telefon (kontakt info nederst på siden)");            
            returnVal = "no";
        }
        return returnVal;        
        

        
    }
    

    private void setSummerValues(Participation participation){
        participation.setHelmetSize(helmetSize.getValue().toString());
        participation.setShoeSize(shoeSize.getValue().toString());
        participation.setWetSuitSize(wetSuitSize.getValue().toString());    
    }    

    public String test(){
     return "jall";
    }
    
}