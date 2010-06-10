/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author HalsneHauge
 */
public class DateConverter {
    public static String getAsString(Date date) {
        if(null == date){
            return null;
        }
        Calendar calendar = null;
        if(date != null){
            calendar = Calendar.getInstance();
            calendar.setTimeInMillis(date.getTime());
            calendar.add(Calendar.HOUR, 12);
            date.setTime(calendar.getTimeInMillis());
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

}
