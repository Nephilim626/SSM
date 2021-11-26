package com.wujin.service;

import com.wujin.mapper.AddressMapper;
import com.wujin.pojo.Address;
import com.wujin.pojo.Goods;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AddressServiceImpl implements  AddressService{

@Resource
    private AddressMapper addressMapper;

    public List<Address> queryAddressAll() {
        return addressMapper.queryAddressAll();
    }

    public void register(Address address) {
        addressMapper.register(address);
    }

    public void updateAddressById(Address address) {
        addressMapper.updateAddressById(address);
    }

    public void deleteAddressById(String id) {
        addressMapper.deleteAddressById(id);
    }

    public List<Goods> findByName(String name) {
        return addressMapper.findByName(name);
    }
    public Address selectbyId(String id) {
        return addressMapper.selectbyId(id);
    }

    public List<Address> queryAllbyName(String user_id) {
        return addressMapper.queryAllbyName( user_id);
    }
}
