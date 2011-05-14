/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.converter;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import ksno.model.Participation;
import ksno.service.ParticipationService;
import ksno.service.ParticipationServiceImpl;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class ParticipationConverter implements Converter {

    private Logger getLogService(){
      return Logger.getLogger(ParticipationConverter.class.getName());
    }

    private ParticipationService getParticipationService(){
        ParticipationService service = null;
        try {
            service = (ParticipationService) JSFUtil.getBeanValue("#{ParticipationService}", ParticipationService.class);
        } catch (Exception ex) {
            Logger.getLogger(CategoryConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }


    public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
        getLogService().log(Level.INFO,"About to convert " + value + " to a Participation");
        //ArticleCategoryDaoImpl dao = new ArticleCategoryDaoImpl();
        //return dao.getArticleCategory(Long.parseLong(value));
        Object participation = null;
        try{
            participation = getParticipationService().getParticipation(Long.parseLong(value));
        }catch(Exception ex){
        }
        return participation;
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        if(null == value){
            getLogService().log(Level.INFO,"Value is null, and null is returned");            
            return null;
        }
        getLogService().log(Level.INFO,"About to convert " + value.toString() + " to a string");
        Participation participation = (Participation)value;
        return participation.getId().toString();
    }

}
