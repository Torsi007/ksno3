/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

/**
 *
 * @author tor.hauge
 */
public class UserRoles {
    private Person user;
    private String role;
    private Long id;
    private int version;
    
    
    // <editor-fold defaultstate="collapsed" desc=" getters and setters">

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Person getUser() {
        return user;
    }

    public void setUser(Person user) {
        this.user = user;
    }    
    // </editor-fold>


}
