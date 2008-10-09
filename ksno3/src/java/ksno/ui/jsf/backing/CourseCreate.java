/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.model.BeginnerCourse;
import ksno.service.CourseService;
import org.apache.myfaces.component.html.ext.HtmlInputText;

/**
 *
 * @author halsnehauge
 */
public class CourseCreate {
    private HtmlInputText startDate;
    private HtmlInputText endDate;    
    private HtmlInputText comment;
    private HtmlInputText maxSize;
    private CourseService courseService;

    public CourseService getCourseService() {
        return courseService;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    public HtmlInputText getComment() {
        return comment;
    }

    public void setComment(HtmlInputText comment) {
        this.comment = comment;
    }

    public HtmlInputText getEndDate() {
        return endDate;
    }

    public void setEndDate(HtmlInputText endDate) {
        this.endDate = endDate;
    }

    public HtmlInputText getMaxSize() {
        return maxSize;
    }

    public void setMaxSize(HtmlInputText maxSize) {
        this.maxSize = maxSize;
    }

    public HtmlInputText getStartDate() {
        return startDate;
    }

    public void setStartDate(HtmlInputText startDate) {
        this.startDate = startDate;
    }
    
    public String createCourse(){
        String returnVal = "coursesMaintain";
        try{
            BeginnerCourse course = new BeginnerCourse();
            course.setStartDate((Date)startDate.getValue());
            course.setEndDate((Date)endDate.getValue());            
            course.setComment(comment.getValue().toString());                        
            course.setMaxSize(Integer.parseInt(maxSize.getValue().toString()));                                    
            courseService.newCourse(course);
        }catch(Exception e){
            Logger.getLogger(CourseCreate.class.getName()).log(Level.SEVERE,"Unable to create article", e);
            returnVal = "no";
        }
        return returnVal;
    }     


}
