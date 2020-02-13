package com.ry.libman.service;

import com.ry.libman.bean.Book;
import com.ry.libman.bean.Category;
import com.ry.libman.dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    CategoryService categoryService;
    @Autowired
    BookDao bookDao;

    public List<Book> list(){
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        return bookDao.findAll(sort);
    }

   public void addOrUpdate(Book book){
        bookDao.save(book);
   }

   public void deleteById(int id){
        bookDao.deleteById(id);
   }

   public List<Book> listByCategory(int cid){
        Category category = categoryService.get(cid);
       return bookDao.findAllByCategory(category);
   }

    public List<Book> Search(String keywords) {
        return bookDao.findAllByTitleLikeOrAuthorLike('%' + keywords + '%', '%' + keywords + '%');
    }
}
