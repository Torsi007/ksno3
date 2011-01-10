/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.WorkTask;

/**
 *
 * @author tor.hauge
 */
public interface WorkTaskService {
    public WorkTask getWorkTask(Long id);
    public Long newWorkTask(WorkTask workTask);
    public void updateWorkTask(WorkTask workTask);
    public void deleteWorkTask(WorkTask workTask);
    public List<WorkTask> getWorkTasks();
}
