/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Tor-Erik
 */
public class Person implements Serializable, LabelValuePair {

    private int phone;
    private Long id;
    private int version;
    String lastName;
    String firstName;
    String userName;
    String passWord;
    private Set participations = new HashSet();
    private Set roles = new HashSet();
    boolean allowMail;
    boolean uiSendMail;
    String companyName;
    String companyNumber;
    String streetName;
    String streetNumber;
    String zipCode;
    String city;
    private String profilePicture;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">  
    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyNumber() {
        return companyNumber;
    }

    public void setCompanyNumber(String companyNumber) {
        this.companyNumber = companyNumber;
    }

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
    

    public boolean isUiSendMail() {
        return uiSendMail;
    }

    public void setUiSendMail(boolean uiSendMail) {
        this.uiSendMail = uiSendMail;
    }
    
    public boolean isAllowMail() {
        return allowMail;
    }

    public void setAllowMail(boolean allowMail) {
        this.allowMail = allowMail;
    }    
    
    public Set getRoles() {
        return roles;
    }

    public void setRoles(Set roles) {
        this.roles = roles;
    }
    
    

    public Set getParticipations() {
        return participations;
    }

    public void setParticipations(Set participations) {
        this.participations = participations;
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

    public int getPhone () {
        return phone;
    }


    public void setPhone (int val) {
        this.phone = val;
    }

    public String getLabel() {
        return getFirstName() + " " + getLastName();
    }

    public String getValue() {
         return Long.toString(id);
    }    
    // </editor-fold>
    
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
    
    public void addRole(UserRoles userRole){
        if(userRole == null){
            throw new IllegalArgumentException("Participation to be added is null");
        }
        if(userRole.getUser() != null){
            userRole.getUser().getRoles().remove(userRole);
        }
        userRole.setUser(this);
        roles.add(userRole);    
    }
    
    public Person(){};

    public Person(String lastName, String firstName, String userName, String passWord) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.userName = userName;
        this.passWord = passWord;
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
        hash = 97 * hash + (this.lastName != null ? this.lastName.hashCode() : 0);
        hash = 97 * hash + (this.firstName != null ? this.firstName.hashCode() : 0);
        hash = 97 * hash + (this.userName != null ? this.userName.hashCode() : 0);
        hash = 97 * hash + (this.passWord != null ? this.passWord.hashCode() : 0);
        return hash;
    }

 }
