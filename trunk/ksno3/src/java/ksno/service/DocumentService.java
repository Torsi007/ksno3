/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.io.InputStream;

/**
 *
 * @author tor.hauge
 */
public interface DocumentService {
    public String uploadDocument(String path, String userName) throws Exception;
}
