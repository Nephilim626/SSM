package com.wujin.service;

import com.wujin.pojo.Small_type;

import java.util.List;

public interface SmallTypeService {
    List<Small_type> queryAll();

    List<Small_type> queryAllSmallType();

    void register(Small_type small_type);

    Small_type selectbyId(String id);

    void updateById(Small_type small_type);

    void deleteSmallType(String id);

    List<Small_type> findByTypename(String name);

    List<Small_type> checkSmallTypeExist(String big_type_id);
}
