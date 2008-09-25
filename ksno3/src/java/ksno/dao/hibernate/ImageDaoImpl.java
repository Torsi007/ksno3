/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;
import ksno.dao.ImageDao;
import ksno.model.Image;
import ksno.util.HibernateUtil;
import org.hibernate.Session;
/**
 *
 * @author halsnehauge
 */
public class ImageDaoImpl implements ImageDao {
    public Integer newImage(Image image){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Integer i = (Integer)session.save(image);
        session.getTransaction().commit();
        return i;
        
    }
}
