/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.io.Serializable;

/**
 *
 * @author Roger
 */
public class ExperienceLevel implements LabelObjectValuePair, LabelValuePair, Serializable {

    private Long id;
    private int version;
    private String name;
    private int rank;

    // <editor-fold defaultstate="collapsed" desc=" Getters and setters">
    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStringId(){
        return this.id.toString();
    }

     public void setStringId(String id){
        this.id = Long.parseLong(id);
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
    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc=" equals and hashcode">
        @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        final ExperienceLevel other = (ExperienceLevel) obj;

        if ((this.getId() == null) ? (other.getId() != null) : !this.getId().equals(other.getId())) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "WorkCategory: " + this.getName();
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

    public Object getObject() {
        return this;
    }

    public String getValue() {
        return this.getId().toString();
    }


    // </editor-fold>
}
