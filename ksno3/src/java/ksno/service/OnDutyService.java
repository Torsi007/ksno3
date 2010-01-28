/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.service;

import java.util.List;
import ksno.model.OnDuty;

/**
 *
 * @author Tor-Erik
 */
public interface OnDutyService {
    public OnDuty getOnDuty(Long id);
    public Long newOnDuty(OnDuty onDuty);
    public void updateOnDuty(OnDuty onDuty);
    public void deleteOnDuty(OnDuty onDuty);
    public List<OnDuty> getOnDutys();
    public OnDuty getCurrentlyOnDuty();
    public List<OnDuty> getUpcomingOnDutys();
}
