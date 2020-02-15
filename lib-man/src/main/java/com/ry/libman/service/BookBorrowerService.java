package com.ry.libman.service;

import com.ry.libman.bean.BookBorrower;
import com.ry.libman.bean.Borrower;
import com.ry.libman.dao.BookBorrowerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookBorrowerService {
    @Autowired
    BookBorrowerDao bookBorrowerDao;
    @Autowired
    BorrowerService borrowerService;

    public List<BookBorrower> list(){
        return bookBorrowerDao.findAll();
    }

    public void addOrUpdate(BookBorrower bookBorrower){
        bookBorrowerDao.save(bookBorrower);
    }

    public void deleteById(int id){
        bookBorrowerDao.deleteById(id);
    }

    public List<BookBorrower> findByBorrower(int id){
        Borrower borrower = borrowerService.get(id);
        return bookBorrowerDao.findAllByBorrower(borrower);
    }

    public List<BookBorrower> findByKey(String keywords){
        return bookBorrowerDao.findByKeywords(keywords);
    }

    public List<BookBorrower> findByTime(String time){
        return bookBorrowerDao.findAllByBtimeOrEtime(time);
    }
}
