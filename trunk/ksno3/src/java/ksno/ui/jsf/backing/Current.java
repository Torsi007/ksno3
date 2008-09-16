/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import ksno.service.PersonService;

/**
 *
 * @author halsnehauge
 */
public class Current {
    List persons;
    PersonService personService;

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public List getPersons() {
        return personService.getPersons();
    }

    public void setPersons(List persons) {
        this.persons = persons;
    }
}
