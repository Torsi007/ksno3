/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import ksno.service.CoverReferenceService;

/**
 *
 * @author halsnehauge
 */
public class Current {
    List coverReferences;
    CoverReferenceService coverReferenceService;
    String articleUrl;

    public String getArticleUrl() {
        return "faces/Article.jsp";
    }

    public void setArticleUrl(String articleUrl) {
        this.articleUrl = articleUrl;
    }

    public CoverReferenceService getCoverReferenceService() {
        return coverReferenceService;
    }

    public void setCoverReferenceService(CoverReferenceService coverReferenceService) {
        this.coverReferenceService = coverReferenceService;
    }

    public List getCoverReferences() {
        return coverReferenceService.getCoverReferences();
    }

    public void setCoverReferences(List coverReferences) {
        this.coverReferences = coverReferences;
    }
}
