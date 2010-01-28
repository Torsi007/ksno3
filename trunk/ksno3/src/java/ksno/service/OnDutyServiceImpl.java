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

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }

    public OnDuty getOnDuty(Long id) {
        return onDutyDao.getOnDuty(id);
    }

    public Long newOnDuty(OnDuty onDuty) {
        JSFUtil.clearApplicationCache(JSFUtil.appCahceTypeOnDutys);
        return onDutyDao.newOnDuty(onDuty);
    }

    public void updateOnDuty(OnDuty onDuty) {
        onDutyDao.updateOnDuty(onDuty);
        JSFUtil.clearApplicationCache(JSFUtil.appCahceTypeOnDutys);
    }

    public void deleteOnDuty(OnDuty onDuty) {
       onDutyDao.deleteOnDuty(onDuty);
       JSFUtil.clearApplicationCache(JSFUtil.appCahceTypeOnDutys);
    }

    public List<OnDuty> getOnDutys() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List<OnDuty> returnList = (List)JSFUtil.getValue("#{ApplicationBean1." + JSFUtil.appCahceTypeOnDutys + "}", c);
        if(returnList == null){
            returnList = onDutyDao.getOnDutys();
            JSFUtil.setValue("#{ApplicationBean1." + JSFUtil.appCahceTypeOnDutys + "}", returnList, c);
        }
        return returnList;
    }

    public OnDuty getCurrentlyOnDuty() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public List<OnDuty> getUpcomingOnDutys() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
