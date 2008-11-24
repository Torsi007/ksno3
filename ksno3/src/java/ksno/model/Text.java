/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.regex.Matcher;

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
    private String placeholders;
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
        String temp = getBody();
        Iterator iter = hm.entrySet().iterator();
        while(iter.hasNext()){
            Entry<String, String> entry = (Entry<String, String>)iter.next();
            temp = temp.replaceAll("~" + entry.getKey() + "~", entry.getValue());
        }
        
        return temp;
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

    public String getPlaceholders() {
        return placeholders;
    }

    public void setPlaceholders(String placeholders) {
        this.placeholders = placeholders;
    }

    public String getSubject() {
        return subject;
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
    
    


}
