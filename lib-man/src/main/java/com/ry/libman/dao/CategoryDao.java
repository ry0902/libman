package com.ry.libman.dao;

import com.ry.libman.bean.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDao extends JpaRepository<Category, Integer> {
}
