package com.shaoshuai.common.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
    public static String md5(String password){
        //获取MD5摘要
        try {
            MessageDigest md=MessageDigest.getInstance("MD5");
            //设置密码
            md.update(password.getBytes());
            //生成md5的结果
            return new BigInteger(1,md.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
}
