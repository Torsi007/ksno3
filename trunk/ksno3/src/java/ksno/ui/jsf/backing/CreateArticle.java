/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.ui.jsf.backing;

import javax.faces.component.html.HtmlInputHidden;
import javax.faces.context.FacesContext;
import ksno.model.Article;
import ksno.model.Person;
import ksno.service.ArticleService;
import ksno.service.PersonService;
import org.apache.myfaces.component.html.ext.HtmlInputText;
/**
 *
 * @author halsnehauge
 */
public class CreateArticle {

    ArticleService articleService;
    AddArticleImages addArticleImages;
    PersonService personService;
    private HtmlInputText name;
    Article article;

    public AddArticleImages getAddArticleImages() {
        return addArticleImages;
    }

    public void setAddArticleImages(AddArticleImages addArticleImages) {
        this.addArticleImages = addArticleImages;
    }

    public Article getArticle() {
        return article;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    
    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }
    
    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }
    
    public String createArticle(){
        article = new Article();
        article.setName(name.getValue().toString());
        //article.setBody(body.getValue().toString());
        Person currentUser = personService.getPerson("Tor-Erik");
        article.setAuthor(currentUser);
        Integer i = articleService.newArticle(article);
        if(i != null){
            return "go";
        }else{
            return "nogo";
        }
    }
}
