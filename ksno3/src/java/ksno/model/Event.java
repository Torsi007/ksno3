package ksno.model;

import java.util.Date; 

// <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
// #[regen=yes,id=DCE.254E3AF7-857C-4BC5-588C-36B4ED1C5698]
// </editor-fold> 
public class Event {

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.1B29D68D-CC29-B4DC-9877-B3A8F8FA4D2A]
    // </editor-fold> 
    private int id;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.D5594D09-8401-5BBE-DFC0-88C993FAC6B9]
    // </editor-fold> 
    private int version;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.780EBB8A-8C16-D5B8-61B3-7A6C7741E542]
    // </editor-fold> 
    private Date startDate;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.E54B1F64-648C-A12B-8746-25D3DA768554]
    // </editor-fold> 
    private Date endDate;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.9BE10A03-ABC2-E968-2893-6D3D71F91F52]
    // </editor-fold> 
    private String comment;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.47AFC16E-17CC-A5DD-661F-183C4AEF4F73]
    // </editor-fold> 
    public Event () {
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.A881047D-7B49-034D-7F3E-901FA381DCBB]
    // </editor-fold> 
    public String getComment () {
        return comment;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.254A8D47-E036-07C7-1801-B10FCB95B718]
    // </editor-fold> 
    public void setComment (String val) {
        this.comment = val;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.E5592D8D-41DE-050F-C4A6-3819AF5C2F1C]
    // </editor-fold> 
    public Date getEndDate () {
        return endDate;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.B09E92F5-816D-DD23-43CA-C70BB3B50ABE]
    // </editor-fold> 
    public void setEndDate (Date val) {
        this.endDate = val;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.09C584B1-B1FD-091C-A98A-BF354E691FB8]
    // </editor-fold> 
    public int getId () {
        return id;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.B2AF8A77-92E4-0895-6D93-3E82AE1D2FFA]
    // </editor-fold> 
    public void setId (int val) {
        this.id = val;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.B4548EE9-FC40-176B-94F0-539EE88F7459]
    // </editor-fold> 
    public Date getStartDate () {
        return startDate;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.B8E7BD7F-1C03-8F43-4444-8A14D936FAB0]
    // </editor-fold> 
    public void setStartDate (Date val) {
        this.startDate = val;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.3BF1BF4C-C77D-63A2-A888-9F0A557299CC]
    // </editor-fold> 
    public int getVersion () {
        return version;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.135ED2EC-D05C-06C8-478A-F00BE9BE6B5B]
    // </editor-fold> 
    public void setVersion (int val) {
        this.version = val;
    }

}

