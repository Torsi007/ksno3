/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.model;

/**
 *
 * @author halsnehauge
 */
public class CoverReference {
    private int id;
    private int version;    
    private String heading;
    private String body;
    private Article article;

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }
    
    

}
