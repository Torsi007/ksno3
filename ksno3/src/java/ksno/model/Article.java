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
public class Article implements Serializable {
    private int id;
    private int version;
    private String name;
    private Date createdDate;
    private Date lastUpdatedDate;
    private Set sections = new HashSet();
    private Person author;

    public Person getAuthor() {
        return author;
    }

    public void setAuthor(Person author) {
        this.author = author;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }    
    
    public Set getSections() {
        return sections;
    }

    public void setSections(Set sections) {
        this.sections = sections;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Date lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public void addSection(Section section){
        if(section == null){
            throw new IllegalArgumentException("Section to be added is null");
        }
        if(section.getArticle() != null){
            section.getArticle().getSections().remove(section);
        }
        section.setArticle(this);
        sections.add(section);
    }
}
