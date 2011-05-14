/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.OnDutyDao;
import ksno.model.OnDuty;
import ksno.util.*;

/**
 *
 * @author Tor-Erik
 */
public class OnDutyServiceImpl implements OnDutyService {

   private OnDutyDao onDutyDao;

    public OnDutyDao getOnDutyDao() {
        return onDutyDao;
    }

    public void setOnDutyDao(OnDutyDao onDutyDao) {
        this.onDutyDao = onDutyDao;
    }

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

    public OnDuty getOnDuty(Long id) {
        return onDutyDao.getOnDuty(id);
    }

    public Long newOnDuty(OnDuty onDuty) {
        JSFUtil.clearApplicationCache(JSFUtil.appCacheTypeOnDutys);
        return onDutyDao.newOnDuty(onDuty);
    }

    public void updateOnDuty(OnDuty onDuty) {
        onDutyDao.updateOnDuty(onDuty);
        JSFUtil.clearApplicationCache(JSFUtil.appCacheTypeOnDutys);
    }

    public void deleteOnDuty(OnDuty onDuty) {
       onDutyDao.deleteOnDuty(onDuty);
       JSFUtil.clearApplicationCache(JSFUtil.appCacheTypeOnDutys);
    }

    public List<OnDuty> getOnDutys() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<OnDuty> returnList = (List)JSFUtil.getValue("#{ApplicationBean1." + JSFUtil.appCacheTypeOnDutys + "}", c);
        if(returnList == null){
            returnList = onDutyDao.getOnDutys();
            JSFUtil.setValue("#{ApplicationBean1." + JSFUtil.appCacheTypeOnDutys + "}", returnList, c);
        }
        return returnList;
    }

    public OnDuty getCurrentlyOnDuty() {
        List<OnDuty> list = getOnDutys();
        Calendar now = Calendar.getInstance();
        OnDuty returnOnDuty = null;
        int length = list.size();
        for(int i=0; i< length; i++){
            OnDuty onDuty = list.get(i);
            returnOnDuty = onDuty;
            if(i < length - 1){
                OnDuty nextOnDuty = list.get(i+1);
                if(now.after(onDuty.getFromDate()) && now.before(nextOnDuty.getFromDate())){
                    returnOnDuty = onDuty;
                    break;
                }
            }
        }
        return returnOnDuty;
    }

    public List<OnDuty> getUpcomingOnDutys() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
