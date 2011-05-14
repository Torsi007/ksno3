/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.Instructor;
import ksno.model.WorkHours;

/**
 *
 * @author tor.hauge
 */
public interface WorkHoursService {
    public WorkHours getWorkHours(Long id);
    public Long newWorkHours(WorkHours workHours);
    public void updateWorkHours(WorkHours workHours);
    public void deleteWorkHours(WorkHours workHours);
    public List<WorkHours> getWorkHoursList();
    public List<WorkHours> getWorkHoursListByInstructor(Instructor instructor);
}
