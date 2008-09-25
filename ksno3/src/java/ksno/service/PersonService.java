/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.service;

import java.util.List;
import ksno.model.Person;

/**
 *
 * @author Tor-Erik
 */
public interface PersonService {
    public Person getPerson(int id);
    public Person getPerson(String userName);    
    public List getPersons();
}
