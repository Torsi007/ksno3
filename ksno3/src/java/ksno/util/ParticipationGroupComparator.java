/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.util;

import java.util.Comparator;
import ksno.model.Participation;

/**
 *
 * @author HalsneHauge
 */
public class ParticipationGroupComparator implements Comparator<Participation> {

    public int compare(Participation o1, Participation o2) {
        return o1.getWorkGroup().compareTo(o2.getWorkGroup());
    }
}


