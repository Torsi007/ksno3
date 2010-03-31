/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.ui.jsf.converter;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;
import javax.faces.convert.DateTimeConverter;
import ksno.util.JSFUtil;

/**
 *
 * @author tor.hauge
 */
public class DateConverterPtrnddDotMMDotyy implements Converter {

    DateTimeConverter dateTimeConverter; 
    
    public DateConverterPtrnddDotMMDotyy(){
        dateTimeConverter = new DateTimeConverter();
        dateTimeConverter.setPattern("dd.MM.yy");
        ExternalContext context = JSFUtil.getServletContext();
        String strTimeZone = context.getInitParameter("timeZone");        
        dateTimeConverter.setTimeZone(TimeZone.getTimeZone(strTimeZone));
    }
    
    public Object getAsObject(FacesContext context, UIComponent component, String value) throws ConverterException {
        Date date = (Date)dateTimeConverter.getAsObject(context, component, value);

        Calendar calendar = null;
        if(date != null){
            calendar = Calendar.getInstance();
            calendar.setTimeInMillis(date.getTime());
            calendar.add(Calendar.HOUR, 12);
            date.setTime(calendar.getTimeInMillis());
        }
        return date;

       
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        if(null == value){
            return null;
        }
        Date d = (Date)value;
        Date nd = (Date)d.clone();
        Calendar calendar = null;
        if(nd != null){
            calendar = Calendar.getInstance();
            calendar.setTimeInMillis(nd.getTime());
            calendar.add(Calendar.HOUR, 12);
            nd.setTime(calendar.getTimeInMillis());
        }
        return dateTimeConverter.getAsString(context, component, nd);
    }

}
