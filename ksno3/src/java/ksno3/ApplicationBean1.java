/*
 * ApplicationBean1.java
 *
 * Created on 21.sep.2008, 21:10:07
 */
 
package ksno3;

import com.sun.rave.web.ui.appbase.AbstractApplicationBean;
import java.util.Calendar;
import java.util.List;
import javax.faces.FacesException;
import ksno.model.Article;
import ksno.model.BeginnerCourse;
import ksno.model.Category;
import ksno.model.Video;
import ksno.util.JSFUtil;

/**
 * <p>Application scope data bean for your application.  Create properties
 *  here to represent cached data that should be made available to all users
 *  and pages in the application.</p>
 *
 * <p>An instance of this class will be created for you automatically,
 * the first time your application evaluates a value binding expression
 * or method binding expression that references a managed bean using
 * this class.</p>
 *
 * @author halsnehauge
 */
public class ApplicationBean1 extends AbstractApplicationBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">

    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
    }
    // </editor-fold>

    public String getPrettyURLHome(){
        return JSFUtil.prettyURLHome;
    }

    public String getPrettyURLArticlesAndVideos(){
        return JSFUtil.prettyURLArticlesAndVideos;
    }

    public String getPrettyURLArticle(){
        return JSFUtil.prettyURLArticle;
    }

    public String getPrettyURLCourseSummer(){
        return JSFUtil.prettyURLCourseSummer;
    }

    public String getPrettyURLCourseWinter(){
        return JSFUtil.prettyURLCourseWinter;
    }

    public String getPrettyURLAboutUs(){
        return JSFUtil.prettyURLAboutUs;
    }

    public String getContextPath(){
        return JSFUtil.getRequest().getContextPath();
    }
    /**
     * <p>Construct a new application data bean instance.</p>
     */
    public ApplicationBean1() {
    }

    /**
     * <p>This method is called when this bean is initially added to
     * application scope.  Typically, this occurs as a result of evaluating
     * a value binding or method binding expression, which utilizes the
     * managed bean facility to instantiate this bean and store it into
     * application scope.</p>
     * 
     * <p>You may customize this method to initialize and cache application wide
     * data values (such as the lists of valid options for dropdown list
     * components), or to allocate resources that are required for the
     * lifetime of the application.</p>
     */
    @Override
    public void init() {
        // Perform initializations inherited from our superclass
        super.init();
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here
        
        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("ApplicationBean1 Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e: new FacesException(e);
        }
        
        // </editor-fold>
        // Perform application initialization that must complete
        // *after* managed components are initialized
        // TODO - add your own initialization code here
    }

    /**
     * <p>This method is called when this bean is removed from
     * application scope.  Typically, this occurs as a result of
     * the application being shut down by its owning container.</p>
     * 
     * <p>You may customize this method to clean up resources allocated
     * during the execution of the <code>init()</code> method, or
     * at any later time during the lifetime of the application.</p>
     */
    @Override
    public void destroy() {
    }

    /**
     * <p>Return an appropriate character encoding based on the
     * <code>Locale</code> defined for the current JavaServer Faces
     * view.  If no more suitable encoding can be found, return
     * "UTF-8" as a general purpose default.</p>
     *
     * <p>The default implementation uses the implementation from
     * our superclass, <code>AbstractApplicationBean</code>.</p>
     */
    @Override
    public String getLocaleCharacterEncoding() {
        return super.getLocaleCharacterEncoding();
    }

    private List events;
    private List eventsFromThisYear;
    private List<BeginnerCourse> beginnerCoursesFromThisYear;
    private List<Article> articles;
    private List<Video> videos;

    public List<Video> getVideos() {
        return videos;
    }

    public void setVideos(List<Video> videos) {
        this.videos = videos;
    }
    private List<Category> articleCategorys;

    public List<BeginnerCourse> getBeginnerCoursesFromThisYear() {
        return beginnerCoursesFromThisYear;
    }

    public void setBeginnerCoursesFromThisYear(List<BeginnerCourse> beginnerCoursesFromThisYear) {
        this.beginnerCoursesFromThisYear = beginnerCoursesFromThisYear;
    }

    

    public List<Category> getArticleCategorys() {
        return articleCategorys;
    }

    public void setArticleCategorys(List<Category> articleCategorys) {
        this.articleCategorys = articleCategorys;
    }

    public List getEventsFromThisYear() {
        return eventsFromThisYear;
    }

    public void setEventsFromThisYear(List eventsFromThisYear) {
        this.eventsFromThisYear = eventsFromThisYear;
    }

    

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }
    private List persons;
    private Calendar youTubeListLastScanned;
    private List instructors;

    public List getInstructors() {
        return instructors;
    }

    public void setInstructors(List instructors) {
        this.instructors = instructors;
    }

    public Calendar getYouTubeListLastScanned() {
        return youTubeListLastScanned;
    }

    public void setYouTubeListLastScanned(Calendar youTubeListLastScanned) {
        this.youTubeListLastScanned = youTubeListLastScanned;
    }

    public List getEvents() {
        return events;
    }

    public void setEvents(List events) {
        this.events = events;
    }

    public List getPersons() {
        return persons;
    }

    public void setPersons(List persons) {
        this.persons = persons;
    }
    
    
    
}
