/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.BeginnerCourse;

/**
 *
 * @author halsnehauge
 */
public interface CourseDao {
      //public Article getArticle(Long id);
      public Long newCourse(BeginnerCourse course);
      //public void updateArticle(Article article);
      public List getCourses();
}
