/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;
import java.util.List;
import ksno.model.OnDuty;


/**
 *
 * @author halsnehauge
 */
public interface OnDutyDao {
      public Long newOnDuty(OnDuty onDuty);
      public OnDuty getOnDuty(Long id);
      public void updateOnDuty(OnDuty onDuty);
      public void deleteOnDuty(OnDuty onDuty);
      public List<OnDuty> getOnDutys();

}
