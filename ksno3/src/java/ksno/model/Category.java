/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

/**
 *
 * @author Roger
 */
public class Category implements LabelValuePair {

    private Long id;
    private int version;
    String name;
    String description;

    // <editor-fold defaultstate="collapsed" desc=" Getters and setters">
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc=" equals and hashcode">
        @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        final Category other = (Category) obj;

        if ((this.getName() == null) ? (other.getName() != null) : !this.getName().equals(other.getName())) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + (this.name != null ? this.name.hashCode() : 0);
        return hash;
    }

    public String getLabel() {
        return this.getName();
    }

    public String getValue() {
        return this.getName();
    }
    // </editor-fold>
}
