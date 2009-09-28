/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;


import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ksno.dao.PersonDao;
import ksno.model.Instructor;
import ksno.model.Person;
import ksno.security.PasswordFactory;
import ksno.util.JSFUtil;

/**
 *
 * @author Tor-Erik
 */
public class PersonServiceImpl implements PersonService {
    
  private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
  }        

    public PersonDao getPersonDao() {
        return personDao;
    }

    public void setPersonDao(PersonDao personDao) {
        this.personDao = personDao;
    }
    
   private PersonDao personDao;

    public Person getPerson(Long id) {
        Person person = personDao.getPerson(id);
        return person;
    }
    
    public Person getPerson(String userName){
        return personDao.getPerson(userName);
    }
    
    public List getPersons(){
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List returnList = (List)JSFUtil.getValue("#{ApplicationBean1.persons}", c);

        if(returnList == null){
            returnList = personDao.getPersons();
            JSFUtil.setValue("#{ApplicationBean1.persons}", returnList, c);
            getLogService().log(Level.INFO,"Person list returned not found in cache adding list of " + returnList.size() + " persons to it");
        }else{
            getLogService().log(Level.INFO,"Person list returned from cahce contained " + returnList.size() + " persons");
        }
        return returnList;        
    }
    
    public Long newPerson(Person person){
        getLogService().log(Level.INFO,"Adding new person " + person.getFirstName());
        clearPersonsApplicationCache();
        if(person.getPassWord() == null){
            person.setPassWord(PasswordFactory.getPassword());
        }

        return personDao.newPerson(person);
    }

    public List getInstructors() {
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        List returnList = (List)JSFUtil.getValue("#{ApplicationBean1.instructors}", c);

        if(returnList == null){
            returnList = personDao.getInstructors();
            JSFUtil.setValue("#{ApplicationBean1.instructors}", returnList, c);
            getLogService().log(Level.INFO,"Instructor list returned not found in cache adding list of " + returnList.size() + " persons to it");
        }else{
            getLogService().log(Level.INFO,"Instructor list returned from cahce contained " + returnList.size() + " persons");
        }
        return returnList;
    }

    public Instructor getInstructor(Long id) {
        return personDao.getInstructor(id);
    }

    public void updatePerson(Person person) {
        personDao.updatePerson(person);
    }
    
    private void clearPersonsApplicationCache(){
        Class c = null;
        try {
            c = Class.forName("java.util.List");
        } catch (ClassNotFoundException ex) {
            getLogService().log(Level.SEVERE, null, ex);
        }
        JSFUtil.setValue("#{ApplicationBean1.persons}", null, c);    
    }
    

}
