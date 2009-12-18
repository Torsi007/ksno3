/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;
import ksno.model.Category;
import java.util.HashMap;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.model.SelectItem;
import ksno.model.BeginnerCourse;
import ksno.model.Participation;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.EventService;
import ksno.service.ParticipationService;
import ksno.service.PersonService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlInputTextarea;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.component.html.ext.HtmlSelectOneMenu;
import org.apache.myfaces.component.html.ext.HtmlSelectOneListbox;
/**
 *
 * @author tor.hauge
 */
public class CourseHaukeliseter {
    private HtmlInputText email;
    private HtmlInputText firstName;    
    private HtmlInputText lastName;
    private HtmlInputText phone;
    private HtmlSelectOneMenu helmetSize;  
    private HtmlSelectOneMenu coursesSelect;
    private HtmlSelectOneListbox lstBxcoursesSelect;
    private Long id;
    private HtmlOutputText errorMsg;
    private HtmlInputTextarea comment;

    private EventService eventService;
    private PersonService personService;
    private ArticleService articleService;
    private String prettyPrintId;

    public String getPrettyPrintId() {
        return prettyPrintId;
    }

    public void setPrettyPrintId(String prettyPrintId) {
        this.prettyPrintId = prettyPrintId;
    }


    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public HtmlSelectOneListbox getLstBxcoursesSelect() {
        return lstBxcoursesSelect;
    }

    public void setLstBxcoursesSelect(HtmlSelectOneListbox lstBxcoursesSelect) {
        this.lstBxcoursesSelect = lstBxcoursesSelect;
    }

    public HtmlInputTextarea getComment() {
        return comment;
    }

    public void setComment(HtmlInputTextarea comment) {
        this.comment = comment;
    }
    
    
        
    private Logger getLogService(){
      return Logger.getLogger(BeginnerCourseCreate.class.getName());
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }

    public HtmlSelectOneMenu getCoursesSelect() {
        return coursesSelect;
    }

    public void setCoursesSelect(HtmlSelectOneMenu coursesSelect) {
        this.coursesSelect = coursesSelect;
    }

    public List<ksno.model.Article> getCourseArticles(){
        getLogService().log(Level.INFO, "Start getCourseArticles()");
        Category category = new Category();
        category.setName("Courses");
        List<ksno.model.Article> returnList = getArticleService().getArticlesByCategory(category);
        getLogService().log(Level.INFO, "Found a list of " + returnList.size() + " articles.");
        while(returnList.size() > 5){
            returnList.remove(returnList.size()-1);
        }
        return returnList;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public EventService getEventService() {
        return eventService;
    }

    public void setEventService(EventService eventService) {
        this.eventService = eventService;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        getLogService().log(Level.INFO, "Setting course id to " + id);
        this.id = id;
    }

    public HtmlInputText getEmail() {
        return email;
    }

    public void setEmail(HtmlInputText email) {
        getLogService().log(Level.INFO, "Setting email");
        this.email = email;
    }

    public HtmlInputText getFirstName() {
        return firstName;
    }

    public void setFirstName(HtmlInputText firstName) {
        this.firstName = firstName;
    }

    public HtmlSelectOneMenu getHelmetSize() {
        return helmetSize;
    }

    public void setHelmetSize(HtmlSelectOneMenu helmetSize) {
        this.helmetSize = helmetSize;
    }

    public HtmlInputText getLastName() {
        return lastName;
    }

    public void setLastName(HtmlInputText lastName) {
        this.lastName = lastName;
    }

    public HtmlInputText getPhone() {
        return phone;
    }

    public void setPhone(HtmlInputText phone) {
        this.phone = phone;
    }

    public BeginnerCourse getCourse(){
        BeginnerCourse returnCourse = null;
        if(this.getId() != null){
            getLogService().log(Level.INFO, "About to get course object for id " + getId());
            returnCourse = eventService.getBeginnerCourse(this.getId());
        }else{
            getLogService().log(Level.INFO, "About to get course object for prettyprintid " + this.getPrettyPrintId());
            returnCourse = eventService.getBeginnerCourse(this.getPrettyPrintId());
        }
        return returnCourse;
    }

    public List getUpCommingCourses(){
        return eventService.getOpenUpcommingWinterBeginnerCourses();
    }

    public SelectItem[] getCoursesSelectItems() {
        List events = eventService.getOpenUpcommingWinterBeginnerCourses();
        return JSFUtil.toSelectItemArray(events);
    }
    
}
