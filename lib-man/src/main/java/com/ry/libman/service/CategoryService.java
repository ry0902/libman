package com.ry.libman.service;

import com.ry.libman.bean.Category;
import com.ry.libman.dao.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryService {
    @Autowired
    CategoryDao categoryDao;

    public List<Category> list(){
//        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        return categoryDao.findAll();
    }

    public Category get(int id){
        return categoryDao.findById(id).orElse(null);
    }

    public void addOrUpdate(Category category) {
        categoryDao.save(category);
}

    public void deleteById(int id){
        categoryDao.deleteById(id);
    }
}
