/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

/**
 *
 * @author Roger
 */
public class YouTubeUploadUrlAndToken {

    public String getToken() {
        return token;
    }

    public YouTubeUploadUrlAndToken(String url, String token) {
        this.url = url;
        this.token = token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    private String url;
   private String token;

}
