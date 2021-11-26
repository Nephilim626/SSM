package com.wujin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wujin.pojo.Goods;
import com.wujin.pojo.Msg;
import com.wujin.pojo.Ord;
import com.wujin.pojo.Small_type;
import com.wujin.service.SmallTypeService;
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
@RequestMapping("/smallType")
public class SmallTypeController {

    @Resource
    private SmallTypeService smallTypeService;

    @RequestMapping("/queryAll")
    @ResponseBody
    public Msg queryAll(){
        List<Small_type> list = smallTypeService.queryAll();
        return Msg.success().add("smallType", list);
    }

    @RequestMapping("/AllSmallType")
    public  String getUser(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Small_type> list =smallTypeService.queryAllSmallType();
        PageInfo page=new PageInfo(list,10);
        model.addAttribute("pageInfo",page);
        return "smallTypePage";
    }

    @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public Msg register(Small_type small_type){
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        small_type.setId(uuid);
        Date date =new Date();
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format0.format(date);
        small_type.setcreate_time(time);
        smallTypeService.register(small_type);
        return Msg.success();
    }

    @RequestMapping(value = "/selectbyId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getSmallType(@RequestParam("id") String id){
        Small_type small_type=  smallTypeService.selectbyId(id);
        return Msg.success().add("user",small_type);
    }

    @RequestMapping(value="/editSmallType",method = RequestMethod.POST)
    @ResponseBody
    public Msg editUser(Small_type small_type){
        smallTypeService.updateById(small_type);
        return Msg.success();
    }

    @RequestMapping(value="/deleteSmallType",method = RequestMethod.GET)
    @ResponseBody
    public Msg deleteSmallType( String id){
        smallTypeService.deleteSmallType(id);
        return Msg.success();
    }

  @RequestMapping(value = "/findByTypeName",method = RequestMethod.GET)
    public  String findByTypeName(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                              @RequestParam(value = "name") String name ,Model model){
        PageHelper.startPage(pn,10);
        if(name =="") {
            List<Small_type> list =smallTypeService.queryAllSmallType();
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        else {
            List<Small_type> list =smallTypeService.findByTypename(name);
            PageInfo page=new PageInfo(list,10);
            model.addAttribute("pageInfo",page);
        }
        return "smallTypePage";
    }
    @RequestMapping(value = "/checkSmallTypeExist",method = RequestMethod.GET)
    @ResponseBody
    public Msg checkSmallTypeExist(@RequestParam("big_type_id") String big_type_id){
        List<Small_type> small_types=smallTypeService.checkSmallTypeExist(big_type_id);
        if( small_types.size()==0){
            return Msg.success();
        }else {
            return Msg.fail().add("goods",small_types);
        }
    }

}
