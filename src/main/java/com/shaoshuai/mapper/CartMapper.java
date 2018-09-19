package com.shaoshuai.mapper;

import com.shaoshuai.domain.Cart;

public interface CartMapper {
    int insert(int uid);
    Cart selectByUid(Integer uid);
}
