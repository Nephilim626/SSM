package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.Msg;
import com.wujin.pojo.User;
import com.wujin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "/queryAll", method = RequestMethod.GET)
    @ResponseBody
    public Msg queryAll(Model model) {
        List<User> list = userService.queryUserAll();
        return Msg.success().add("Alluser", list);
    }


    @RequestMapping("tologin")
    public String tologin() {
        return "login";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value = "username", defaultValue = "") String username,
                        @RequestParam(value = "password", defaultValue = "") String password, Model model) {
        User user = new User();
        user.setUser_name(username);
        user.setPassword(password);
        if (userService.logincheck(user) != null) {
            model.addAttribute("username", username);
            return "head";
        } else {
            String msg = "账号或密码错误";
            model.addAttribute("error", msg);
            return "index";
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Msg register(User user) {
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        user.setId(uuid);
        Date date = new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format0.format(date);
        user.setCreate_time(time);
        userService.register(user);
        return Msg.success();
    }

    @RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkUsername(@RequestParam("user_name") String user_name) {
        User user = userService.checkUsername(user_name);
        if (user == null) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @RequestMapping("/users")
    public String getUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        PageHelper.startPage(pn, 10);
        List<User> list = userService.queryUserAll();
        PageInfo page = new PageInfo(list, 10);
        model.addAttribute("pageInfo", page);
        return "userPage";
    }

    @RequestMapping(value = "/selectbyId", method = RequestMethod.GET)
    @ResponseBody
    public Msg getSingleUser(@RequestParam("id") String id) {
        User user = userService.selectbyId(id);
        return Msg.success().add("user", user);
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    @ResponseBody
    public Msg editUser(User user) {
        userService.updateById(user);
        return Msg.success();
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteUser(String id) {
        userService.deleteUserById(id);
        return Msg.success();
    }

    @RequestMapping(value = "/findByName", method = RequestMethod.GET)
    public String findByName(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                             @RequestParam(value = "name") String name, Model model) {
        PageHelper.startPage(pn, 10);
        if (name == "") {
            List<User> list = userService.queryUserAll();
            PageInfo page = new PageInfo(list, 10);
            model.addAttribute("pageInfo", page);
        } else {
            List<User> list = userService.findByName(name);
            PageInfo page = new PageInfo(list, 10);
            model.addAttribute("pageInfo", page);
        }
        return "userPage";
    }


}
