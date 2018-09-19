package com.shaoshuai.web.controller;

import com.shaoshuai.domain.Cart;
import com.shaoshuai.service.CartItemService;
import com.shaoshuai.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class CartController {

    @Autowired
    private CartItemService service;

    //添加购物车
    @RequestMapping("cartsave.do")
    public String save(int gid, HttpSession session){
        Cart cart= (Cart) session.getAttribute("cart");
        if (cart!=null){
            if (service.saveOrUpdate(cart.getId(),gid)){
                return "cartSuccess.jsp";

            }else {
                return "goodsbyid.do?id="+gid;
            }
        }else {
            return "login.jsp";
        }

    }
    //改变数量
    @GetMapping("cartupdate.do")
    @ResponseBody
    public R changeNum(int num,int id){
        return service.changeNum(num,id);
    }
    //删除
    @GetMapping("cartdel.do")
    public String del(HttpSession session){
        Cart cart= (Cart) session.getAttribute("cart");
        if (cart!=null){
            if (service.deleteByCid(cart.getId())>0){
                return "index.jsp";
            }else {
                return "cartlist.do";
            }
        }else {
            return "login.jsp";
        }

    }
    // 查询购物车详情
    @RequestMapping("cartlist.do")
    public String list(HttpSession session, Model model){
        Cart cart= (Cart) session.getAttribute("cart");
        if (cart!=null){
            model.addAttribute("carts",service.queryByCid(cart.getId()));
            return "cart.jsp";
        }else {
            return "login.jsp";
        }
    }
}
