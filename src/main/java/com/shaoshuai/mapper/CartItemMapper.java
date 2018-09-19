package com.shaoshuai.mapper;

import com.shaoshuai.domain.CartItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartItemMapper {

    int deleteById( Integer id);
    int deleteByCid(Integer cid);
    int insert(CartItem record);
    //只负责修改
    int updateById(@Param("id") int id,@Param("count") int count);
    //购物车详情
    List<CartItem> selectByCid(Integer cid);
    //订单预览
    List<CartItem> selectByids(@Param("ids") String ids);
    Integer selectByCgid(@Param("cid")int cid,@Param("gid") int gid);
    int deleteIds(@Param("ids") String ids);

}
