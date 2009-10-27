/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.service;

import java.util.List;
import ksno.model.Instructor;
import ksno.model.Person;

/**
 *
 * @author Tor-Erik
 */
public interface PersonService {

    public List getInstructors();
    public Instructor getInstructor(Long id);
    public Person getPerson(Long id);
    public Person getPerson(String userName);    
    public List getPersons();
    public Long newPerson(Person person);
    public void updatePerson(Person person);
}
