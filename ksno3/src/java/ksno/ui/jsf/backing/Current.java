/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List; 
import ksno.service.PersonService;
import ksno.service.ArticleService;

/**
 *
 * @author halsnehauge
 */
public class Current {

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.177A5D44-BFF0-529F-1BA4-66190D1DD9E3]
    // </editor-fold> 
    List persons;

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.4AC25B9D-F2B3-05A6-4150-16A3C8960ED7]
    // </editor-fold> 
    PersonService personService;
    ArticleService articleService;

    public String getArticleUrl() {
        return "Article.jsp";
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public List getArticles() {
        return articleService.getArticles();
    }
    
    public boolean isHaveArticles(){
        List result = articleService.getArticles();
        if(result != null && !result.isEmpty()){
            return false;
        }else{
            return true;
        }
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.65B316FE-0B9C-47D0-CDF0-4F463826DBA2]
    // </editor-fold> 
    public PersonService getPersonService () {
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.48605C27-C826-C69A-F815-926F42E1CA7C]
    // </editor-fold> 
    public void setPersonService (PersonService personService) {
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.552E08F5-6B88-44FF-A984-CCBC2B9C6BEA]
    // </editor-fold> 
    public List getPersons () {
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc=" UML Marker "> 
    // #[regen=yes,id=DCE.CEB8D580-C6A8-9418-7BFF-CFD154EF868F]
    // </editor-fold> 
    public void setPersons (List persons) {
    }
}
