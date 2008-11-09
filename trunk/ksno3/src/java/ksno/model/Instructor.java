package ksno.model;

import java.util.HashSet;
import java.util.Set;

public class Instructor extends Person implements LabelValuePair{

    private int accountNumber;
    public Set events = new HashSet();

    public Set getEvents() {
        return events;
    }
    
    

    public void setEvents(Set events) {
        this.events = events;
    }

    public Instructor () {
    }

    public int getAccountNumber () {
        return accountNumber;
    }

    public void setAccountNumber (int val) {
        this.accountNumber = val;
    }
    
    public void addEvent(Event event){
        if(event == null){
            throw new IllegalArgumentException("Image to be added is null");
        }
        if(event.getResponsible() != null){
            event.getResponsible().getEvents().remove(event);
        }
        event.setResponsible(this);
        events.add(event);
    }    
}

