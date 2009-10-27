/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.converter;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import ksno.model.Person;
import ksno.service.PersonService;
import ksno.service.PersonServiceImpl;

/**
 *
 * @author tor.hauge
 */
public class PersonConverter implements Converter {

    
    public Object getAsObject(FacesContext arg0, UIComponent arg1, String arg2) throws ConverterException {
        Long id = Long.parseLong(arg2);
        PersonService personService = new PersonServiceImpl();
        return personService.getPerson(id);
    }

    public String getAsString(FacesContext arg0, UIComponent arg1, Object arg2) throws ConverterException {
        //Person person = (Person)arg2;
        //return person.getId().toString();
        return arg2.toString();
    }

}
