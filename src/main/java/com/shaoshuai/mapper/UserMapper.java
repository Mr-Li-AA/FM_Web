package com.shaoshuai.mapper;

import com.shaoshuai.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    int insert (User record);
    User selectByName(String name);
    int updatePassword(@Param("pass") String pass,@Param("id") int id);
    Integer selectByUserName(String username);
    Integer selectByEmail(String email);

}
