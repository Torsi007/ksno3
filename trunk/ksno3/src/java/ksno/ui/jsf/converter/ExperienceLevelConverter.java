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
import ksno.model.ExperienceLevel;
import ksno.service.ExperienceLevelService;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class ExperienceLevelConverter implements Converter {

    private Logger getLogService(){
      return Logger.getLogger(ExperienceLevelConverter.class.getName());
    }

    private ExperienceLevelService getExperienceLevelService(){
        ExperienceLevelService service = null;
        try {
            service = (ExperienceLevelService) JSFUtil.getBeanValue("#{ExperienceLevelService}", ExperienceLevelService.class);
            //return (ArticleCategoryService)FacesContextUtils.getWebApplicationContext(context).getBean("articleCategoryService");
        } catch (Exception ex) {
            Logger.getLogger(ExperienceLevelConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }

    public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
        getLogService().log(Level.INFO,"About to convert " + value + " to a Category");
        //ArticleCategoryDaoImpl dao = new ArticleCategoryDaoImpl();
        //return dao.getArticleCategory(Long.parseLong(value));
        return getExperienceLevelService().getExperienceLevel(Long.parseLong(value));
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        
        if(null == value){
            return null;
        }
        getLogService().log(Level.INFO,"About to convert " + value.toString() + " to a string");
        ExperienceLevel level = (ExperienceLevel)value;
        return level.getId().toString();


    }

}
