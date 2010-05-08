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
public class CalendarConverter implements Converter {

    DateTimeConverter dateTimeConverter; 
    
    public CalendarConverter(){
        dateTimeConverter = new DateTimeConverter();
        dateTimeConverter.setPattern("yyyy-MM-dd");
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
        }
        return calendar;
    }

    public String getAsString(FacesContext context, UIComponent component, Object value) throws ConverterException {
        if(null == value){
            return null;
        }
        Calendar tcalendar = (Calendar)value;
        Calendar calendar = (Calendar)tcalendar.clone();
        Date d = new Date(calendar.getTimeInMillis());
        return dateTimeConverter.getAsString(context, component, d);
    }

}
