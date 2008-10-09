package ksno.model;


// <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
// #[regen=yes,id=DCE.7E7D1381-6E06-5EF3-0E09-216860045C09]
// </editor-fold> 
public class Address {

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.1BC1C5C4-616A-6714-E338-9FCA1D08C6C1]
    // </editor-fold> 
    private String street;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.7F9FBF90-3277-19E1-9CA8-ABC94C5D2826]
    // </editor-fold> 
    private int zipCode;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.993FD05F-B0E5-0CBC-4B9C-69324F037297]
    // </editor-fold> 
    private String city;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.5149879F-9E3A-41AD-5A3C-3C6048C38B46]
    // </editor-fold> 
    public Address () {
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.32581DC9-A611-B7D6-AE22-64EDE5470589]
    // </editor-fold> 
    public String getCity () {
        return city;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.F8DAC1CB-C5C5-3DB3-E400-6260AC69997C]
    // </editor-fold> 
    public void setCity (String val) {
        this.city = val;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.35E47DD5-1A6F-E38B-D26F-2E6B456400A8]
    // </editor-fold> 
    public String getStreet () {
        return street;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.1DE1BCD1-8206-F414-CB0B-0B0A6964627E]
    // </editor-fold> 
    public void setStreet (String val) {
        this.street = val;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.1C9E0C35-16B6-BA48-EC01-DF6DF9A2FACD]
    // </editor-fold> 
    public int getZipCode () {
        return zipCode;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.2AD6703F-3A98-4D5D-BC90-10F48BA3E844]
    // </editor-fold> 
    public void setZipCode (int val) {
        this.zipCode = val;
    }

}

