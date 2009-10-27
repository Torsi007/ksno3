/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.List;
import ksno.model.Transaction;

/**
 *
 * @author tor.hauge
 */
public interface TransactionService {
    public Transaction getTransaction(Long id);
    public Long newTransaction(Transaction transaction);
    public void updateTransaction(Transaction transaction);
    public void deleteTransaction(Transaction transaction);
    public List getTransactions();
}
