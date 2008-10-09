/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import javax.faces.component.UIData;
import ksno.service.CourseService;
import org.apache.myfaces.component.html.ext.HtmlInputText;

/**
 *
 * @author halsnehauge
 */
public class CoursesMaintain {
    CourseService courseService;
    private HtmlInputText name;
    private UIData data;

    public CourseService getCourseService() {
        return courseService;
    }

    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }
    
    public List getCourses(){
        return courseService.getCourses();
    }

}
