/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.io.Serializable;

/**
 *
 * @author Tor-Erik
 */
public class Person implements Serializable {
    private int id;
    private int version;
    String lastName;
    String firstName;
    String userName;
    String passWord;

    public Person(){};

    public Person(String lastName, String firstName, String userName, String passWord) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.userName = userName;
        this.passWord = passWord;
    }
    
    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String password) {
        this.passWord = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public int getVersion() {
    return version;
    }
    
    public void setVersion(int version) {
    this.version = version;
    }   
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getId() {
        return id;
    }

    public void setId(int studentId) {
        this.id = studentId;
    }
    

}
