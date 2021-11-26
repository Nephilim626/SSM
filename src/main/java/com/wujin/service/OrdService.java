package com.wujin.service;

import com.wujin.pojo.Ord;

import java.util.List;

public interface OrdService {
    List<Ord> queryOrdAll();

    void register(Ord ord);

    void updateOrdById(Ord ord);

    int deleteOrdById(String id);

    List<Ord> findByUsername(String name);

    Ord selectbyId(String id);
}
