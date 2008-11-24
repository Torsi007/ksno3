/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Date;
import java.util.List;
import ksno.dao.TextDao;
import ksno.model.Text;


/**
 *
 * @author tor.hauge
 */
public class TextServiceImpl implements TextService {
   private TextDao textDao;
    
    public TextDao getTextDao() {
        return textDao;
    }

    public void setTextDao(TextDao TextDao) {
        this.textDao = TextDao;
    }

    public Text getText(Long id) {
        return textDao.getText(id);
    }

    public Long newText(Text text) {
        if(text.getCreatedDate() == null){
            text.setCreatedDate(new Date());
            text.setLastUpdatedDate(text.getCreatedDate());
        }
        return textDao.newText(text);
    }

    public void updateText(Text text) {
        textDao.updateText(text);
    }
    
    public void deleteText(Text text) {
        textDao.deleteText(text);
    }
    
    public List getTexts() {
        return textDao.getTexts();
    }

    public Text getText(String name) {
        return textDao.getText(name);
    }
}
