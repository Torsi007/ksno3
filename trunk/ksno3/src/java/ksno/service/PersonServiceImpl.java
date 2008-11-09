/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;


import java.util.List;
import ksno.dao.PersonDao;
import ksno.model.Instructor;
import ksno.model.Person;

/**
 *
 * @author Tor-Erik
 */
public class PersonServiceImpl implements PersonService {

    public PersonDao getPersonDao() {
        return personDao;
    }

    public void setPersonDao(PersonDao personDao) {
        this.personDao = personDao;
    }
    
   private PersonDao personDao;

    public Person getPerson(Long id) {
//        Person person = personDao.getPerson(id);
        Person person = new Person();
        return person;
    }
    
    public Person getPerson(String userName){
        return personDao.getPerson(userName);
    }
    
    public List getPersons(){
        return personDao.getPersons();
        
    }
    
    public Long newPerson(Person person){
        return personDao.newPerson(person);
    }

    public List getInstructors() {
        return personDao.getInstructors();
    }

    public Instructor getInstructor(Long id) {
        return personDao.getInstructor(id);
    }

}
