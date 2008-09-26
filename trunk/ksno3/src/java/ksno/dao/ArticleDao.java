/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;
import java.util.List;
import ksno.model.Article;

/**
 *
 * @author Tor-Erik
 */
public interface ArticleDao {
      public Article getArticle(final Integer id);
      public Integer newArticle(Article article);
      public void updateArticle(Article article);
      public List getArticles();
}
