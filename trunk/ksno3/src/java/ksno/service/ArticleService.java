/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ksno.service;

import java.util.List;
import ksno.model.Article;

/**
 *
 * @author Tor-Erik
 */
public interface ArticleService {
    public Article getArticle(Long id);
    public Long newArticle(Article article);
    public void updateArticle(Article article);
    public List getArticles();
}
