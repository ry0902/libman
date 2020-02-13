package com.ry.libman.controller;

import com.ry.libman.bean.Book;
import com.ry.libman.bean.Category;
import com.ry.libman.bean.Search;
import com.ry.libman.service.BookService;
import com.ry.libman.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@RestController
public class LibraryController {
    @Autowired
    BookService bookService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/api/books",method = RequestMethod.GET)
    public List<Book> list() throws Exception{
        return bookService.list();
    }

    @RequestMapping(value = "api/books",method = RequestMethod.POST)
    public Book addOrUpdate(@RequestBody Book book)throws Exception{
        bookService.addOrUpdate(book);
        return book;
    }

    @RequestMapping(value = "api/delete",method = RequestMethod.POST)
    public void delete(@RequestBody Book book)throws Exception{
        bookService.deleteById(book.getId());
    }

    @RequestMapping(value = "api/deleteCate",method = RequestMethod.POST)
    public void delete(@RequestBody Category category)throws Exception{
        categoryService.deleteById(category.getId());
    }

    @RequestMapping(value = "/api/categories/{cid}/books",method = RequestMethod.GET)
    public List<Book> listByCategory(@PathVariable("cid") int cid)throws Exception{
        if (cid != 0){
            return bookService.listByCategory(cid);
        }
        else {
            return list();
        }
    }

    @RequestMapping(value = "/api/search",method = RequestMethod.POST)
    public List<Book> searchResult(@RequestBody Search s) throws Exception {
        // 关键字为空时查询所有书籍
        if ("".equals(s.getKeywords())) {
            return bookService.list();
        } else {
            return bookService.Search(s.getKeywords());
        }
    }

    @RequestMapping(value = "/api/category",method = RequestMethod.GET)
    public List<Category> listCategory() throws Exception {
        return categoryService.list();
    }

    @RequestMapping(value = "/api/category",method = RequestMethod.POST)
    public Category addCategory(@RequestBody Category category) throws Exception{
        categoryService.addOrUpdate(category);
        return category;
    }

    public String getRandomString(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    @PostMapping("api/covers")
    public String coversUpload(MultipartFile file) throws Exception {
        String folder = "D:/项目开发/libman/images";
        File imageFolder = new File(folder);
        File f = new File(imageFolder, getRandomString(6) + file.getOriginalFilename()
                .substring(file.getOriginalFilename().length() - 4));
        if (!f.getParentFile().exists())
            f.getParentFile().mkdirs();
        try {
            file.transferTo(f);
            String imgURL = "http://localhost:8443/api/file/" + f.getName();
            return imgURL;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

}
