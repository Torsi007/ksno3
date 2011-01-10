/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import javax.faces.component.html.HtmlSelectOneMenu;
import javax.faces.model.SelectItem;
import ksno.model.WorkCategory;
import ksno.model.WorkTask;
import ksno.service.WorkCategoryService;
import ksno.service.WorkTaskService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class WorkTasksMaintain {
    WorkTaskService workTaskService;
    WorkCategoryService workCategoryService;
    private HtmlInputText name;
    private HtmlInputText description;
    private HtmlInputText newName;
    private HtmlInputText newStartDate;
    private HtmlInputText newEndDate;
    private HtmlInputText newDescription;
    private UIData data;
    private HtmlOutputText errorMsg;
    private HtmlSelectOneMenu slctOneWorkCategory;



    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlSelectOneMenu getSlctOneWorkCategory() {
        return slctOneWorkCategory;
    }

    public void setSlctOneWorkCategory(HtmlSelectOneMenu slctOneWorkCategory) {
        this.slctOneWorkCategory = slctOneWorkCategory;
    }


    public WorkCategoryService getWorkCategoryService() {
        return workCategoryService;
    }

    public void setWorkCategoryService(WorkCategoryService workCategoryService) {
        this.workCategoryService = workCategoryService;
    }
    
    public SelectItem[] getWorkCategorySelectItems() {
        List<WorkCategory> categories = workCategoryService.getWorkCategorys();
        return JSFUtil.toObjectSelectItemArray(categories);
    }

    public HtmlInputText getNewEndDate() {
        return newEndDate;
    }

    public void setNewEndDate(HtmlInputText newEndDate) {
        this.newEndDate = newEndDate;
    }

    public HtmlInputText getNewStartDate() {
        return newStartDate;
    }

    public void setNewStartDate(HtmlInputText newStartDate) {
        this.newStartDate = newStartDate;
    }

    public HtmlInputText getNewDescription() {
        return newDescription;
    }

    public void setNewDescription(HtmlInputText newDescription) {
        this.newDescription = newDescription;
    }

    public HtmlInputText getNewName() {
        return newName;
    }

    public void setNewName(HtmlInputText newName) {
        this.newName = newName;
    }

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }


    public HtmlInputText getDescription() {
        return description;
    }

    public void setDescription(HtmlInputText description) {
        this.description = description;
    }

    public WorkTaskService getWorkTaskService() {
        return workTaskService;
    }

    public void setWorkTaskService(WorkTaskService articleCategoryService) {
        this.workTaskService = articleCategoryService;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
    }   
    // </editor-fold>
    
    public List getWorkTasks(){
        return workTaskService.getWorkTasks();
    }

   public String WorkTaskDelete(){
       String returnVal = "sucess";
        try{
           WorkTask task = (WorkTask)this.getData().getRowData();
           workTaskService.deleteWorkTask(task);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }

       return returnVal;
    }

    public String WorkTaskCreate(){
        String returnVal = "success";
        try{
            WorkCategory category = (WorkCategory)getSlctOneWorkCategory().getValue();
            WorkTask task = new WorkTask();
            if(getNewName().getValue() == null || getNewName().getValue().toString().length() == 0){
                throw new Exception("Name is mandatory");
            }
            task.setName(getNewName().getValue().toString());
            if(getNewStartDate().getValue() != null && getNewStartDate().getValue().toString().length() > 0){
                task.setStartDate((Calendar)getNewStartDate().getValue());
                if(getNewEndDate().getValue() != null && getNewEndDate().getValue().toString().length() > 0){
                    task.setEndDate((Calendar)getNewStartDate().getValue());
                }
                task.setDescription(getNewDescription().getValue().toString());
                task.setWorkCategory(category);
                workTaskService.newWorkTask(task);
            }else{
                throw new Exception("Start date is mandatory");
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }


    public String Filter(){
        WorkCategory category = (WorkCategory)getSlctOneWorkCategory().getValue();
        JSFUtil.getSessionMap().put(JSFUtil.sessionBeanWorkCategoryModify, category);
        return "success";

    }

   public String WorkTasksUpdate(){
       String returnVal = "sucess";
        try{
            List tasks = (List)getData().getValue();
            for(int i = 0; i< tasks.size(); i++){
                WorkTask task = (WorkTask)tasks.get(i);
                workTaskService.updateWorkTask(task);
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update articles", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
       return returnVal;
    }   
   

}
