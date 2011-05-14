/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.WorkHoursDao;
import ksno.model.Instructor;
import ksno.model.WorkHours;
import ksno.util.JSFUtil;


/**
 *
 * @author tor.hauge
 */
public class WorkHoursServiceImpl implements WorkHoursService {
   private WorkHoursDao workHoursDao;

    private Logger getLogService(){
      return Logger.getLogger(WorkHoursServiceImpl.class.getName());
    }

    public WorkHoursDao getWorkHoursDao() {
        return workHoursDao;
    }

    public void setWorkHoursDao(WorkHoursDao workHoursDao) {
        this.workHoursDao = workHoursDao;
    }

    public WorkHours getWorkHours(Long id) {
        return workHoursDao.getWorkHours(id);
    }

    public Long newWorkHours(WorkHours hours) {
        return workHoursDao.newWorkHours(hours);
    }

    public void updateWorkHours(WorkHours hours) {
        workHoursDao.updateWorkHours(hours);
    }
    
    public void deleteWorkHours(WorkHours hours) {
        workHoursDao.deleteWorkHours(hours);
    }
    
    public List<WorkHours> getWorkHoursList() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        return workHoursDao.getWorkHoursList();
    }

    public List<WorkHours> getWorkHoursListByInstructor(Instructor instructor) {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        return workHoursDao.getWorkHoursListByInstructor(instructor);
    }

}
