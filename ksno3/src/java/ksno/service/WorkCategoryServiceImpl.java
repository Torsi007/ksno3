/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.WorkCategoryDao;
import ksno.model.WorkCategory;
import ksno.util.JSFUtil;


/**
 *
 * @author tor.hauge
 */
public class WorkCategoryServiceImpl implements WorkCategoryService {
   private WorkCategoryDao workCategoryDao;

    private Logger getLogService(){
      return Logger.getLogger(WorkCategoryServiceImpl.class.getName());
    }

    public WorkCategoryDao getWorkCategoryDao() {
        return workCategoryDao;
    }

    public void setWorkCategoryDao(WorkCategoryDao WorkCategoryDao) {
        this.workCategoryDao = WorkCategoryDao;
    }

    public WorkCategory getWorkCategory(Long id) {
        return workCategoryDao.getWorkCategory(id);
    }

    public Long newWorkCategory(WorkCategory category) {
        JSFUtil.clearApplicationCache(JSFUtil.appCahceWorkCategories);
        return workCategoryDao.newWorkCategory(category);
    }

    public void updateWorkCategory(WorkCategory category) {
        JSFUtil.clearApplicationCache(JSFUtil.appCahceWorkCategories);
        workCategoryDao.updateWorkCategory(category);
    }
    
    public void deleteWorkCategory(WorkCategory category) {
        JSFUtil.clearApplicationCache(JSFUtil.appCahceWorkCategories);
        workCategoryDao.deleteWorkCategory(category);
    }
    
    public List<WorkCategory> getWorkCategorys() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<WorkCategory> returnList = (List)JSFUtil.getValue("#{ApplicationBean1." + JSFUtil.appCahceWorkCategories + "}", c);
        if(returnList == null){
            returnList = workCategoryDao.getWorkCategorys();
            JSFUtil.setValue("#{ApplicationBean1." + JSFUtil.appCahceWorkCategories + "}", returnList, c);
        }
        return returnList;
    }



}
