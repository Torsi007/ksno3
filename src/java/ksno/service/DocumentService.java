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
    public String uploadDocument(InputStream stream, String userName) throws Exception;
}
