/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.backing;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIData;
import ksno.model.Category;
import ksno.service.ArticleCategoryService;
import ksno.util.JSFUtil;
import org.apache.myfaces.component.html.ext.HtmlInputText;
import org.apache.myfaces.component.html.ext.HtmlOutputText;

/**
 *
 * @author tor.hauge
 */
public class ArticleCategoryMaintain {
    ArticleCategoryService articleCategoryService;
    private HtmlInputText name;
    private HtmlInputText description;
    private HtmlInputText newName;
    private HtmlInputText newDescription;
    private UIData data;
    private HtmlOutputText errorMsg;

    // <editor-fold defaultstate="collapsed" desc=" getters and setters">
    public HtmlInputText getNewDescription() {
        return newDescription;
    }

    public void setNewDescription(HtmlInputText newDescription) {
        this.newDescription = newDescription;
    }

    public HtmlInputText getNewName() {
        return newName;
    }

    public void setNewName(HtmlInputText newName) {
        this.newName = newName;
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


    public HtmlInputText getDescription() {
        return description;
    }

    public void setDescription(HtmlInputText description) {
        this.description = description;
    }

    public ArticleCategoryService getArticleCategoryService() {
        return articleCategoryService;
    }

    public void setArticleCategoryService(ArticleCategoryService articleCategoryService) {
        this.articleCategoryService = articleCategoryService;
    }

    public HtmlOutputText getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(HtmlOutputText errorMsg) {
        this.errorMsg = errorMsg;
    }
    
    private Logger getLogService(){
      return Logger.getLogger(this.getClass().getName());
    }   
    // </editor-fold>
    
    public List getArticleCategorys(){
        return articleCategoryService.getArticleCategorys();
    }

   public String articleCategoryDelete(){
       String returnVal = "sucess";
        try{
           Category category = (Category)this.getData().getRowData();
           articleCategoryService.deleteArticleCategory(category);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to delete article", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }

       return returnVal;
    }

    public String articleCategoryCreate(){
        String returnVal = "success";
        try{
            Category category = new Category();
            category.setName(getNewName().getValue().toString());
            category.setDescription(getNewDescription().getValue().toString());
            articleCategoryService.newArticleCategory(category);
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to create article", e);
            errorMsg.setValue("Artikkelen ble ikke lagret, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
        return returnVal;
    }

   public String articleCategorysUpdate(){
       String returnVal = "sucess";
        try{
            List articleCategorys = (List)getData().getValue();
            for(int i = 0; i< articleCategorys.size(); i++){
                Category category = (Category)articleCategorys.get(i);
                articleCategoryService.updateArticleCategory(category);
            }
        }catch(Exception e){
            getLogService().log(Level.SEVERE,"Unable to update articles", e);
            errorMsg.setValue("Operasjonen feilet, forsøk på nytt. Detaljert feilmelding: " + e.getMessage());
            returnVal = "no";
        }
       return returnVal;
    }   
   

}
