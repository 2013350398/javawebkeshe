package com.zc.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import com.zc.pojo.User;
@Mapper
public interface UserMapper {
    List<User> getAllUser();
    User getUserById(int userId);
    User getUserByName(String name);
    int addUser(User users);
    int deleteUser(int userId);
    int updateUser(User user);
}

