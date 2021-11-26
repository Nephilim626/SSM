package com.wujin.service;


import com.wujin.pojo.User;

import java.util.List;

public interface UserService {
    public List<User> queryUserAll();
    User logincheck(User user);
    void register(User user);

    User checkUsername(String user_name);

    User selectbyId(String id);

    void updateById(User user);

    void deleteUserById(String id);

    List<User> findByName(String name);
}
