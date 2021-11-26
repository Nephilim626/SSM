package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.Address;
import com.wujin.pojo.Goods;
import com.wujin.pojo.Msg;
import com.wujin.pojo.Ord;
import com.wujin.service.GoodsService;
import com.wujin.service.OrdService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/ord")
public class OrdController {

    @Resource
    private OrdService ordService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/AllOrd")
    public  String getUser(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Ord> list =ordService.queryOrdAll();
        PageInfo page=new PageInfo(list,10);
        model.addAttribute("pageInfo",page);
        return "ordPage";
    }

    @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Ord ord){
       Goods goods= goodsService.selectbyId(ord.getGoods_id());
       int sum=Integer.valueOf(goods.getNum());
       int num=Integer.valueOf(ord.getNum());
       int cha= sum-num;
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        ord.setId(uuid);
        Date date =new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format0.format(date);
        ord.setCreate_time(time);
        ordService.register(ord);
        return Msg.success().add("num",cha);
    }

    @RequestMapping(value="/editOrd",method = RequestMethod.POST)
    @ResponseBody
    public Msg editUser(Ord ord){
        ordService.updateOrdById(ord);
        return Msg.success();
    }

    @RequestMapping(value="/deleteOrd",method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteOrdById( String id){
       if( ordService.deleteOrdById(id)==1){
        return Msg.success();}
       else {return Msg.fail();}
    }

    @RequestMapping(value = "/findByName",method = RequestMethod.GET)
    public  String findByName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              @RequestParam(value = "name") String name ,Model model){
        PageHelper.startPage(pn,10);
        if(name =="") {
            List<Ord> list =ordService.queryOrdAll();
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        else {
            List<Ord> list =ordService.findByUsername(name);
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        return "ordPage";
    }

    @RequestMapping(value = "/selectbyId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getSingleGoods(@RequestParam("id") String id){
        Ord address=  ordService.selectbyId(id);
        return Msg.success().add("user",address);
    }
}
