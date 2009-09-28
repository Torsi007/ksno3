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
    private Long id;
    private int version;
    private String name;
    private String body;
    private String intro;
    private Category category;
    private boolean sameAsPrevCat = false;
    private String frontPagePosition = "default";
    private String avatarUrl;
    private Date createdDate;
    private Date lastUpdatedDate;
    private Set images = new HashSet();
    private Person author;
    private boolean visible;
    
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
    
    // <editor-fold defaultstate="collapsed" desc=" Getters and setters">
    public boolean isSameAsPrevCat() {
        return sameAsPrevCat;
    }

    public void setSameAsPrevCat(boolean val) {
        this.sameAsPrevCat = val;
    }

    public String getFrontPagePosition() {
        return frontPagePosition;
    }

    public void setFrontPagePosition(String frontPagePosition) {
        this.frontPagePosition = frontPagePosition;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public Long getId() {
        return id;
    }

    private void setId(Long id) {
        this.id = id;
    }
    
    public String getIntro() {
        return intro.replaceAll("<p>", "").replaceAll("</p>", "");
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

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
    
    // </editor-fold>
    
    
    
    // <editor-fold defaultstate="collapsed" desc=" equals and hashcode">       
    
    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Article other = (Article) obj;
        if (this.name != other.name && (this.name == null || !this.name.equals(other.name))) {
            return false;
        }
        if (this.createdDate != other.createdDate && (this.createdDate == null || !this.createdDate.equals(other.createdDate))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 17 * hash + (this.name != null ? this.name.hashCode() : 0);
        hash = 17 * hash + (this.createdDate != null ? this.createdDate.hashCode() : 0);
        return hash;
    }
    // </editor-fold>    
}
