/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.BeginnerCourse;

/**
 *
 * @author halsnehauge
 */
public interface CourseService {
    public List getCourses();
    public Long newCourse(BeginnerCourse course);    

}
