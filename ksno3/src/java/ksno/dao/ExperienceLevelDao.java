/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.ExperienceLevel;

/**
 *
 * @author tor.hauge
 */
public interface ExperienceLevelDao {
      public ExperienceLevel getExperienceLevel(Long id);
      public Long newExperienceLevel(ExperienceLevel experienceLevel);
      public void updateExperienceLevel(ExperienceLevel experienceLevel);
      public void deleteExperienceLevel(ExperienceLevel experienceLevel);
      public List<ExperienceLevel> getExperienceLevels();
}
