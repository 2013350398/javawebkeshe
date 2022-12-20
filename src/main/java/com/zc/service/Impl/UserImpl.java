package com.zc.service.Impl;

import com.zc.dao.UserMapper;
import com.zc.pojo.User;
import com.zc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserImpl implements UserService {//UserService
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }
    @Override
    public User getUserById(int userId) { return userMapper.getUserById(userId); }
    @Override
    public User getUserByName(String name) { return userMapper.getUserByName(name);}
    @Override
    public int addUser(User users) {
        return userMapper.addUser(users);
    }
    @Override
    public int deleteUser(int userId) {
        return userMapper.deleteUser(userId);
    }
    @Override
    public int updateUser(User user) { return userMapper.updateUser(user); }
}
