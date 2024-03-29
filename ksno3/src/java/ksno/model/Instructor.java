package ksno.model;

import java.util.HashSet;
import java.util.Set;

public class Instructor extends Person implements LabelValuePair{

    private String accountNumber;
    public Set events = new HashSet();
    public Set instructions = new HashSet();
    public ksno.model.Text aboutMe;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters"> 
    public Text getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(Text aboutMe) {
        if(this.getAboutMe() == null){
            this.aboutMe = aboutMe;
        }else{
            this.aboutMe.setBody(aboutMe.getBody());
            this.aboutMe.setLastUpdatedDate(aboutMe.getLastUpdatedDate());
            this.aboutMe.setSubject(aboutMe.getSubject());
        }
        
    }

    public Set getInstructions() {
        return instructions;
    }

    public void setInstructions(Set instructions) {
        this.instructions = instructions;
    }

    public Set getEvents() {
        return events;
    }
    
    public void setEvents(Set events) {
        this.events = events;
    }

    public Instructor () {
    }

    public String getAccountNumber () {
        return accountNumber;
    }

    public void setAccountNumber (String val) {
        this.accountNumber = val;
    }
    // </editor-fold>    
    
    public void addInstruction(Instruction instruction){
        if(instruction == null){
            throw new IllegalArgumentException("Instruction to be added is null");
        }
        if(instruction.getInstructor() != null){
            instruction.getInstructor().getInstructions().remove(instruction);
        }
        instruction.setInstructor(this);
        instructions.add(instruction);
    }    

}

