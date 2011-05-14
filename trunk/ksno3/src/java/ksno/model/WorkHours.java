/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.io.Serializable;
import java.util.Calendar;

/**
 *
 * @author Roger
 */
public class WorkHours implements Serializable {

    private Long id;
    private int version;
    private WorkTask workTask;
    private int hours;
    private Calendar workDate;
    private Instructor instructor;
    private String description;
    boolean uIChecked;


    // <editor-fold defaultstate="collapsed" desc="getters and setters">
    public boolean isuIChecked() {
        return uIChecked;
    }

    public void setuIChecked(boolean uIChecked) {
        this.uIChecked = uIChecked;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

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

    public Calendar getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Calendar workDate) {
        this.workDate = workDate;
    }

    public WorkTask getWorkTask() {
        return workTask;
    }

    public void setWorkTask(WorkTask workTask) {
        this.workTask = workTask;
    }

    // </editor-fold>


    // <editor-fold defaultstate="collapsed" desc=" equals and hashcode">
        @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        final WorkTask other = (WorkTask) obj;

        if ((this.getId() == null) ? (other.getId() != null) : !this.getId().equals(other.getId())) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Work task: " + this.getWorkTask().getWorkCategory().getName() + " : " + this.getWorkTask().getName() + ":" + this.getWorkDate().toString() + ": " + Integer.toString(hours) + "hours";
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + (this.getId() != null ? this.getId().hashCode() : 0);
        return hash;
    }
    // </editor-fold>
}
