package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.Goods;
import com.wujin.pojo.Goods_evaluate;
import com.wujin.pojo.Msg;
import com.wujin.pojo.Shop_car;
import com.wujin.service.GoodsEvaluateService;
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
@RequestMapping("/evaluate")
public class GoodsEvaluateController {

    @Resource
    private GoodsEvaluateService goodsEvaluateService;

    @RequestMapping("/AllGoodsEvaluate")
    public  String getUser(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Goods_evaluate> list =goodsEvaluateService.queryGoodsEvaluateAll();
        PageInfo page=new PageInfo(list,10);
        model.addAttribute("pageInfo",page);
        return "evaluatePage";
    }

    @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Goods_evaluate goods_evaluate){
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        goods_evaluate.setId(uuid);
        goodsEvaluateService.register(goods_evaluate);
        return Msg.success();
    }

    @RequestMapping(value = "/selectbyId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getSingleEvaluate(@RequestParam("id") String id){
        Goods_evaluate goods_evaluate=  goodsEvaluateService.selectbyId(id);
        return Msg.success().add("user",goods_evaluate);
    }

    @RequestMapping(value="/editEvaluate",method = RequestMethod.POST)
    @ResponseBody
    public Msg editEvaluate(Goods_evaluate goods_evaluate){
        goodsEvaluateService.editEvaluate(goods_evaluate);
        return Msg.success();
    }

    @RequestMapping(value="/deleteEvaluate",method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteEvaluate( String id){
        goodsEvaluateService.deleteEvaluate(id);
        return Msg.success();
    }


    @RequestMapping(value = "/findByName",method = RequestMethod.GET)
    public  String findByName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              @RequestParam(value = "name") String name ,Model model){
        PageHelper.startPage(pn,10);
        if(name =="") {
            List<Goods_evaluate> list =goodsEvaluateService.queryGoodsEvaluateAll();
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        else {
            List<Goods_evaluate> list =goodsEvaluateService.findByUsername(name);
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        return "evaluatePage";
    }

}
