/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.dao;

import java.util.List;
import ksno.model.Category;

/**
 *
 * @author tor.hauge
 */
public interface ArticleCategoryDao {
      public Category getArticleCategory(Long id);
      public Long newArticleCategory(Category category);
      public void updateArticleCategory(Category category);
      public void deleteArticleCategory(Category category);
      public List<Category> getArticleCategorys();
}
