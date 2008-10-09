/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.dao.CourseDao;
import ksno.model.BeginnerCourse;

/**
 *
 * @author halsnehauge
 */
public class CourseServiceImpl implements CourseService {

   private CourseDao courseDao;

    public CourseDao getCourseDao() {
        return courseDao;
    }

    public void setCourseDao(CourseDao courseDao) {
        this.courseDao = courseDao;
    }
    
    public List getCourses() {
        return courseDao.getCourses();
    }

    public Long newCourse(BeginnerCourse course) {
        return courseDao.newCourse(course);
    }
    
}
