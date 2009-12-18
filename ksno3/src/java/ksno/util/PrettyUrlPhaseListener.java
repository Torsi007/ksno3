/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpServletRequest;
import ksno.ui.jsf.backing.Article;
import ksno.ui.jsf.backing.CourseHaukeliseter;
import org.hibernate.SessionFactory;

/**
 *
 * @author halsne-hauge
 */
public class PrettyUrlPhaseListener implements PhaseListener {

    private Logger getLogService() {
        return Logger.getLogger(this.getClass().getName());
    }
    FacesContext context = null;

    public void afterPhase(PhaseEvent arg0) {
    }

    public void beforePhase(PhaseEvent e) {
        PhaseId phase = e.getPhaseId();
        if (phase == PhaseId.RESTORE_VIEW) {
            try {
                context = FacesContext.getCurrentInstance();
                HttpServletRequest request = (HttpServletRequest) context.getExternalContext().getRequest();
                String uri = request.getRequestURI();
                if (uri != null) {
                    uri = uri.toLowerCase();
                    if(uri.toLowerCase().indexOf(JSFUtil.prettyURLHome) > -1){
                        getLogService().log(Level.INFO,"Request url contains " + JSFUtil.prettyURLHome + ", hence handling it as a home url. Requested url: " + uri);
                        handleHomeLookup();
                    }
                    if(uri.toLowerCase().indexOf(JSFUtil.prettyURLArticlesAndVideos) > -1){
                        getLogService().log(Level.INFO,"Request url contains " + JSFUtil.prettyURLArticlesAndVideos + ", hence handling it as a pretty print url targetting the articles and video page or an article directly. Requested url: " + uri);
                        String[] parts = uri.split(JSFUtil.prettyURLArticlesAndVideos);
                        String subUrl = "";
                        if(parts.length > 1){
                            subUrl = parts[1];
                        }
                        handleArticleAndVideosLookup(subUrl);
                    }
                    if(uri.toLowerCase().indexOf(JSFUtil.prettyURLCourseSummer) > -1){
                        getLogService().log(Level.INFO,"Request url contains " + JSFUtil.prettyURLCourseSummer + ", hence handling it as a pretty print url targetting the course summer page or a summer course directly. Requested url: " + uri);
                        String[] parts = uri.split(JSFUtil.prettyURLCourseSummer);
                        String subUrl = "";
                        if(parts.length > 1){
                            subUrl = parts[1];
                        }
                        handleCourseSummerLookup(subUrl);
                    }
                    if(uri.toLowerCase().indexOf(JSFUtil.prettyURLCourseWinter) > -1){
                        getLogService().log(Level.INFO,"Request url contains " + JSFUtil.prettyURLCourseWinter + ", hence handling it as a pretty print url targetting the winter summer page or a summer course directly. Requested url: " + uri);
                        String[] parts = uri.split(JSFUtil.prettyURLCourseWinter);
                        String subUrl = "";
                        if(parts.length > 1){
                            subUrl = parts[1];
                        }
                        handleCourseWinterLookup(subUrl);
                    }
                    if(uri.toLowerCase().indexOf(JSFUtil.prettyURLAboutUs) > -1){
                        getLogService().log(Level.INFO,"Request url contains " + JSFUtil.prettyURLAboutUs + ", hence handling it as a about us url. Requested url: " + uri);
                        handleAboutUsLookup();
                    }

                }
            } catch (Exception ex) {
                getLogService().log(Level.SEVERE, ex.getMessage());
                ex.printStackTrace();
            }
        }
    }

    private void handleHomeLookup() {
        UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/Home.jsp");
        context.setViewRoot(view);
    }

    private void handleArticleAndVideosLookup(String subUrl) {
        if(subUrl != null || !subUrl.isEmpty()){
            if(subUrl.startsWith(JSFUtil.prettyURLArticle)){
                getLogService().log(Level.INFO,"Request url contains "+ JSFUtil.prettyURLArticle +", hence handling it as a pretty print article url. Requested url: " + subUrl);
                String[] parts = subUrl.split(JSFUtil.prettyURLArticle);
                handleArticleLookups(parts[1]);
            }else{
                UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/Articles.jsp");
                context.setViewRoot(view);
            }
        }else{
            UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/Articles.jsp");
            context.setViewRoot(view);
        }
    }


    protected void handleArticleLookups(String prettyPrintId) {
        UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/Article.jsp");
        context.setViewRoot(view);
        Article articleBean = null;
        try {
            articleBean = (Article) JSFUtil.getBeanValue("#{Article_Backing}", Article.class);
        } catch (Exception ex) {
            Logger.getLogger(PrettyUrlPhaseListener.class.getName()).log(Level.SEVERE, null, ex);
        }
        String id = prettyPrintId;
        try {
            id = URLDecoder.decode(prettyPrintId, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(PrettyUrlPhaseListener.class.getName()).log(Level.SEVERE, null, ex);
        }
        articleBean.setPrettyPrintId(id);

    }

    private void handleCourseSummerLookup(String subUrl) {
        if(subUrl != null || !subUrl.isEmpty()){
            if(subUrl.startsWith(JSFUtil.prettyURLStavanger)){
                //Not handled yet
                getLogService().log(Level.INFO,"Request url contains "+ JSFUtil.prettyURLArticle +", hence handling it as a pretty print article url. Requested url: " + subUrl);
            }else{
                UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/CourseJaren.jsp");
                context.setViewRoot(view);
            }
        }else{
            UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/CourseJaren.jsp");
            context.setViewRoot(view);
        }
    }

    private void handleCourseWinterLookup(String subUrl) {
        if(subUrl != null || !subUrl.isEmpty()){
            if(subUrl.startsWith(JSFUtil.prettyURLHaukeliseter)){
                getLogService().log(Level.INFO,"Request url contains "+ JSFUtil.prettyURLHaukeliseter +", hence handling it as a pretty print winter course url. Requested url: " + subUrl);
                CourseHaukeliseter courseHaukeliseterBean = null;
                try {
                    courseHaukeliseterBean = (CourseHaukeliseter) JSFUtil.getBeanValue("#{CourseHaukeliseter_Backing}", CourseHaukeliseter.class);
                } catch (Exception ex) {
                    Logger.getLogger(PrettyUrlPhaseListener.class.getName()).log(Level.SEVERE, null, ex);
                }
                String id = subUrl;
                try {
                    id = URLDecoder.decode(subUrl, "UTF-8");
                } catch (UnsupportedEncodingException ex) {
                    Logger.getLogger(PrettyUrlPhaseListener.class.getName()).log(Level.SEVERE, null, ex);
                }
                courseHaukeliseterBean.setPrettyPrintId(id);
                UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/CourseHaukeliseter.jsp");
                context.setViewRoot(view);
            }else{
                UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/CoursesHaukeliseter.jsp");
                context.setViewRoot(view);
            }
        }else{
            UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/CoursesHaukeliseter.jsp");
            context.setViewRoot(view);
        }
    }

    private void handleAboutUsLookup() {
        UIViewRoot view = context.getApplication().getViewHandler().createView(context, "/aboutUs.jsp");
        context.setViewRoot(view);
    }

    public PhaseId getPhaseId() {
        return PhaseId.RESTORE_VIEW;
    }



}
