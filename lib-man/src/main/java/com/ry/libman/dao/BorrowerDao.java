package com.ry.libman.dao;

import com.ry.libman.bean.Borrower;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BorrowerDao extends JpaRepository<Borrower, Integer> {
    List<Borrower> findAllByNameAndTele(String name, String tele);
    List<Borrower> findAllById(int id);
}
