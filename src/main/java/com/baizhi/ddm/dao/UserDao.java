package com.baizhi.ddm.dao;

import com.baizhi.ddm.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    public User login(@Param("email") String email, @Param("password") String password);

    public void register(User user);
}
