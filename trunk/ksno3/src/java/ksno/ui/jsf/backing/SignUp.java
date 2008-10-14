/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Date;
import java.util.List;

import javax.faces.model.SelectItem;
import ksno.model.Event;
import ksno.model.Participation;
import ksno.model.Person;
import ksno.service.EventService;
import ksno.service.ParticipationService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputSecret;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;

/**
 *
 * @author halsnehauge
 */
public class SignUp {
    private HtmlInputText email;
    private HtmlInputText firstName;    
    private HtmlInputText lastName;
    private HtmlInputText phone;
    private HtmlInputText dob;    
    private HtmlSelectOneMenu wetSuitSize;    
    private HtmlSelectOneMenu shoeSize;        
    private HtmlSelectOneMenu helmetSize;  
    private HtmlInputSecret password;      
    private long courseId;
    private EventService eventService;
    private PersonService personService;
    private ParticipationService participationService;

    public ParticipationService getParticipationService() {
        return participationService;
    }

    public void setParticipationService(ParticipationService participationService) {
        this.participationService = participationService;
    }

    public HtmlInputText getDob() {
        return dob;
    }

    public void setDob(HtmlInputText dob) {
        this.dob = dob;
    }
    
    

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public HtmlInputSecret getPassword() {
        return password;
    }

    public void setPassword(HtmlInputSecret password) {
        this.password = password;
    }

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }
    //private SelectItem[] coursesSelectItems;

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
        List events = eventService.getEvents();
        return JSFUtil.toSelectItemArray(events);
    }
    
    public String signOn(){
        Person person = new Person();
        person.setUserName(email.getValue().toString());
        person.setFirstName(firstName.getValue().toString());
        person.setLastName(lastName.getValue().toString());
        person.setDateOfBirth((Date)dob.getValue());
        person.setPhone(Integer.parseInt(phone.getValue().toString()));
        person.setPassWord(password.getValue().toString());
        
        Event event = eventService.getEvent(courseId);
        
        Participation participation = new Participation();
        event.addParticipation(participation);
        person.addParticipation(participation);
        participation.setHelmetSize(helmetSize.getValue().toString());
        participation.setShoeSize(Integer.parseInt(shoeSize.getValue().toString()));
        participation.setWetSuitSize(wetSuitSize.getValue().toString());
        
        participationService.newParticipation(participation);
        return "Jall";
        
    }


    
}
