/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import javax.faces.application.Application;
import javax.faces.context.FacesContext;

/**
 *
 * @author halsnehauge
 */
public class JSFVariableResolver {
    
    public static String getStringValue(FacesContext fc, String ELexpression) throws Exception{
        String returnVal;
        Application application = fc.getApplication();
        returnVal = (String) application.evaluateExpressionGet(fc, ELexpression, String.class);            
        return returnVal;
    }
    
    public static Object getBeanValue(FacesContext fc, String ELexpression, Class clazz) throws Exception{
        Object returnVal;
        Application application = fc.getApplication();
        returnVal = (Object) application.evaluateExpressionGet(fc, ELexpression, clazz);          
        return returnVal;
    }

}
