package com.wujin.mapper;

import com.wujin.pojo.Goods;

import java.util.List;

public interface GoodsMapper {
    List<Goods> queryGoodsAll();
    void register(Goods goods);
    Goods checkGoodsName(String goods_name);
    List<Goods> findByName(String goods_name);
    void updateById(Goods goods);
    void deleteGoodsById(String id);
    Goods selectbyId(String id);

    void updateNumById(String id,String num);
    List<Goods> checkGoodsExist(String small_type_id);
    String getNumbyId(String id);
}
