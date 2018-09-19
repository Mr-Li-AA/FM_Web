package com.shaoshuai.service.impl;

import com.shaoshuai.domain.Cart;
import com.shaoshuai.mapper.CartMapper;
import com.shaoshuai.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper mapper;

    @Override
    public boolean save(int uid) {
        return mapper.insert(uid)>0;
    }

    @Override
    public Cart queryById(int uid) {
        return mapper.selectByUid(uid);
    }
}
