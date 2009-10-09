/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.Category;

/**
 *
 * @author tor.hauge
 */
public interface ArticleCategoryService {
    public Category getArticleCategory(Long id);
    public Long newArticleCategory(Category ArticleCategory);
    public void updateArticleCategory(Category ArticleCategory);
    public void deleteArticleCategory(Category ArticleCategory);
    public List<Category> getArticleCategorys();
}
