/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import ksno.model.ExperienceLevel;
import ksno.service.ExperienceLevelService;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class ExperienceLevelsMaintain {
    ExperienceLevelService experienceLevelService;
    private HtmlInputText newName;
    private HtmlInputText newRank;
    private UIData data;
    private HtmlOutputText errorMsg;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public ExperienceLevelService getExperienceLevelService() {
        return experienceLevelService;
    }

    public void setExperienceLevelService(ExperienceLevelService experienceLevelService) {
        this.experienceLevelService = experienceLevelService;
    }

    public HtmlInputText getNewName() {
        return newName;
    }

    public void setNewName(HtmlInputText newName) {
        this.newName = newName;
    }

    public HtmlInputText getNewRank() {
        return newRank;
    }

    public void setNewRank(HtmlInputText newRank) {
        this.newRank = newRank;
    }
    
    private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
    }   
    // </editor-fold>
    
    public List getExperienceLevels(){
        return experienceLevelService.getExperienceLevels();
    }

   public String ExperienceLevelDelete(){
       String returnVal = "sucess";
        try{
           ExperienceLevel experienceLevel = (ExperienceLevel)this.getData().getRowData();
           experienceLevelService.deleteExperienceLevel(experienceLevel);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }

       return returnVal;
    }

    public String ExperienceLevelCreate(){
        String returnVal = "success";
        try{
            ExperienceLevel experienceLevel = new ExperienceLevel();
            experienceLevel.setName(getNewName().getValue().toString());
            experienceLevel.setRank(Integer.parseInt(getNewRank().getValue().toString()));
            experienceLevelService.newExperienceLevel(experienceLevel);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create experience level", e);
            errorMsg.setValue("Nivået ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

   public String ExperienceLevelsUpdate(){
       String returnVal = "sucess";
        try{
            List experienceLevels = (List)getData().getValue();
            for(int i = 0; i< experienceLevels.size(); i++){
                ExperienceLevel experienceLevel = (ExperienceLevel)experienceLevels.get(i);
                experienceLevelService.updateExperienceLevel(experienceLevel);
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update experience levels", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
       return returnVal;
    }   
   

}
