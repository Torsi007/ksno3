/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;

/**
 *
 * @author tor.hauge
 */
public class KSNOPhaseListener implements PhaseListener {

      private Logger getLogService(){
          return Logger.getLogger(KSNOPhaseListener.class.getName());
      }

    public void afterPhase(PhaseEvent pe) {
        if(pe.getPhaseId() == PhaseId.RENDER_RESPONSE){
            // Here set the Hibernate commit or roll back transaction ...


            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            try {
              sessionFactory.getCurrentSession().getTransaction().commit();
            } catch (Throwable ex) {
                getLogService().log(Level.SEVERE, "Very unsuitable error occured ...",ex);
                if (sessionFactory.getCurrentSession().getTransaction().isActive()) {
                      sessionFactory.getCurrentSession().getTransaction().rollback();
                }
            }
        }
    }

    public void beforePhase(PhaseEvent pe) {

        /*HttpServletRequest httpRequest = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
        if(httpRequest.getMethod().equals("POST")){
            try {
                httpRequest.setCharacterEncoding("UTF-8");
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(KSNOPhaseListener.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

           HttpServletResponse httpResponse = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
            httpResponse.setCharacterEncoding("UTF-8");*/


        if(pe.getPhaseId() == PhaseId.RESTORE_VIEW){
            // Here set the Hibernate commit or roll back transaction ...
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            sessionFactory.getCurrentSession().beginTransaction();
        }        
    }

    public PhaseId getPhaseId() {
        return PhaseId.ANY_PHASE;
    }
 
}
