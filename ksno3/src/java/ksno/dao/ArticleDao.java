/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;
import java.util.List;
import ksno.model.Article;
import ksno.model.Category;

/**
 *
 * @author Tor-Erik
 */
public interface ArticleDao {
      public Article getArticle(Long id);
      public Long newArticle(Article article);
      public void updateArticle(Article article);
      public void deleteArticle(Article article);      
      public List<Article> getArticles();
      public Category getCategory(String name);
      public List<Category> getCategories();
      public List<Article> getVisibleArticles();
}
