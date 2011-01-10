/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.WorkCategory;

/**
 *
 * @author tor.hauge
 */
public interface WorkCategoryDao {
      public WorkCategory getWorkCategory(Long id);
      public Long newWorkCategory(WorkCategory category);
      public void updateWorkCategory(WorkCategory category);
      public void deleteWorkCategory(WorkCategory category);
      public List<WorkCategory> getWorkCategorys();
}
