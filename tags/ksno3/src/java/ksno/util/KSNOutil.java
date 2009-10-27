/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tor.hauge
 */
public class KSNOutil {
    
    private static Logger getLogService(){
      return Logger.getLogger(KSNOutil.class.getName());
    }    

    public static String injectPlaceHolders(String stringToBeInjected, HashMap<String, String> placeHolderValueMap) {
        getLogService().log(Level.INFO,"Start");
        String temp = stringToBeInjected;
        if(stringToBeInjected != null && !"".equals(stringToBeInjected) && placeHolderValueMap != null){
        Iterator iter = placeHolderValueMap.entrySet().iterator();
            while(iter.hasNext()){
                Entry<String, String> entry = (Entry<String, String>)iter.next();
                temp = temp.replaceAll("~" + entry.getKey() + "~", entry.getValue());
            }        
        }
        getLogService().log(Level.INFO,"Return");
        return temp;
    }

    
}
