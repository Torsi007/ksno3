/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;
import ksno.model.Article;

/**
 *
 * @author Tor-Erik
 */
public interface ArticleDao {
      public Article getArticle(final Integer id);
      public boolean newArticle(String name);
}
