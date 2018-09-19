package com.shaoshuai.service.impl;

import com.shaoshuai.domain.User;
import com.shaoshuai.mapper.CartMapper;
import com.shaoshuai.mapper.UserMapper;
import com.shaoshuai.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper mapper;
    @Autowired
    private CartMapper cartMapper;
    @Override
    public boolean save(User user) {
        boolean r=mapper.insert(user)>0;
        if (r){
            cartMapper.insert(user.getId());
        }
        return r;
    }

    @Override
    public User login(String name, String pass) {
        User user=mapper.selectByName(name);
        if (user!=null){
            if (Objects.equals(pass,user.getPassword())){
                //成功
                return  user;
            }
        }
        return null;
    }

    @Override
    public boolean changePass(String pass, int uid) {
        return mapper.updatePassword(pass,uid)>0;
    }

    @Override
    public boolean selectByUserName(String username) {
        Integer id=mapper.selectByUserName(username);
        if (id !=null){
            return  true;
        }else {
            return false;
        }

    }

    @Override
    public boolean selectByEmail(String email) {
        Integer id=mapper.selectByEmail(email);
        if (id!=null){
            return true;
        }else {
            return false;
        }

    }
}
