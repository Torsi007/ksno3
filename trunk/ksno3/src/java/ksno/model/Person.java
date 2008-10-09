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

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.96906DA5-CEA1-70A3-8CE9-23D089AC1DF3]
    // </editor-fold> 
    private int phone;
    private Long id;
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

    public Long getId() {
        return id;
    }

    public void setId(Long studentId) {
        this.id = studentId;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.7913D1A2-DA14-CE7E-5A60-1C3A8C88B808]
    // </editor-fold> 
    public void setId (int studentId) {
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.BC9741C3-32A7-F9AD-7B8F-AC161DEFDC23]
    // </editor-fold> 
    public int getPhone () {
        return phone;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,regenBody=yes,id=DCE.4E0AC9AB-ABA4-56AC-4423-F2641CB526A5]
    // </editor-fold> 
    public void setPhone (int val) {
        this.phone = val;
    }
    

}
