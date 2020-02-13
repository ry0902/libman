package com.ry.libman.controller;

import com.ry.libman.bean.Book;
import com.ry.libman.bean.BookBorrower;
import com.ry.libman.bean.Borrower;
import com.ry.libman.service.BookBorrowerService;
import com.ry.libman.service.BookService;
import com.ry.libman.service.BorrowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BookBorrowerController {
    @Autowired
    BookBorrowerService bookBorrowerService;
    @Autowired
    BorrowerService borrowerService;
    @Autowired
    BookService bookService;

    @RequestMapping(value = "api/bookBorrower", method = RequestMethod.GET)
    public List<BookBorrower> list()throws Exception{
        return bookBorrowerService.list();
    }

    @RequestMapping(value = "api/bookBorrower", method = RequestMethod.POST)
    public BookBorrower addOrUpdate(@RequestBody BookBorrower bookBorrower)throws Exception{
        Book book = bookBorrower.getBook();
        book.setCnt(book.getCnt() - 1);
        bookService.addOrUpdate(book);
        if(borrowerService.getByNameAndTele(bookBorrower.getBorrower()).isEmpty()){
            borrowerService.addOrUpdate(bookBorrower.getBorrower());
        }
        bookBorrowerService.addOrUpdate(bookBorrower);
        return bookBorrower;
    }

    @RequestMapping(value = "api/deleteBookBorrower", method = RequestMethod.POST)
    public void deleteById(@RequestBody BookBorrower bookBorrower)throws Exception{
//        System.out.println("-------------" + bookBorrower.getBorrower() + "-------------");
        Book book = bookBorrower.getBook();
        book.setCnt(book.getCnt() + 1);
        bookService.addOrUpdate(book);
        bookBorrowerService.deleteById(bookBorrower.getId());
        if(bookBorrowerService.findByBorrower(bookBorrower.getBorrower().getId()).isEmpty()){
            borrowerService.deleteById(bookBorrower.getBorrower().getId());
        }
    }

    @RequestMapping(value = "api/findByBorrower", method = RequestMethod.POST)
    public List<BookBorrower> findByBorrower(@RequestBody Borrower borrower) throws Exception{
        return bookBorrowerService.findByBorrower(borrower.getId());
    }
}
