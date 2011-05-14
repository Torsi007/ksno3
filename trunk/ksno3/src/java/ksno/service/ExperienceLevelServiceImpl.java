/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.ExperienceLevelDao;
import ksno.model.ExperienceLevel;
import ksno.util.JSFUtil;


/**
 *
 * @author tor.hauge
 */
public class ExperienceLevelServiceImpl implements ExperienceLevelService {
   private ExperienceLevelDao experienceLevelDao;

    private Logger getLogService(){
      return Logger.getLogger(ExperienceLevelServiceImpl.class.getName());
    }

    public ExperienceLevelDao getExperienceLevelDao() {
        return experienceLevelDao;
    }

    public void setExperienceLevelDao(ExperienceLevelDao ExperienceLevelDao) {
        this.experienceLevelDao = ExperienceLevelDao;
    }

    public ExperienceLevel getExperienceLevel(Long id) {
        return experienceLevelDao.getExperienceLevel(id);
    }

    public Long newExperienceLevel(ExperienceLevel experienceLevel) {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<ExperienceLevel> experienceLevels = (List)JSFUtil.getValue("#{ApplicationBean1." + JSFUtil.appCacheExperienceLevels + "}", c);
        for(ExperienceLevel el: experienceLevels){
            if(el.getRank() >= experienceLevel.getRank()){
                el.setRank(el.getRank() +1);
                updateExperienceLevel(el);
            }
        }
        JSFUtil.clearApplicationCache(JSFUtil.appCacheExperienceLevels);

        return experienceLevelDao.newExperienceLevel(experienceLevel);
    }

    public void updateExperienceLevel(ExperienceLevel experienceLevel) {
        JSFUtil.clearApplicationCache(JSFUtil.appCacheExperienceLevels);
        experienceLevelDao.updateExperienceLevel(experienceLevel);
    }
    
    public void deleteExperienceLevel(ExperienceLevel experienceLevel) {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<ExperienceLevel> experienceLevels = (List)JSFUtil.getValue("#{ApplicationBean1." + JSFUtil.appCacheExperienceLevels + "}", c);
        for(ExperienceLevel el: experienceLevels){
            if(el.getRank() > experienceLevel.getRank()){
                el.setRank(el.getRank() -1);
                updateExperienceLevel(el);
            }
        }        
        JSFUtil.clearApplicationCache(JSFUtil.appCacheExperienceLevels);
        experienceLevelDao.deleteExperienceLevel(experienceLevel);
    }
    
    public List<ExperienceLevel> getExperienceLevels() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<ExperienceLevel> returnList = (List)JSFUtil.getValue("#{ApplicationBean1." + JSFUtil.appCacheExperienceLevels + "}", c);
        if(returnList == null){
            returnList = experienceLevelDao.getExperienceLevels();
            JSFUtil.setValue("#{ApplicationBean1." + JSFUtil.appCacheExperienceLevels + "}", returnList, c);
        }
        return returnList;
    }



}
