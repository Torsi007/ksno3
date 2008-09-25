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
    private String body;
    private Date createdDate;
    private Date lastUpdatedDate;
    private Set images = new HashSet();
    private Person author;

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
    
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
    
    public Set getImages() {
        return images;
    }

    public void setImages(Set images) {
        this.images = images;
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
    
    public void addImage(Image image){
        if(image == null){
            throw new IllegalArgumentException("Image to be added is null");
        }
        if(image.getArticle() != null){
            image.getArticle().getImages().remove(image);
        }
        image.setArticle(this);
        images.add(image);
    }
}
