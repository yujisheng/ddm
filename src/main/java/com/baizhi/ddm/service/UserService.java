package com.baizhi.ddm.service;

import com.baizhi.ddm.entity.User;

public interface UserService {
    public User login(String email, String password);

    public void register(User user);
}
