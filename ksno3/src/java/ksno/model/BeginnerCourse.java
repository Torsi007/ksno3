package ksno.model;
// #[regen=yes,id=DCE.6D2EE5E4-0D10-EEBA-52E0-C05885F5E3E1]
// </editor-fold> 
public class BeginnerCourse extends Event {




    private int maxSize;
    
    // <editor-fold defaultstate="collapsed" desc=" Getters and setters">     

    public int getMaxSize() {
        return maxSize;
    }

    public void setMaxSize(int maxSize) {
        this.maxSize = maxSize;
    }

    public int getAvailableSeats(){
        return getMaxSize() - getNumberOfParticipants();
    }
    // </editor-fold> 

    // <editor-fold defaultstate="collapsed" desc=" Constructors "> 


    public BeginnerCourse () {
        this.setName("Nybegynnerkurs");
    }
        // </editor-fold> 


}

