package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.Address;
import com.wujin.pojo.Goods;
import com.wujin.pojo.Msg;
import com.wujin.pojo.User;
import com.wujin.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/goods")
public class GoodsController {

   @Autowired
    private GoodsService goodsService;

    @RequestMapping("/allGoods")
    public  String getUser(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Goods> list =goodsService.queryGoodsAll();
        PageInfo page=new PageInfo(list,10);
        model.addAttribute("pageInfo",page);
        return "goodsPage";
    }


    @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Goods goods){
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        goods.setId(uuid);
        Date date =new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format0.format(date);
        goods.setCreate_time(time);
        goodsService.register(goods);
        return Msg.success();
    }

    @RequestMapping(value = "/checkGoodsName",method = RequestMethod.POST)
    @ResponseBody
    public Msg checkUsername(@RequestParam("goods_name") String goods_name){
        Goods goods=goodsService.checkGoodsName(goods_name);
        if( goods==null){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/findByName",method = RequestMethod.GET)
    public  String findByName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              @RequestParam(value = "name") String name ,Model model){
        PageHelper.startPage(pn,10);
        if(name =="") {
            List<Goods> list =goodsService.queryGoodsAll();
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        else {
            List<Goods> list =goodsService.findByName(name);
            PageInfo page=new PageInfo(list,10);

            model.addAttribute("pageInfo",page);
        }
        return "goodsPage";
    }

    /*editGoods*/
    @RequestMapping(value="/editGoods",method = RequestMethod.POST)
    @ResponseBody
    public Msg editUser(Goods goods){
        goodsService.updateById(goods);
        return Msg.success();
    }

    @RequestMapping(value="/deleteGoods",method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteUser( String id){
        goodsService.deleteGoodsById(id);
        return Msg.success();
    }

    @RequestMapping(value = "/queryAll",method = RequestMethod.GET)
    @ResponseBody
    public  Msg queryAll(Model model){
        List<Goods> list = goodsService.queryGoodsAll();
        return Msg.success().add("AllGoods", list);
    }

    @RequestMapping(value = "/selectbyId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getSingleGoods(@RequestParam("id") String id){
        Goods goods=  goodsService.selectbyId(id);
        return Msg.success().add("user",goods);
    }

    @RequestMapping(value = "/updateNumById",method = RequestMethod.GET)
    @ResponseBody
    public Msg updateNumById(@RequestParam("id") String id,@RequestParam("num") String num){
        Goods goods=new Goods();
        goods.setId(id);
        goods.setNum(num);
         goodsService.updateById(goods);
        return Msg.success();
    }

    @RequestMapping(value = "/checkGoodsExist",method = RequestMethod.GET)
    @ResponseBody
    public Msg checkGoodsExist(@RequestParam("small_type_id") String small_type_id){
       List<Goods> goods=goodsService.checkGoodsExist(small_type_id);
        if( goods.size()==0){
            return Msg.success();
        }else {
            return Msg.fail().add("goods",goods);
        }
    }

   @RequestMapping(value = "/fileUpload")
   @ResponseBody
    public Msg fileUpload(@RequestParam(value = "file") MultipartFile file, Model model, HttpServletRequest request) {
        if (file.isEmpty()) {
            System.out.println("文件为空空");
        }
        String fileName = file.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = "D://Stu/img/"; // 上传后的路径
        fileName = UUID.randomUUID() + suffixName; // 新文件名
        File dest = new File(filePath + fileName);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);//存储图片

        } catch (IOException e) {
            e.printStackTrace();
        }
        return Msg.success().add("file",fileName);
    }


}


