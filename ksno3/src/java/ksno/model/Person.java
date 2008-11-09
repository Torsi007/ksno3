/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Tor-Erik
 */
public class Person implements Serializable, LabelValuePair {

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.96906DA5-CEA1-70A3-8CE9-23D089AC1DF3]
    // </editor-fold> 
    private int phone;
    private Long id;
    private int version;
    private Date dateOfBirth;
    String lastName;
    String firstName;
    String userName;
    String passWord;
    private Set participations = new HashSet();

    public Set getParticipations() {
        return participations;
    }

    public void setParticipations(Set participations) {
        this.participations = participations;
    }    
    
    public void addParticipation(Participation participation){
        if(participation == null){
            throw new IllegalArgumentException("Participation to be added is null");
        }
        if(participation.getParticipant() != null){
            participation.getParticipant().getParticipations().remove(participation);
        }
        participation.setParticipant(this);
        participations.add(participation);
    }

    public Person(){};

    public Person(String lastName, String firstName, String userName, String passWord) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.userName = userName;
        this.passWord = passWord;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
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

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Person other = (Person) obj;
        if (this.dateOfBirth != other.dateOfBirth && (this.dateOfBirth == null || !this.dateOfBirth.equals(other.dateOfBirth))) {
            return false;
        }
        if (this.lastName != other.lastName && (this.lastName == null || !this.lastName.equals(other.lastName))) {
            return false;
        }
        if (this.firstName != other.firstName && (this.firstName == null || !this.firstName.equals(other.firstName))) {
            return false;
        }
        if (this.userName != other.userName && (this.userName == null || !this.userName.equals(other.userName))) {
            return false;
        }
        if (this.passWord != other.passWord && (this.passWord == null || !this.passWord.equals(other.passWord))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + (this.dateOfBirth != null ? this.dateOfBirth.hashCode() : 0);
        hash = 97 * hash + (this.lastName != null ? this.lastName.hashCode() : 0);
        hash = 97 * hash + (this.firstName != null ? this.firstName.hashCode() : 0);
        hash = 97 * hash + (this.userName != null ? this.userName.hashCode() : 0);
        hash = 97 * hash + (this.passWord != null ? this.passWord.hashCode() : 0);
        return hash;
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

    public String getLabel() {
        return getFirstName() + " " + getLastName();
    }

    public String getValue() {
         return Long.toString(id);
    }
 }
