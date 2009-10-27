/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.Participation;

/**
 *
 * @author halsnehauge
 */
public interface ParticipationDao {
      public Participation getParticipation(Long id);
      public Long newParticipation(Participation participation);
      public void updateParticipation(Participation participation);
      public List getParticipations();
      public void deleteParticipation(Participation participation);
}
