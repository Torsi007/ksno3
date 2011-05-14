/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Tor-Erik Halsne Hauge
 */
public class Util {

    public static String prettyPrintTime(Long strDur) {
        int sec = (int) (strDur % 60);
        String seconds = (sec < 0)?"0"+sec:""+sec;
        int min = (int) Math.floor(strDur/60);
        String minutes = (min < 0)?"0"+min:""+min;
        return minutes + ":" + seconds;
    }

    public static List getAsList(Set set) {
        List<Object> list = null;
        if(set != null){
            list = new ArrayList<Object>(set);
        }
        return list;
    }


}
