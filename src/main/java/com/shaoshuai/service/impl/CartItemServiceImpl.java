package com.shaoshuai.service.impl;

import com.shaoshuai.domain.CartItem;
import com.shaoshuai.mapper.CartItemMapper;
import com.shaoshuai.service.CartItemService;
import com.shaoshuai.vo.R;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CartItemServiceImpl implements CartItemService {

    @Autowired
    private CartItemMapper mapper;

    @Override
    public int deleteById(Integer id) {
        return mapper.deleteById(id);
    }

    @Override
    public int deleteByCid(Integer cid) {
        return mapper.deleteByCid(cid);
    }

    @Override
    public boolean save(CartItem record) {
        return mapper.insert(record)>0;
    }

    @Override
    public boolean saveOrUpdate(int cid, int gid) {
        //查询是否存在
        Integer id=mapper.selectByCgid(cid, gid);
        if (id!=null){
            //存在+1
            return  updateById(id,1)>0;
        }else {
            //不存在 新增
            CartItem item= new CartItem();
            item.setCount(1);
            item.setGid(gid);
            item.setCid(cid);
            return save(item);
        }

    }

    @Override
    public R changeNum(int num, int id) {
        int r1=0;
        switch (num){
            case 0://删除
                r1=deleteById(id);
                break;
                default:
                    r1=updateById(id,num);
                    break;
        }
        if (r1>0){
            return R.ok();
        }else {
            return R.error();
        }

    }

    @Override
    public int updateById(int id, int count) {
        return mapper.updateById(id,count);
    }

    @Override
    public List<CartItem> selectByids(String ids) {
        return mapper.selectByids(ids);
    }

    @Override
    public List<CartItem> queryByCid(Integer cid) {
        List<CartItem> items=mapper.selectByCid(cid);
        System.out.println(items);
        return items;
    }
}
