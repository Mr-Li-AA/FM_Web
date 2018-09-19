package com.shaoshuai.mapper;

import com.shaoshuai.domain.Goods;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GoodsMapper {

    @Select("select id,name,tid,pubdate,dowdate,createtime,price,star,picurl,flag,uid,info from t_goods where id=#{id}")
    @ResultType(Goods.class)
    Goods selectById(Integer id);

    @Select("select g.*,gt.name typename from t_goods g left join t_goodstype gt on g.tid=gt.id where g.tid=#{tid}")
    @ResultType(Goods.class)
    List<Goods> selectByTid(int id);
}
