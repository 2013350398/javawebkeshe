package com.zc.service;

import com.zc.pojo.User;

import java.util.List;

public interface UserService {
    List<User> getAllUser();
    User getUserById(int userId);
    User getUserByName(String name);
    int addUser(User users);
    int deleteUser(int userId);
    int updateUser(User user);
}
