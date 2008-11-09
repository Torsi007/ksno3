/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.util;

import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;

/**
 *
 * @author tor.hauge
 */
public class KSNOPhaseListener implements PhaseListener {


    public void afterPhase(PhaseEvent pe) {
        //throw new UnsupportedOperationException("Not supported yet.");
    }

    public void beforePhase(PhaseEvent pe) {
        if(pe.getPhaseId() == PhaseId.APPLY_REQUEST_VALUES){
            int i = 0;
        }
    }

    public PhaseId getPhaseId() {
        return PhaseId.ANY_PHASE;
    }

}
