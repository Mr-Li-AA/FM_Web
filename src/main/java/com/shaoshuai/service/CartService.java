package com.shaoshuai.service;

import com.shaoshuai.domain.Cart;

public interface CartService {

    boolean save(int uid);
    Cart queryById(int uid);

}
