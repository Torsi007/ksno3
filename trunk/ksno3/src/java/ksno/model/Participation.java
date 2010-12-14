package ksno.model;

import java.util.Calendar;



public class Participation {

    private Long id;
    private int version;
    private Person participant;
    private Event event;
    private String shoeSize;
    private String helmetSize;
    private String wetSuitSize;
    private int price;   
    private Calendar createdDate;
    private String comment;
    private String commentKSNO;
    boolean onWaitList;
    boolean confirmed;
    boolean uIChecked;
    boolean thirdDay;

    public boolean isThirdDay() {
        return thirdDay;
    }

    public void setThirdDay(boolean thirdDay) {
        this.thirdDay = thirdDay;
    }

    public boolean isuIChecked() {
        return uIChecked;
    }

    public void setuIChecked(boolean uIChecked) {
        this.uIChecked = uIChecked;
    }
 
    public boolean isConfirmed() {
        return confirmed;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

    public String getCommentKSNO() {
        return commentKSNO;
    }

    public void setCommentKSNO(String commentKSNO) {
        this.commentKSNO = commentKSNO;
    }
    
    public void appendCommentKSNO(String comment){
        this.commentKSNO = this.commentKSNO + "\n" + comment;
    }

    public boolean getOnWaitList() {
        return onWaitList;
    }

    public void setOnWaitList(boolean onWaitList) {
        this.onWaitList = onWaitList;
    }
    

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Calendar getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Calendar createdDate) {
        this.createdDate = createdDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }
    
    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public String getHelmetSize() {
        return helmetSize;
    }

    public void setHelmetSize(String helmetSize) {
        this.helmetSize = helmetSize;
    }

    public Person getParticipant() {
        return participant;
    }

    public void setParticipant(Person participant) {
        this.participant = participant;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getShoeSize() {
        return shoeSize;
    }

    public void setShoeSize(String shoeSize) {
        this.shoeSize = shoeSize;
    }

    public String getWetSuitSize() {
        return wetSuitSize;
    }

    public void setWetSuitSize(String wetSuitSize) {
        this.wetSuitSize = wetSuitSize;
    }

    public Participation () {
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Participation other = (Participation) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 41 * hash + (this.id != null ? this.id.hashCode() : 0);
        return hash;
    }





}

