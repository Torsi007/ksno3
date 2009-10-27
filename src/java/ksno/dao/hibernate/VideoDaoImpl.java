/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao.hibernate;
import java.util.List;
import ksno.dao.VideoDao;
import ksno.model.Video;
import ksno.model.Category;
import ksno.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Query;
/**
 *
 * @author halsnehauge
 */
public class VideoDaoImpl implements VideoDao {
    public Long newVideo(Video video){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Long l;
        try{
            l = (Long)session.save(video);
        }finally{
            //session.getTransaction().commit();
            //session.close();          
        }
        return l;        
        
    }

    public Video getVideo(Long id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        Video Video = (Video)session.get(Video.class,id);
        return Video;
    }

    public void updateVideo(Video video) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        try{
            session.saveOrUpdate(video);
        }catch(Exception e){
            session.merge(video);
        }finally{
            //session.getTransaction().commit();
            //session.close();
        }
    }

    public void deleteVideo(Video video) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        try{
            session.delete(video);
        }finally{
            //session.getTransaction().commit();
            //session.close();
        }
    }

    public List<Video> getVideos() {
        Query q = null;
        List returnVal = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        //session.beginTransaction();
        q=session.createQuery("from Video a order by a.createdDate desc");
        returnVal =  q.list();
        return returnVal;
    }

}
