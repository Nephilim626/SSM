package com.wujin.service;

import com.wujin.mapper.SmallTypeMapper;
import com.wujin.pojo.Small_type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SmallTypeServiceImpl implements SmallTypeService{

    @Resource
    private SmallTypeMapper smallTypeMapper;

    public List<Small_type> queryAll() {
        return smallTypeMapper.queryAll();
    }

    public List<Small_type> queryAllSmallType() {
        return smallTypeMapper.queryAllSmallType();
    }

    public void register(Small_type small_type) {
        smallTypeMapper.register(small_type);
    }

    public Small_type selectbyId(String id) {
        return smallTypeMapper.selectbyId(id);
    }

    public void updateById(Small_type small_type) {
        smallTypeMapper.updateById(small_type);
    }

    public void deleteSmallType(String id) {
        smallTypeMapper.deleteSmallType(id);
    }

    public List<Small_type> findByTypename(String name) {
        return smallTypeMapper.findByTypename(name);
    }

    public List<Small_type> checkSmallTypeExist(String big_type_id) {
        return smallTypeMapper.checkSmallTypeExist(big_type_id);
    }
}
