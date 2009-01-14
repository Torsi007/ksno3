/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.Instructor;
import ksno.model.Person;

/**
 *
 * @author Tor-Erik
 */
public interface PersonDao {

      public List getPersons();
      public List getInstructors();
      public Person getPerson(Long id);      
      public Person getPerson(String userName);
      public Instructor getInstructor(Long id);
      public Long newPerson(Person person);

    public void updatePerson(Person person);
    
}
