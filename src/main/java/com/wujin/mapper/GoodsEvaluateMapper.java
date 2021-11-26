package com.wujin.mapper;

import com.wujin.pojo.Goods_evaluate;

import java.util.List;

public interface GoodsEvaluateMapper {
    List<Goods_evaluate> queryGoodsEvaluateAll();
    void register(Goods_evaluate goods_evaluate);
    Goods_evaluate selectbyId(String id);
    void editEvaluate(Goods_evaluate goods_evaluate);
    void deleteEvaluate(String id);
    List<Goods_evaluate> findByUsername(String name);
}
