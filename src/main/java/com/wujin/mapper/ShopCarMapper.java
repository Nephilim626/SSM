package com.wujin.mapper;

import com.wujin.pojo.Big_type;
import com.wujin.pojo.Shop_car;

import java.util.List;

public interface ShopCarMapper {
    List<Shop_car> queryShopCarAll();
    void register(Shop_car shop_car);
    void editShopCar(Shop_car shop_car);
    void deleteShopCar(String id);
    List<Big_type> findByName(String name);
    List<Shop_car> findByUsername(String name);
    Shop_car selectbyId(String id);
}
