/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.WorkTask;

/**
 *
 * @author tor.hauge
 */
public interface WorkTaskDao {
      public WorkTask getWorkTask(Long id);
      public Long newWorkTask(WorkTask task);
      public void updateWorkTask(WorkTask task);
      public void deleteWorkTask(WorkTask task);
      public List<WorkTask> getWorkTasks();
}
