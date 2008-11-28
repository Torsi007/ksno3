/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.util.Date;
import java.util.HashMap;
import ksno.util.KSNOutil;

/**
 *
 * @author tor.hauge
 */
public class Text {
    private Long id;
    private int version;
    private String name;
    private String body;
    private String subject; 
    private Date createdDate;
    private Date lastUpdatedDate;
    private Person author;

    public Person getAuthor() {
        return author;
    }

    public void setAuthor(Person author) {
        this.author = author;
    }

    public String getBody() {
        return body;
    }

    public String getBody(HashMap<String, String> hm) {
        return KSNOutil.injectPlaceHolders(this.getBody(), hm);
    }
    
    public void setBody(String body) {
        this.body = body;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getSubject() {
        return subject;
    }
    
    public String getSubject(HashMap<String, String> hm) {
       return KSNOutil.injectPlaceHolders(this.getSubject(), hm);
    }    

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Text other = (Text) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        if (this.subject != other.subject && (this.subject == null || !this.subject.equals(other.subject))) {
            return false;
        }
        if (this.createdDate != other.createdDate && (this.createdDate == null || !this.createdDate.equals(other.createdDate))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + (this.id != null ? this.id.hashCode() : 0);
        hash = 29 * hash + (this.name != null ? this.name.hashCode() : 0);
        hash = 29 * hash + (this.subject != null ? this.subject.hashCode() : 0);
        hash = 29 * hash + (this.createdDate != null ? this.createdDate.hashCode() : 0);
        return hash;
    }
    
    


}
