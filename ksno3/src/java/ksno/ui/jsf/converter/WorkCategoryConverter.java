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
import ksno.dao.hibernate.WorkCategoryDaoImpl;
import ksno.model.Category;
import ksno.model.Person;
import ksno.model.WorkCategory;
import ksno.service.WorkCategoryService;
import ksno.service.WorkCategoryServiceImpl;
import ksno.service.PersonService;
import ksno.service.PersonServiceImpl;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class WorkCategoryConverter implements Converter {

    private Logger getLogService(){
      return Logger.getLogger(WorkCategoryConverter.class.getName());
    }

    private WorkCategoryService getWorkCategoryService(){
        WorkCategoryService service = null;
        try {
            service = (WorkCategoryService) JSFUtil.getBeanValue("#{WorkCategoryService}", WorkCategoryService.class);
            //return (ArticleCategoryService)FacesContextUtils.getWebApplicationContext(context).getBean("articleCategoryService");
        } catch (Exception ex) {
            Logger.getLogger(WorkCategoryConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }

    public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
        getLogService().log(Level.INFO,"About to convert " + value + " to a Category");
        //ArticleCategoryDaoImpl dao = new ArticleCategoryDaoImpl();
        //return dao.getArticleCategory(Long.parseLong(value));
        return getWorkCategoryService().getWorkCategory(Long.parseLong(value));
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        
        if(null == value){
            return null;
        }
        getLogService().log(Level.INFO,"About to convert " + value.toString() + " to a string");
        WorkCategory category = (WorkCategory)value;
        return category.getId().toString();


    }

}
