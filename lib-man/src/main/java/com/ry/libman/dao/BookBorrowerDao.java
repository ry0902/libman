package com.ry.libman.dao;

import com.ry.libman.bean.BookBorrower;
import com.ry.libman.bean.Borrower;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookBorrowerDao extends JpaRepository<BookBorrower, Integer> {
    public List<BookBorrower> findAllByBorrower(Borrower borrower);
}
