package com.wujin.service;

import com.wujin.mapper.ShopCarMapper;
import com.wujin.pojo.Shop_car;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShopCarServiceImpl implements ShopCarService{

    @Resource
    private ShopCarMapper shopCarMapper;


    public List<Shop_car> queryShopCarAll() {
        return shopCarMapper.queryShopCarAll();
    }

    public void register(Shop_car shop_car) {
        shopCarMapper.register(shop_car);
    }

    public void editShopCar(Shop_car shop_car) {
        shopCarMapper.editShopCar(shop_car);
    }

    public void deleteShopCar(String id) {
        shopCarMapper.deleteShopCar(id);
    }

    public List<Shop_car> findByUsername(String name) {
        return shopCarMapper.findByUsername(name);
    }

    public Shop_car selectbyId(String id) {
        return shopCarMapper.selectbyId(id);
    }
}
