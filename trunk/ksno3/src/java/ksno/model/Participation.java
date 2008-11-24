package ksno.model;

import java.util.Date;



public class Participation {

    private Long id;
    private int version;
    private Person participant;
    private Event event;
    private int shoeSize;
    private String helmetSize;
    private String wetSuitSize;
    private int price;   
    private Date createdDate;
    private String comment;
    boolean onWaitList;

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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
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
        if (this.shoeSize != other.shoeSize) {
            return false;
        }
        if (this.helmetSize != other.helmetSize && (this.helmetSize == null || !this.helmetSize.equals(other.helmetSize))) {
            return false;
        }
        if (this.wetSuitSize != other.wetSuitSize && (this.wetSuitSize == null || !this.wetSuitSize.equals(other.wetSuitSize))) {
            return false;
        }
        if (this.price != other.price) {
            return false;
        }
        if (this.comment != other.comment && (this.comment == null || !this.comment.equals(other.comment))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 23 * hash + (this.id != null ? this.id.hashCode() : 0);
        hash = 23 * hash + this.shoeSize;
        hash = 23 * hash + (this.helmetSize != null ? this.helmetSize.hashCode() : 0);
        hash = 23 * hash + (this.wetSuitSize != null ? this.wetSuitSize.hashCode() : 0);
        hash = 23 * hash + (this.comment != null ? this.comment.hashCode() : 0);
        return hash;
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

    public int getShoeSize() {
        return shoeSize;
    }

    public void setShoeSize(int shoeSize) {
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



}

