package com.ry.libman.controller;

import com.ry.libman.bean.Borrower;
import com.ry.libman.service.BorrowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BorrowerController {
    @Autowired
    BorrowerService borrowerService;

    @RequestMapping(value = "api/borrower", method = RequestMethod.GET)
    public List<Borrower> list()throws Exception{
        return borrowerService.list();
    }

    @RequestMapping(value = "api/borrower", method = RequestMethod.POST)
    public Borrower addOrUpdate(@RequestBody Borrower borrower)throws Exception{
        borrowerService.addOrUpdate(borrower);
        return borrower;
    }

    @RequestMapping(value = "api/deleteBorrower", method = RequestMethod.POST)
    public void deleteById(@RequestBody Borrower borrower)throws Exception{
        borrowerService.deleteById(borrower.getId());
    }

    @RequestMapping(value = "api/findByNameAndTele", method = RequestMethod.POST)
    public List<Borrower> findByNameAndTele(@RequestBody Borrower borrower) throws Exception{
//        System.out.println("#########" + borrowerService.getByNameAndTele(borrower));
        return borrowerService.getByNameAndTele(borrower);
    }

    @RequestMapping(value = "api/findById", method = RequestMethod.POST)
    public List<Borrower> findById(@RequestBody Borrower borrower){
        return borrowerService.findById(borrower.getId());
    }
}
