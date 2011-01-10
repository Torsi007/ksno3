package ksno.model;

import java.util.Date; 
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Event implements LabelValuePair, LabelObjectValuePair {

    protected Long id;
    private String prettyPrintId;
    protected int version;
    protected Date startDate;
    protected Date endDate;
    protected String comment;
    protected String location;
    protected String name;
    private boolean open;
    private Instructor instructor;
    private Set instructions = new HashSet();
    private Set<Participation> participations = new HashSet<Participation>();

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public String getPrettyPrintId() {
        return prettyPrintId;
    }

    public void setPrettyPrintId(String prettyPrintId) {
        this.prettyPrintId = prettyPrintId;
    }



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
        return this.getInstructor();
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
    
    public Set<Participation> getParticipations() {
        return participations;
    }

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

    public List getConfirmedParticipations() {
        getLogService().log(Level.INFO, "Start getting confirmed participations");
        Iterator <Participation> participationIterator = participations.iterator();
        List<Participation> returnList = new LinkedList<Participation>();
        while(participationIterator.hasNext()){
            Participation participation = participationIterator.next();
            if(participation.isConfirmed()){
                returnList.add(participation);
            }
        }
        getLogService().log(Level.INFO, "Return " + returnList.size() + " confirmed participations");
        return returnList;
    }

    public List getUnConfirmedParticipations() {
        getLogService().log(Level.INFO, "Start getting unconfirmed participations");
        Iterator <Participation> participationIterator = participations.iterator();
        List<Participation> returnList = new LinkedList<Participation>();
        while(participationIterator.hasNext()){
            Participation participation = participationIterator.next();
            if(!participation.isConfirmed()){
                returnList.add(participation);
            }
        }
        getLogService().log(Level.INFO, "Return " + returnList.size() + " unconfirmed participations");
        return returnList;
    }

    public int getNumberOfUnConfirmedParticipations(){
        List list = this.getUnConfirmedParticipations();
        if(list != null){
            return list.size();
        }else{
            return 0;
        }
    }


    public void setParticipations(Set<Participation> participations) {
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
        getLogService().log(Level.INFO, "Start method  addParticipation.");
        if(participation == null){
            throw new IllegalArgumentException("Participation to be added is null");
        }
        if(participation.getEvent() != null){
            participation.getEvent().getParticipations().remove(participation);
        }
        if(this.containParticipation(participation)){
            getLogService().log(Level.WARNING, "Ended addPartipation, not able to add participant: " + participation.getParticipant().getFirstName() + " " + participation.getParticipant().getLastName() + " because the person was already participating");
        }else{
            participation.setEvent(this);
            if(participations.add(participation)){
                getLogService().log(Level.INFO, "Ended addPartipation, added participant: " + participation.getParticipant().getFirstName() + " " + participation.getParticipant().getLastName());
            }else{
                getLogService().log(Level.WARNING, "Ended addPartipation, not able to add participant: " + participation.getParticipant().getFirstName() + " " + participation.getParticipant().getLastName() + " because the person was already participating");
            }

        }
    }

    public void addParticipations(Set<Participation> participations){
        getLogService().log(Level.INFO, "About to add " + participations.size() + " participations to event: " + this.getStartDate());
        for (Participation participation : participations){
            this.addParticipation(participation);
        }
    }

    public void removeParticipation(Participation participation){
        if(participation == null){
            throw new IllegalArgumentException("Participation to be removed is null");
        }
        boolean replace = false;
        HashSet<Participation> replaceHS = new HashSet<Participation>();
        if(participation.getEvent() != null){
            if(!getParticipations().remove(participation)){
                for(Participation p : getParticipations()){
                    if(p.equals(participation)){
                        replace=true;
                    }else{
                        replaceHS.add(p);
                    }
                }
                if(replace){
                    getParticipations().clear();
                    getParticipations().addAll(replaceHS);
                }
            }
            
        }
    }

    public void removeParticipations(Set<Participation> participations){
        if(participations == null){
            throw new IllegalArgumentException("Participation to be removed is null");
        }
        for(Participation part : participations){
            removeParticipation(part);
        }
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

    public Object getObject() {
        return this;
    }

    private boolean containParticipation(Participation participation) {
        Person participant = participation.getParticipant();
        boolean returnVal = false;
        if(participant != null){
            for(Participation prt : this.participations){
                if(participant.equals(prt.getParticipant())){
                    returnVal = true;
                    break;
                }
            }
        }
        return returnVal;
    }

}

