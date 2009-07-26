/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

import java.io.Serializable;
import java.util.Calendar;

/**
 *
 * @author Tor-Erik
 */
public class Video implements Serializable {
    private Long id;
    private int version;    
    private String name;
    private String url;
    private String thumbnail;
    private Person owner;
    private Article article;
    private Calendar createdDate;
    private Calendar lastUpdatedDate;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    
    public Calendar getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Calendar createdDate) {
        this.createdDate = createdDate;
    }

    public Calendar getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Calendar lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }


    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

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

    public Person getOwner() {
        return owner;
    }

    public void setOwner(Person owner) {
        this.owner = owner;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }
    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc=" equals and override">
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Video other = (Video) obj;
        if (this.getName() != other.getName() && (this.getName() == null || !this.getName().equals(other.getName()))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 17 * hash + (this.getName() != null ? this.getName().hashCode() : 0);
        return hash;
    }
    // </editor-fold>

}
