/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.dao.CoverReferenceDao;

/**
 *
 * @author halsnehauge
 */
public class CoverReferenceServiceImpl implements CoverReferenceService {
    private CoverReferenceDao coverReferenceDao;

    public CoverReferenceDao getCoverReferenceDao() {
        return coverReferenceDao;
    }

    public void setCoverReferenceDao(CoverReferenceDao coverReferenceDao) {
        this.coverReferenceDao = coverReferenceDao;
    }
    
    public List getCoverReferences() {
        return coverReferenceDao.getCoverReferences();
    }

}
