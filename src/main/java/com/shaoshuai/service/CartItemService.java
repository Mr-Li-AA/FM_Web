package com.shaoshuai.service;

import com.shaoshuai.domain.CartItem;
import com.shaoshuai.vo.R;

import java.util.List;

public interface CartItemService {

    int deleteById(Integer id);
    int deleteByCid(Integer cid);
    boolean save(CartItem record);
    boolean saveOrUpdate(int cid,int gid);
    R changeNum(int num, int id);
    int updateById(int id,int count);
    List<CartItem> selectByids(String ids);
    List<CartItem> queryByCid(Integer cid);
}
