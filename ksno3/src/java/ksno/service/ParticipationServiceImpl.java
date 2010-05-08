/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.List;
import ksno.dao.ParticipationDao;
import ksno.model.Participation;
import ksno.util.JSFUtil;

/**
 *
 * @author halsnehauge
 */
public class ParticipationServiceImpl implements ParticipationService {
    public ParticipationDao getParticipationDao() {
        return participationDao;
    }

    public void setParticipationDao(ParticipationDao participationDao) {
        this.participationDao = participationDao;
    }
    
   private ParticipationDao participationDao;

    public Participation getParticipation(Long id) {
        return participationDao.getParticipation(id);
    }

    public Long newParticipation(Participation participation) {
        if(participation.getCreatedDate() == null){
            participation.setCreatedDate(Calendar.getInstance());
        }
        JSFUtil.clearApplicationCache("eventsFromThisYear");
        JSFUtil.clearApplicationCache("beginnerCoursesFromThisYear");
        return participationDao.newParticipation(participation);
    }

    public void updateParticipation(Participation participation) {
        participationDao.updateParticipation(participation);
    }
    
    public List getParticipations() {
        return participationDao.getParticipations();
    }

    public void deleteParticipation(Participation participation) {
        participationDao.deleteParticipation(participation);
    }

}
