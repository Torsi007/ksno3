/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.WorkCategory;

/**
 *
 * @author tor.hauge
 */
public interface WorkCategoryService {
    public WorkCategory getWorkCategory(Long id);
    public Long newWorkCategory(WorkCategory WorkCategory);
    public void updateWorkCategory(WorkCategory WorkCategory);
    public void deleteWorkCategory(WorkCategory WorkCategory);
    public List<WorkCategory> getWorkCategorys();
}
