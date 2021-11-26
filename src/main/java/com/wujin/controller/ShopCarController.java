package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.*;
import com.wujin.service.ShopCarService;
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
@RequestMapping("/shopcar")
public class ShopCarController {

    @Resource
    private ShopCarService shopCarService;

    @RequestMapping("/AllShopCar")
    public  String getUser(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Shop_car> list =shopCarService.queryShopCarAll();
        PageInfo page=new PageInfo(list,10);
        model.addAttribute("pageInfo",page);
        return "shopCarPage";
    }

  @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Shop_car shop_car){
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        shop_car.setId(uuid);
        shopCarService.register(shop_car);
        return Msg.success();
    }

    @RequestMapping(value="/editShopCar",method = RequestMethod.POST)
    @ResponseBody
    public Msg editShopCar(Shop_car shop_car){
        shopCarService.editShopCar(shop_car);
        return Msg.success();
    }
    @RequestMapping(value="/deleteShopCar",method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteShopCar( String id){
        shopCarService.deleteShopCar(id);
        return Msg.success();
    }

    @RequestMapping(value = "/findByName",method = RequestMethod.GET)
    public  String findByName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              @RequestParam(value = "name") String name ,Model model){
        PageHelper.startPage(pn,10);
        if(name =="") {

            List<Shop_car> list =shopCarService.queryShopCarAll();
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        else {
            List<Shop_car> list =shopCarService.findByUsername(name);
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        return "shopCarPage";
    }

    @RequestMapping(value = "/selectbyId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getSingleGoods(@RequestParam("id") String id){
        Shop_car shop_car=  shopCarService.selectbyId(id);
        return Msg.success().add("user",shop_car);
    }




}
