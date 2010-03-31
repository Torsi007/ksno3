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
import ksno.model.Event;
import ksno.service.EventService;
import ksno.service.EventServiceImpl;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class EventConverter implements Converter {

    private Logger getLogService(){
      return Logger.getLogger(CategoryConverter.class.getName());
    }

    private EventService getEventService(){
        EventService service = null;
        try {
            service = (EventService) JSFUtil.getBeanValue("#{EventService}", EventService.class);
        } catch (Exception ex) {
            Logger.getLogger(CategoryConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }


    public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
        getLogService().log(Level.INFO,"About to convert " + value + " to a Category");
        //ArticleCategoryDaoImpl dao = new ArticleCategoryDaoImpl();
        //return dao.getArticleCategory(Long.parseLong(value));
        return getEventService().getEvent(Long.parseLong(value));
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        if(null == value){
            getLogService().log(Level.INFO,"Value is null, and null is returned");            
            return null;
        }
        getLogService().log(Level.INFO,"About to convert " + value.toString() + " to a string");
        Event event = (Event)value;
        return event.getId().toString();
    }

}
