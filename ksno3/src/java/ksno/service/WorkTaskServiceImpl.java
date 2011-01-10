/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.WorkTaskDao;
import ksno.model.WorkTask;
import ksno.util.JSFUtil;


/**
 *
 * @author tor.hauge
 */
public class WorkTaskServiceImpl implements WorkTaskService {
   private WorkTaskDao workTaskDao;

    private Logger getLogService(){
      return Logger.getLogger(WorkTaskServiceImpl.class.getName());
    }

    public WorkTaskDao getWorkTaskDao() {
        return workTaskDao;
    }

    public void setWorkTaskDao(WorkTaskDao workTaskDao) {
        this.workTaskDao = workTaskDao;
    }

    public WorkTask getWorkTask(Long id) {
        return workTaskDao.getWorkTask(id);
    }

    public Long newWorkTask(WorkTask task) {
        JSFUtil.clearApplicationCache(JSFUtil.appCahceWorkCategories);
        return workTaskDao.newWorkTask(task);
    }

    public void updateWorkTask(WorkTask task) {
        JSFUtil.clearApplicationCache(JSFUtil.appCahceWorkCategories);
        workTaskDao.updateWorkTask(task);
    }
    
    public void deleteWorkTask(WorkTask task) {
        JSFUtil.clearApplicationCache(JSFUtil.appCahceWorkCategories);
        workTaskDao.deleteWorkTask(task);
    }
    
    public List<WorkTask> getWorkTasks() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        return workTaskDao.getWorkTasks();
    }



}
