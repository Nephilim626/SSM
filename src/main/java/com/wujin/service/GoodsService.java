package com.wujin.service;

import com.wujin.pojo.Goods;
import com.wujin.pojo.User;

import java.util.List;

public interface GoodsService {
    List<Goods> queryGoodsAll();

    void register(Goods goods);

    Goods checkGoodsName(String goods_name);

    List<Goods> findByName(String name);

    void updateById(Goods goods);

    void deleteGoodsById(String id);

    Goods selectbyId(String id);

    void updateNumById(String id ,String num);
    String getNumbyId(String id);

    List<Goods> checkGoodsExist(String small_type_id);
}
