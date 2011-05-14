/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.Instructor;
import ksno.model.WorkHours;

/**
 *
 * @author tor.hauge
 */
public interface WorkHoursDao {
      public WorkHours getWorkHours(Long id);
      public Long newWorkHours(WorkHours hours);
      public void updateWorkHours(WorkHours hours);
      public void deleteWorkHours(WorkHours hours);
      public List<WorkHours> getWorkHoursList();
      public List<WorkHours> getWorkHoursListByInstructor(Instructor instructor);

}
