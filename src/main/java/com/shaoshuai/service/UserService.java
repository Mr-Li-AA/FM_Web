package com.shaoshuai.service;

import com.shaoshuai.domain.User;

public interface UserService {
    boolean save(User user);
    User login(String name,String pass);
    boolean changePass(String pass,int uid);
    boolean selectByUserName(String username);
    boolean selectByEmail(String email);
}
