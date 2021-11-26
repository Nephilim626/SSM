package com.wujin.mapper;

import com.wujin.pojo.User;

import java.util.List;

public interface UserMapper {
    public List<User> queryUserAll();
    User logincheck(User user);
    int register(User user);

    User checkUsername(String user_name);

    User selectbyId(String id);

    void updateById(User user);

    void deleteUserById(String id);

    List<User> findByName(String user_name);
}
