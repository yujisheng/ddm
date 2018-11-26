package com.baizhi.ddm.service.Impl;

import com.baizhi.ddm.dao.UserDao;
import com.baizhi.ddm.entity.User;
import com.baizhi.ddm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String email, String password) {
        return userDao.login(email, password);
    }

    @Override
    public void register(User user) {
        userDao.register(user);
    }
}
