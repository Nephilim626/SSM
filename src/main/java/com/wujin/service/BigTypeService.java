package com.wujin.service;

import com.wujin.pojo.Big_type;

import java.util.List;

public interface BigTypeService {
    List<Big_type> queryAll();

    void register(Big_type big_type);

    List<Big_type> queryBigTypeAll();

    Big_type selectbyId(String id);

    void updateById(Big_type big_type);

    void deleteBigType(String id);

    List<Big_type> findByName(String name);
}
