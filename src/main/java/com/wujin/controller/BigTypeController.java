package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.*;
import com.wujin.service.BigTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/bigtype")
public class BigTypeController{

    @Resource
    private BigTypeService bigTypeService;

    @RequestMapping("/queryAll")
    @ResponseBody
    public Msg queryAll(){
        List<Big_type> list = bigTypeService.queryAll();
        return Msg.success().add("bigType", list);
    }
    @RequestMapping("/AllBigType")
    public  String getAllBigType(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Big_type> list =bigTypeService.queryBigTypeAll();
        PageInfo page=new PageInfo(list,10);
        model.addAttribute("pageInfo",page);
        return "bigTypePage";
    }

    @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Big_type big_type){
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        big_type.setId(uuid);
        Date date =new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format0.format(date);
        big_type.setCreate_time(time);
        bigTypeService.register(big_type);
        return Msg.success();
    }
    @RequestMapping(value = "/selectbyId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getBigType(@RequestParam("id") String id){
        Big_type big_type=  bigTypeService.selectbyId(id);
        return Msg.success().add("user",big_type);
    }
    @RequestMapping(value="/editBigType",method = RequestMethod.POST)
    @ResponseBody
    public Msg editUser(Big_type big_type){
        bigTypeService.updateById(big_type);
        return Msg.success();
    }

    @RequestMapping(value="/deleteBigType",method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteBigType( String id){
        bigTypeService.deleteBigType(id);
        return Msg.success();
    }
    @RequestMapping(value = "/findByName",method = RequestMethod.GET)
    public  String findByName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              @RequestParam(value = "name") String name ,Model model){
        PageHelper.startPage(pn,10);
        if(name =="") {
            List<Big_type> list =bigTypeService.queryBigTypeAll();
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        else {
            List<Big_type> list =bigTypeService.findByName(name);
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        return "bigTypePage";

    }

}
