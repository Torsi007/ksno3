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
import ksno.model.WorkHours;
import ksno.model.WorkTask;
import ksno.service.WorkCategoryService;
import ksno.service.WorkTaskService;
import ksno.service.WorkHoursService;
import ksno.util.JSFUtil;
import ksno.util.Util;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import javax.faces.event.ValueChangeEvent;
import ksno.model.Instructor;
import ksno.service.PersonService;
import org.apache.jasper.compiler.JspUtil;

/**
 *
 * @author tor.hauge
 */
public class WorkHoursMaintain {

    WorkHoursService workHoursService;
    WorkCategoryService workCategoryService;
    WorkTaskService workTaskService;
    PersonService personService;
    private HtmlInputText newDescription;
    private HtmlInputText newWorkHours;
    private HtmlInputText newWorkDate;
    private HtmlInputText tasksPopulated;
    private UIData data;
    private HtmlOutputText errorMsg;
    private HtmlSelectOneMenu newWorkCategory;
    private HtmlSelectOneMenu newWorkTask;
    private Instructor instructor;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlInputText getTasksPopulated() {
        return tasksPopulated;
    }

    public void setTasksPopulated(HtmlInputText tasksPopulated) {
        this.tasksPopulated = tasksPopulated;
    }

    public Instructor getInstructor() {
        if (instructor == null) {
            instructor = (Instructor) personService.getPerson(JSFUtil.getCurrentUserName());
        }
        return instructor;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public HtmlInputText getNewWorkHours() {
        return newWorkHours;
    }

    public void setNewWorkHours(HtmlInputText newWorkHours) {
        this.newWorkHours = newWorkHours;
    }

    public HtmlInputText getNewDescription() {
        return newDescription;
    }

    public void setNewDescription(HtmlInputText description) {
        this.newDescription = description;
    }

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

    public HtmlInputText getNewWorkDate() {
        return newWorkDate;
    }

    public void setNewWorkDate(HtmlInputText newWorkDate) {
        this.newWorkDate = newWorkDate;
    }

    public HtmlSelectOneMenu getNewWorkTask() {
        return newWorkTask;
    }

    public void setNewWorkTask(HtmlSelectOneMenu slctOneWorkTask) {
        this.newWorkTask = slctOneWorkTask;
    }

    public WorkTaskService getWorkTaskService() {
        return workTaskService;
    }

    public void setWorkTaskService(WorkTaskService workTaskService) {
        this.workTaskService = workTaskService;
    }

    public WorkHoursService getWorkHoursService() {
        return workHoursService;
    }

    public void setWorkHoursService(WorkHoursService workHoursService) {
        this.workHoursService = workHoursService;
    }

    public HtmlSelectOneMenu getNewWorkCategory() {
        return newWorkCategory;
    }

    public void setNewWorkCategory(HtmlSelectOneMenu slctOneWorkCategory) {
        this.newWorkCategory = slctOneWorkCategory;
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

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }
    private List<WorkHours> workHoursList;
    // </editor-fold>

    public List<WorkHours> getWorkHoursList() {
        if (workHoursList == null) {
            workHoursList = workHoursService.getWorkHoursListByInstructor(this.getInstructor());
        }
        return workHoursList;
    }

    public String fetchWorkTasksByCategory(ValueChangeEvent event) {
        this.getTasksPopulated().setValue("true");
        WorkCategory wc = (WorkCategory) event.getNewValue();
        workTasksByCategory = JSFUtil.toObjectSelectItemArray(Util.getAsList(wc.getTasks()));
        return "";
    }
    private SelectItem[] workTasksByCategory = new SelectItem[0];

    public SelectItem[] getWorkTasksByCategory() {
        if (workTasksByCategory == null || workTasksByCategory.length == 0) {
            if (getNewWorkCategory().getValue() != null) {
                WorkCategory wc = (WorkCategory) getNewWorkCategory().getValue();
                workTasksByCategory = JSFUtil.toObjectSelectItemArray(Util.getAsList(wc.getTasks()));
            }
        }
        return workTasksByCategory;
    }

    public String WorkHoursDelete() {
        String returnVal = "sucess";
        try {
            for (WorkHours workHours : this.getWorkHoursList()) {
                if (workHours.isuIChecked()) {
                    workHoursService.deleteWorkHours(workHours);
                }
            }
            workHoursList = null;
        } catch (Exception e) {
            getLogService().log(Level.SEVERE, "Unable to delete workhours", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String WorkHoursCreate() {
        String returnVal = "success";
        try {
            WorkTask task = (WorkTask) this.getNewWorkTask().getValue();
            WorkHours hours = new WorkHours();
            if (getNewWorkDate().getValue() != null && getNewWorkDate().getValue().toString().length() > 0) {
                hours.setWorkDate((Calendar) getNewWorkDate().getValue());
                hours.setDescription(getNewDescription().getValue().toString());
                hours.setWorkTask(task);
                hours.setHours(Integer.parseInt(getNewWorkHours().getValue().toString()));
                hours.setInstructor(this.getInstructor());
                getWorkHoursService().newWorkHours(hours);
                workHoursList = null;
            } else {
                throw new Exception("Start date is mandatory");
            }
        } catch (Exception e) {
            getLogService().log(Level.SEVERE, "Unable to create work hour", e);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

    public String WorkHoursUpdate() {
        String returnVal = "sucess";
        try {
            for (WorkHours workHours : this.getWorkHoursList()) {
                workHoursService.updateWorkHours(workHours);
            }
        } catch (Exception e) {
            getLogService().log(Level.SEVERE, "Unable to update workhours", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }
}
