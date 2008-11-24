/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.Text;

/**
 *
 * @author tor.hauge
 */
public interface TextDao {
      public Text getText(Long id);
      public Text getText(String name);      
      public Long newText(Text Text);
      public void updateText(Text Text);
      public void deleteText(Text Text);      
      public List getTexts();
}
