package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.Address;
import com.wujin.pojo.Goods;
import com.wujin.pojo.Msg;
import com.wujin.pojo.User;
import com.wujin.service.AddressService;
import org.apache.ibatis.annotations.Param;
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
@RequestMapping("/address")
public class AddressController {

    @Resource
    private AddressService addressService;

    @RequestMapping("/Alladdress")
    public  String getUser(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){

        PageHelper.startPage(pn,10);
        List<Address> list =addressService.queryAddressAll();
        PageInfo page=new PageInfo(list,10);
        model.addAttribute("pageInfo",page);
        return "addressPage";
    }

    @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Address address){
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        address.setId(uuid);
        Date date =new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format0.format(date);
        address.setCreate_time(time);
        addressService.register(address);
        return Msg.success();
    }

    @RequestMapping(value="/editAddress",method = RequestMethod.POST)
    @ResponseBody
    public Msg editUser(Address address){
        addressService.updateAddressById(address);
        return Msg.success();
    }
    @RequestMapping(value="/deleteAddress",method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteUser( String id){
        addressService.deleteAddressById(id);
        return Msg.success();
    }

    @RequestMapping(value = "/findByName",method = RequestMethod.GET)
    public  String findByName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              @RequestParam(value = "name") String name ,Model model){
        PageHelper.startPage(pn,10);
        if(name =="") {
            List<Address> list =addressService.queryAddressAll();
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        else {
            List<Goods> list =addressService.findByName(name);
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        return "addressPage";
    }

    @RequestMapping(value = "/queryAll",method = RequestMethod.GET)
    @ResponseBody
    public  Msg queryAll(Model model){
        List<Address> list = addressService.queryAddressAll();
        return Msg.success().add("AllAddress", list);
    }

    @RequestMapping(value = "/selectbyId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getSingleGoods(@RequestParam("id") String id){
        Address address=  addressService.selectbyId(id);
        return Msg.success().add("user",address);
    }

    @RequestMapping(value = "/queryAllbyName",method = RequestMethod.GET)
    @ResponseBody
    public  Msg queryAllbyName(@Param("id") String user_id, Model model){
        List<Address> list = addressService.queryAllbyName( user_id);
        return Msg.success().add("AllAddress", list);
    }

}
