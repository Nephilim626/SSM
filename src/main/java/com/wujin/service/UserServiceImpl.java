package com.wujin.service;

import com.wujin.mapper.UserMapper;
import com.wujin.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements  UserService{

    @Resource
    private UserMapper userMapper;

    public List<User> queryUserAll() {
        return userMapper.queryUserAll();
    }

    public User logincheck(User user) {
        User u = userMapper.logincheck(user);
        return u;
    }

    public void register(User user) {
        userMapper.register(user);
    }

    public User checkUsername(String user_name) {

        return  userMapper.checkUsername(user_name);
    }

    public User selectbyId(String id) {
        return userMapper.selectbyId(id);
    }

    public void updateById(User user) {
        userMapper.updateById(user);
    }

    public void deleteUserById(String id) {
        userMapper.deleteUserById(id);
    }

    public List<User> findByName(String user_name) {
        return userMapper.findByName(user_name);
    }

}
