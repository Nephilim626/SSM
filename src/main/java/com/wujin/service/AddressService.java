package com.wujin.service;

import com.wujin.pojo.Address;
import com.wujin.pojo.Goods;

import java.util.List;

public interface AddressService {
    List<Address> queryAddressAll();

    void register(Address address);

    void updateAddressById(Address address);

    void deleteAddressById(String id);

    List<Goods> findByName(String name);

    Address selectbyId(String id);

    List<Address> queryAllbyName(String user_id);
}
