/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.service;

import java.util.List;
import ksno.model.Article;
import ksno.model.Category;

/**
 *
 * @author Tor-Erik
 */
public interface ArticleService {
    public Article getArticle(Long id);
    public Article getArticle(String prettyPrintId);
    public Long newArticle(Article article);
    public void updateArticle(Article article);
    public void deleteArticle(Article article);
    public List getArticles();
    public Category getCategory(String name);
    public Category getCategory(Long id);
    public List<Category> getCategories();
    public List<Article> getVisibleArticles();
    public List<Article> getArticlesByCategory(Category category);

}
