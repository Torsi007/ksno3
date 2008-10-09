package ksno.model;



public class Participation {

    private Long id;
    private int version;
    private Person participant;
    private Event event;
    private int shoeSize;
    private String helmetSize;
    private String wetSuitSize;
    private int price;

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

