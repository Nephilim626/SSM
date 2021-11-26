package com.wujin.service;

import com.wujin.mapper.BigTypeMapper;
import com.wujin.pojo.Big_type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BigTypeServiceImpl implements BigTypeService{

    @Resource
    private BigTypeMapper bigTypeMapper;

    public List<Big_type> queryAll() {
        return bigTypeMapper.queryAll();
    }

    public void register(Big_type big_type) {
        bigTypeMapper.register(big_type);
    }

    public List<Big_type> queryBigTypeAll() {
        return bigTypeMapper.queryBigTypeAll();
    }

    public Big_type selectbyId(String id) {
        return bigTypeMapper.selectbyId(id);
    }

    public void updateById(Big_type big_type) {
        bigTypeMapper.updateById(big_type);
    }

    public void deleteBigType(String id) {
        bigTypeMapper.deleteBigType(id);
    }

    public List<Big_type> findByName(String name) {
        return bigTypeMapper.findByName(name);
    }
}
