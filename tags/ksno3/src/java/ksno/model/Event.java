package ksno.model;

import java.util.ArrayList;
import java.util.Date; 
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class Event implements LabelValuePair {

    protected Long id;
    protected int version;
    protected Date startDate;
    protected Date endDate;
    protected String comment;
    protected String location;
    protected String name;
    private boolean open;
    private Set instructions = new HashSet();
    private Set participations = new HashSet();

    // <editor-fold  desc=" Getters and Setters "> 
    public Instructor[] getInstructors(){
        Instructor[] list = new Instructor[instructions.size()];
        Iterator it = instructions.iterator();
        int i = 0;
        while (it.hasNext()){
            Instruction instruction = (Instruction)it.next();
            list[i] = instruction.getInstructor();
            i++;
        }
        return list;
    }   
    
    public void setInstructors(Instructor[] instructors){
        for(int i = 0; i< instructors.length; i++){
            Instructor instructor = instructors[i];
            Instruction instruction = new Instruction();
            instructor.addInstruction(instruction);  
            addInstruction(instruction);
            
        }
    }

    public Instructor getCourseResponsible(){
        return this.getInstructors()[0];
    }
    
    
    public String getInstructorsCSV(){
        String returnVal = "";
        Iterator it = instructions.iterator();
        while (it.hasNext()){
            Instruction instruction = (Instruction)it.next();
            returnVal += instruction.getInstructor().getFirstName();
            returnVal += ",";
        }
        return returnVal;
    }
    
    public Set getInstructions() {
        return instructions;
    }

    public void setInstructions(Set instructions) {
        this.instructions = instructions;
    }    
    
    public Set getParticipations() {
        return participations;
    }

    public void setParticipations(Set participations) {
        this.participations = participations;
    }     
    
    
    public Set getResponsible() {
        return instructions;
    }

    public void setResponsible(Set instructions) {
        this.instructions = instructions;
    }
    
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }    

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public int getNumberOfParticipants(){
        return getParticipations().size();
    }
    
    public String getComment () {
        return comment;
    }


    public void setComment (String val) {
        this.comment = val;
    }


    public Date getEndDate () {
        return endDate;
    }


    public void setEndDate (Date val) {
        this.endDate = val;
    }


    public Long getId () {
        return id;
    }


    public void setId (Long val) {
        this.id = val;
    }

    public Date getStartDate () {
        return startDate;
    }


    public void setStartDate (Date val) {
        this.startDate = val;
    }


    public int getVersion () {
        return version;
    }


    public void setVersion (int val) {
        this.version = val;
    }


    // </editor-fold>    
    
    // <editor-fold  desc=" Equals and HashCode ">     
    
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Event other = (Event) obj;
        if (this.startDate != other.startDate && (this.startDate == null || !this.startDate.equals(other.startDate))) {
            return false;
        }
        if (this.endDate != other.endDate && (this.endDate == null || !this.endDate.equals(other.endDate))) {
            return false;
        }
        if (this.comment != other.comment && (this.comment == null || !this.comment.equals(other.comment))) {
            return false;
        }
        if (this.location != other.location && (this.location == null || !this.location.equals(other.location))) {
            return false;
        }
        if (this.name != other.name && (this.name == null || !this.name.equals(other.name))) {
            return false;
        }
        if (this.open != other.open) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + (this.startDate != null ? this.startDate.hashCode() : 0);
        hash = 71 * hash + (this.endDate != null ? this.endDate.hashCode() : 0);
        hash = 71 * hash + (this.comment != null ? this.comment.hashCode() : 0);
        hash = 71 * hash + (this.location != null ? this.location.hashCode() : 0);
        hash = 71 * hash + (this.name != null ? this.name.hashCode() : 0);
        hash = 71 * hash + (this.open ? 1 : 0);
        return hash;
    }   
   // </editor-fold>    
     
    public void addParticipation(Participation participation){
        if(participation == null){
            throw new IllegalArgumentException("Participation to be added is null");
        }
        if(participation.getEvent() != null){
            participation.getEvent().getParticipations().remove(participation);
        }
        participation.setEvent(this);
        participations.add(participation);
    }
    
    public void addInstruction(Instruction instruction){
        if(instruction == null){
            throw new IllegalArgumentException("Instruction to be added is null");
        }
        if(instruction.getEvent() != null){
            instruction.getEvent().getInstructions().remove(instruction);
        }
        instruction.setEvent(this);
        instructions.add(instruction);
    }    

    // <editor-fold defaultstate="collapsed" desc=" Constructors "> 

    public Event () {
    }
    // </editor-fold> 

    public String getLabel() {
        return startDate.toString() + " - " + endDate.toString();
    }

    public String getValue() {
        return Long.toString(id);
    }

}

