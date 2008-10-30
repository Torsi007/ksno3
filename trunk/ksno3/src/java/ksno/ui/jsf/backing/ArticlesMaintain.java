/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import javax.faces.component.UIData;
import ksno.model.Article;
import ksno.service.ArticleService;
import ksno.service.ImageService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;

/**
 *
 * @author halsnehauge
 */
public class ArticlesMaintain {
    private ArticleService articleService;
    private ImageService imageService;

    public ImageService getImageService() {
        return imageService;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }
    private HtmlInputText name;
    private UIData data;

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public UIData getData() {
        return data;
    }

    public void setData(UIData data) {
        this.data = data;
    }

    public HtmlInputText getName() {
        return name;
    }

    public void setName(HtmlInputText name) {
        this.name = name;
    }
    
    public List getArticles(){
        return articleService.getArticles();
    }
    
    public String selectEditArticle(){
        
       Article articleModify = (Article)this.getData().getRowData();
       JSFUtil.getSessionMap().put(JSFUtil.sessionBeanArticleModify, articleModify);
        return "articleMasterUpdate";
    }
    
    
    public String picasaTest(){    
        return "test";
    }
    
    
}
