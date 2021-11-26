package com.wujin.service;


import com.wujin.mapper.GoodsMapper;
import com.wujin.pojo.Goods;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService{

   @Resource
   private GoodsMapper goodsMapper;


    public List<Goods> queryGoodsAll() {
        return goodsMapper.queryGoodsAll();
    }

    public void register(Goods goods) {
        goodsMapper.register(goods);
    }

    public Goods checkGoodsName(String goods_name) {
        return goodsMapper.checkGoodsName(goods_name);
    }

    public List<Goods> findByName(String goods_name) {
        return goodsMapper.findByName(goods_name);
    }

    public void updateById(Goods goods) {
        goodsMapper.updateById(goods);
    }

    public void deleteGoodsById(String id) {
        goodsMapper.deleteGoodsById(id);
    }

    public Goods selectbyId(String id) {
        return goodsMapper.selectbyId(id);
    }

    public void updateNumById(String id, String num) {
        goodsMapper.updateNumById(id,num);
    }

    public String getNumbyId(String id) {
        return goodsMapper.getNumbyId(id);
    }

    public List<Goods> checkGoodsExist(String small_type_id) {
        return goodsMapper.checkGoodsExist(small_type_id);
    }


}
