/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ksno.service;

import java.util.Calendar;
import java.util.List;
import ksno.dao.TransactionDao;
import ksno.model.Transaction;

/**
 *
 * @author tor.hauge
 */
public class TransactionServiceImpl implements TransactionService {

    public TransactionDao getTransactionDao() {
        return transactionDao;
    }

    public void setTransactionDao(TransactionDao transactionDao) {
        this.transactionDao = transactionDao;
    }
    
   private TransactionDao transactionDao;

    public Transaction getTransaction(Long id) {
        return transactionDao.getTransaction(id);
    }

    public Long newTransaction(Transaction transaction) {
        if(transaction.getCreatedDate() == null){
            transaction.setCreatedDate(Calendar.getInstance());
            transaction.setLastUpdatedDate(transaction.getCreatedDate());
        }
        return transactionDao.newTransaction(transaction);
    }

    public void updateTransaction(Transaction transaction) {
        transactionDao.updateTransaction(transaction);
    }
    
    public void deleteTransaction(Transaction transaction) {
        transactionDao.deleteTransaction(transaction);
    }
    
    public List getTransactions() {
        return transactionDao.getTransactions();
    }  
    
}
