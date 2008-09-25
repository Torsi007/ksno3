/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.Person;

/**
 *
 * @author Tor-Erik
 */
public interface PersonDao {
    
    

      public List getPersons();
      
      public Person getPerson(String userName);
    
}
