package com.wujin.service;

import com.wujin.mapper.GoodsEvaluateMapper;
import com.wujin.pojo.Goods_evaluate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsEvaluateServiceImpl implements GoodsEvaluateService{
    @Resource
    private GoodsEvaluateMapper goodsEvaluateMapper;

    public List<Goods_evaluate> queryGoodsEvaluateAll() {
        return goodsEvaluateMapper.queryGoodsEvaluateAll();
    }

    public void register(Goods_evaluate goods_evaluate) {
        goodsEvaluateMapper.register(goods_evaluate);
    }

    public Goods_evaluate selectbyId(String id) {
        return goodsEvaluateMapper.selectbyId(id);
    }

    public void editEvaluate(Goods_evaluate goods_evaluate) {
        goodsEvaluateMapper.editEvaluate(goods_evaluate);
    }

    public void deleteEvaluate(String id) {
        goodsEvaluateMapper.deleteEvaluate(id);
    }

    public List<Goods_evaluate> findByUsername(String name) {
        return goodsEvaluateMapper.findByUsername(name);
    }
}
