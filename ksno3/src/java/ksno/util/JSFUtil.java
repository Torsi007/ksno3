/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import javax.el.ValueExpression;
import javax.faces.application.Application;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;
import ksno.model.LabelValuePair;
import org.apache.myfaces.component.html.ext.HtmlOutputText;
import org.apache.myfaces.custom.fileupload.UploadedFile;

/**
 *
 * @author halsnehauge
 */
public class JSFUtil {
    
    public static String getStringValue(String ELexpression) throws Exception{
        String returnVal;
        FacesContext fc = FacesContext.getCurrentInstance();        
        Application application = fc.getApplication();
        returnVal = (String) application.evaluateExpressionGet(fc, ELexpression, String.class);   
        return returnVal;
    }
    
    public static Object getValue(String expr, Class c) {
        FacesContext context = FacesContext.getCurrentInstance();                
        ValueExpression ve = context.getApplication().getExpressionFactory().createValueExpression(context.getELContext(), expr, c);
        if (ve != null) {
            return ve.getValue(context.getELContext());
        }
        return null;
    }
    
    public static void setValue(String expr, Object value, Class c) {
        FacesContext context = FacesContext.getCurrentInstance();                        
        ValueExpression ve = context.getApplication().getExpressionFactory().createValueExpression(context.getELContext(), expr, c);
        if (ve != null) {
            ve.setValue(context.getELContext(), value);
        }
    }

  

    
    public static Object getBeanValue(String ELexpression, Class clazz) throws Exception{
        Object returnVal;
        FacesContext fc = FacesContext.getCurrentInstance();
        Application application = fc.getApplication();
        returnVal = (Object) application.evaluateExpressionGet(fc, ELexpression, clazz);          
        return returnVal;
    }
    
    public static String getCurrentUserName(){
        return getRequest().getUserPrincipal().getName();
    }
    
    public static ExternalContext getServletContext(){
        return FacesContext.getCurrentInstance().getExternalContext();
    }
    
    public static HttpServletRequest getRequest(){
        return (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
    }

    public static Map<String,Object> getSessionMap() {
        return FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
    }

    public static SelectItem[] toSelectItemArray(List events) {
        return JSFUtil.toSelectItemArray(events, false);
    }
    
    public static SelectItem[] toSelectItemArray(List events, boolean includeEmpty) {
        SelectItem[] selectItems = null;
        if(includeEmpty){
            selectItems = new SelectItem[events.size() + 1];
            selectItems[0] = new SelectItem("-1","<Please select>");
            for(int i = 1; i< selectItems.length; i++){
                LabelValuePair kvp = (LabelValuePair)events.get(i - 1);
                selectItems[i] = new SelectItem(kvp.getValue(),kvp.getLabel());
            }
        }else{
            selectItems = new SelectItem[events.size()];
            for(int i = 0; i< selectItems.length; i++){
                LabelValuePair kvp = (LabelValuePair)events.get(i);
                selectItems[i] = new SelectItem(kvp.getValue(),kvp.getLabel());
            }        
        }
        return selectItems;        
    }
    
    public static String uploadImage(UploadedFile file, HtmlOutputText result){
        String strReturn = null;
        try{
            InputStream stream = file.getInputStream();
            String fromFullFileName = file.getName();
            if(file.getContentType().indexOf("jpeg") == -1){
                throw new Exception("Uppload failed, only jpeg images are allowed, this file attempted uploaded was of type " + file.getContentType());
            }
            String toPath = JSFUtil.getStringValue("#{prop.image_repo}");
            String fileName = fromFullFileName.substring(fromFullFileName.lastIndexOf("\\")+1);
            String uniqueFileName = getUniqueFileName(toPath, fileName, "");  
            String toFullFileName = toPath + uniqueFileName;
            long size = file.getSize();
            byte[] buffer = new byte[(int) size];
            stream.read(buffer, 0, (int) size);
            stream.close();
            FileOutputStream fos = new FileOutputStream(toFullFileName);
            fos.write(buffer);
            fos.close();        
            strReturn = JSFUtil.getStringValue("#{prop.image_context_path}") + uniqueFileName;
        }catch (Exception ioe) {
            if(result != null){
                result.setValue("File uploaded failed. " + ioe.getMessage());
            }
        }
        return strReturn;
    }
    
    private static String getUniqueFileName(String toPath, String fileName, String ext) {
        String[] nameAndType = fileName.split("\\.");
        String uniqueFileName = nameAndType[0] + ext + "." + nameAndType[1];
        File file = new File(toPath + uniqueFileName);
        if(file.exists()){
            int i = (int) (Math.random() * 10000);
            return getUniqueFileName(toPath, uniqueFileName, Integer.toHexString(i));
        }else{
            return uniqueFileName;
        }
    }
    
    public static String sessionBeanTextModify = "TextModify";
    public static final String sessionBeanArticleModify = "ArticleModify";
    public static final String sessionBeanEventModify = "EventModify";    
    public static final String sessionBeanSignedOnEvent = "SignedOnEvent";    
    public static final String sessionBeanParticipationModify = "ParticipationModify";
    public static final String sessionBeanTransactionModify = "TransactionModify";    
    public static final String roleAuthUser = "authuser";

}
