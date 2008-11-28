/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.Email;
import ksno.model.Text;

/**
 *
 * @author tor.hauge
 */
public interface TextService {
    public Text getText(Long id);
    public Text getText(String name);    
    public Long newText(Text Text);
    public void updateText(Text Text);
    public void deleteText(Text Text);
    public List getTexts();
    public Email getEmail(String name);
}
