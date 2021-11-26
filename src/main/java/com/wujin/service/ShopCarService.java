package com.wujin.service;

import com.wujin.pojo.Shop_car;

import java.util.List;

public interface ShopCarService {
    List<Shop_car> queryShopCarAll();

    void register(Shop_car shop_car);

    void editShopCar(Shop_car shop_car);

    void deleteShopCar(String id);

    List<Shop_car> findByUsername(String name);

    Shop_car selectbyId(String id);
}
