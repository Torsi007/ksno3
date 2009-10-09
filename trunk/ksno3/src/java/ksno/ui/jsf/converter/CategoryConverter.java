/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.converter;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import ksno.dao.hibernate.ArticleCategoryDaoImpl;
import ksno.model.Category;
import ksno.model.Person;
import ksno.service.ArticleCategoryService;
import ksno.service.ArticleCategoryServiceImpl;
import ksno.service.PersonService;
import ksno.service.PersonServiceImpl;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class CategoryConverter implements Converter {

    private Logger getLogService(){
      return Logger.getLogger(CategoryConverter.class.getName());
    }

    private ArticleCategoryService getArticleCategoryService(){
        ArticleCategoryService service = null;
        try {
            service = (ArticleCategoryService) JSFUtil.getBeanValue("#{ArticleCategoryService}", ArticleCategoryService.class);
            //return (ArticleCategoryService)FacesContextUtils.getWebApplicationContext(context).getBean("articleCategoryService");
        } catch (Exception ex) {
            Logger.getLogger(CategoryConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }

    public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
        getLogService().log(Level.INFO,"About to convert " + value + " to a Category");
        //ArticleCategoryDaoImpl dao = new ArticleCategoryDaoImpl();
        //return dao.getArticleCategory(Long.parseLong(value));
        return getArticleCategoryService().getArticleCategory(Long.parseLong(value));
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        getLogService().log(Level.INFO,"About to convert " + value.toString() + " to a string");
        if(null == value){
            return null;
        }
        Category category = (Category)value;
        return category.getId().toString();


    }

}
