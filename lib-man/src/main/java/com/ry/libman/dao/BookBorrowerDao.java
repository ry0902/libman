package com.ry.libman.dao;

import com.ry.libman.bean.BookBorrower;
import com.ry.libman.bean.Borrower;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BookBorrowerDao extends JpaRepository<BookBorrower, Integer> {
    public List<BookBorrower> findAllByBorrower(Borrower borrower);

    @Query(value = "select bb from BookBorrower bb where bb.book.title like %?1% or bb.borrower.name like %?1% or bb.btime like  %?1% or bb.etime like %?1%")
    public List<BookBorrower> findByKeywords(String keywords);
}
