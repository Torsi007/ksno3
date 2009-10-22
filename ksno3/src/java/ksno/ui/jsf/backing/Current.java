/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List; 
import ksno.model.Video;
import ksno.service.PersonService;
import ksno.service.ArticleService;
import ksno.service.VideoService;

/**
 *
 * @author halsnehauge
 */
public class Current {

    List persons;
    PersonService personService;
    ArticleService articleService;
    VideoService videoService;

    public VideoService getVideoService() {
        return videoService;
    }

    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }

    public String getArticleUrl() {
        return "Article.jsp";
    }

    public String getArticle1Url() {
        return "Article1.jsp";
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public List<ksno.model.Article> getArticles() {
        return articleService.getVisibleArticles();
    }

    public List getFirstTwoArticles() {
        List<ksno.model.Article> visibleArticles = this.getArticles();
        Iterator <ksno.model.Article> articleIterator = visibleArticles.iterator();
        List<ksno.model.Article> returnList = new LinkedList<ksno.model.Article>();
        while(articleIterator.hasNext() && returnList.size()<2){
            ksno.model.Article article = articleIterator.next();
            if(article.getFrontPagePosition().equals("default")){
                returnList.add(article);
            }
        }
        return returnList;
    }

    public List getArticlesFromThreeToTen() {
        List<ksno.model.Article> visibleArticles = this.getArticles();
        Iterator <ksno.model.Article> articleIterator = visibleArticles.iterator();
        List<ksno.model.Article> returnList = new LinkedList<ksno.model.Article>();
        int i = 0;
        while(articleIterator.hasNext()){
            ksno.model.Article article = articleIterator.next();
            if(article.getFrontPagePosition().equals("default")){
                i++;
                if(i>2 && i<11){
                    returnList.add(article);
                }
            }
        }
        return returnList;
    }

    public List getFirstThreeVideos() {
        List<ksno.model.Video> visibleVideos = this.getVideoService().getPublishedVideos();
        Iterator <ksno.model.Video> videoIterator = visibleVideos.iterator();
        List<ksno.model.Video> returnList = new LinkedList<ksno.model.Video>();
        while(videoIterator.hasNext() && returnList.size()<3){
            ksno.model.Video video = videoIterator.next();
            returnList.add(video);
        }
        return returnList;
    }

    public List getVideos() {
        return this.getVideoService().getPublishedVideos();
    }

    static final Comparator<ksno.model.Article> ORDER_BY_CAT = new Comparator<ksno.model.Article>(){
        public int compare(ksno.model.Article a1, ksno.model.Article a2){
            return a2.getCategory().getName().compareTo(a1.getCategory().getName());
        }
    };


    public List<ksno.model.Article> getHeadlines(){
        List<ksno.model.Article> visibleArticles = this.getArticles();
        Collections.sort(visibleArticles, ORDER_BY_CAT);
        Iterator <ksno.model.Article> articleIterator = visibleArticles.iterator();
        List<ksno.model.Article> headl = new LinkedList<ksno.model.Article>();

        ksno.model.Article prevArticle = null;
        while(articleIterator.hasNext()){
            ksno.model.Article article = articleIterator.next();
            if(article.getFrontPagePosition().equals("top")){
                if(prevArticle != null){
                    if(article.getCategory().equals(prevArticle.getCategory())){
                        article.setSameAsPrevCat(true);
                    }
                }else{
                    article.setSameAsPrevCat(false);
                }
                headl.add(article);
                prevArticle = article;
            }
        }

        return headl;
    }
    
    public boolean isHaveArticles(){
        List<Article> result = articleService.getArticles();
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
