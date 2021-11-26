package com.wujin.service;

import com.wujin.mapper.OrdMapper;
import com.wujin.pojo.Ord;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrdServiceImpl implements OrdService{

    @Resource
    private OrdMapper ordMapper;

    public List<Ord> queryOrdAll() {
        return ordMapper.queryOrdAll();
    }

    public void register(Ord ord) {
        ordMapper.register(ord);
    }

    public void updateOrdById(Ord ord) {
        ordMapper.updateOrdById(ord);
    }

    public int deleteOrdById(String id) {
       return ordMapper.deleteOrdById(id);
    }

    public List<Ord> findByUsername(String name) {
        return ordMapper.findByUsername(name);
    }

    public Ord selectbyId(String id) {
        return ordMapper.selectbyId(id);
    }
}
