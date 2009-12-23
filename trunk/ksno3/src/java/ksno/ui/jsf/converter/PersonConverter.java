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
import ksno.model.Person;
import ksno.service.PersonService;
import ksno.service.PersonServiceImpl;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class PersonConverter implements Converter {

    private Logger getLogService(){
      return Logger.getLogger(CategoryConverter.class.getName());
    }

    private PersonService getPersonService(){
        PersonService service = null;
        try {
            service = (PersonService) JSFUtil.getBeanValue("#{PersonService}", PersonService.class);
        } catch (Exception ex) {
            Logger.getLogger(CategoryConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }


    public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
        getLogService().log(Level.INFO,"About to convert " + value + " to a Category");
        //ArticleCategoryDaoImpl dao = new ArticleCategoryDaoImpl();
        //return dao.getArticleCategory(Long.parseLong(value));
        return getPersonService().getPerson(Long.parseLong(value));
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        if(null == value){
            getLogService().log(Level.INFO,"Value is null, and null is returned");            
            return null;
        }
        getLogService().log(Level.INFO,"About to convert " + value.toString() + " to a string");
        Person person = (Person)value;
        return person.getId().toString();
    }

}
