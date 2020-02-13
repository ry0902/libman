package com.ry.libman.service;

import com.ry.libman.bean.Borrower;
import com.ry.libman.dao.BorrowerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowerService {
    @Autowired
    BorrowerDao borrowerDao;

    public List<Borrower> list(){
        return borrowerDao.findAll();
    }

    public void addOrUpdate(Borrower borrower){
        borrowerDao.save(borrower);
    }

    public void deleteById(int id){
        borrowerDao.deleteById(id);
    }

    public List<Borrower> getByNameAndTele(Borrower borrower){
        return borrowerDao.findAllByNameAndTele(borrower.getName(), borrower.getTele());
    }

    public List<Borrower> findById(int id){
        return borrowerDao.findAllById(id);
    }

    public Borrower get(int id){
        return borrowerDao.findById(id).orElse(null);
    }
}
