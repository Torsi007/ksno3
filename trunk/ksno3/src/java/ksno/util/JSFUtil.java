/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Map;
import javax.faces.application.Application;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
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
    
    public static Object getBeanValue(String ELexpression, Class clazz) throws Exception{
        Object returnVal;
        FacesContext fc = FacesContext.getCurrentInstance();
        Application application = fc.getApplication();
        returnVal = (Object) application.evaluateExpressionGet(fc, ELexpression, clazz);          
        return returnVal;
    }
    
    public static HttpServletRequest getRequest(){
        return (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
    }

    public static Map<String,Object> getSessionMap() {
        return FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
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
    
    public static final String sessionBeanArticleModify = "ArticleModify";
    

}
