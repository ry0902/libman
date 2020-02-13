package com.ry.libman.service;

import com.ry.libman.bean.User;
import com.ry.libman.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserDao userDao;

    public User getByName(String username) {
        return userDao.findByUsername(username);
    }

    public User get(String username, String password){
        return userDao.getByUsernameAndPassword(username,password);
    }

    public void add(User user){
        userDao.save(user);
    }

    public boolean isExist(String username){
        User user = getByName(username);
        return null != user;
    }
}
