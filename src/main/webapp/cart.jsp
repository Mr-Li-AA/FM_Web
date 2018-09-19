<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车</title>
	<link rel="stylesheet" type="text/css" href="css/login2.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function pNum(id,no){
		var nums = $("#num_count"+no).val();
		$.ajax({
			url:"cartupdate.do?id="+id+"&num=1",
			method:"get",
			success:function(obj){
				location.href = "cartlist.do";
			},
			error:function(){
				alert("服务器异常");
			}
		})
	}
	function mNum(id,no){
		var num = -1; //数量
		var nums = $("#num_count"+no).val();
		if(Number(nums)<=1){
			if(confirm("确认要删除吗?")){
				num = 0;
			}else{
				return;
			}
		}
		$.ajax({
			url:"cartupdate.do?id="+id+"&num="+num,
			method:"get",
			success:function(obj){
			    if(obj.code==0){
                    location.href = "cartlist.do";
				}
			},
			error:function(){
				alert("服务器异常");
			}
		})
	}
	//
	function clearCart(){
		if(confirm("确认要删除吗")){
			 location.href="cartdel.do";
		}
	}
	var ids;//记录选中的购物车详情
	function addck(obj) {
	    console.log(obj);
	    var arrck=document.getElementsByName("ckids");
		ids="";
	    for(var i=0;i<arrck.length;i++){
	        if(arrck[i].checked){
	            //选中
				ids+=arrck[i].id.substring(2)+",";
			}
		}
		if(ids.length>0){
	       ids= ids.substring(0,ids.length-1);
		}
		alert(ids);
		// if(obj.checked()){
		// 	    //选中  添加到数组中
		// 	ids[ids.length]=id;
		// 	}else {
		// 	    //未选中 移除
		// 		if(indexofArr(id)>-1){
		// 			//存在 ---移除
		// 		}
		// 	}
    }
	//生成订单预览
	function createOrder() {
	    if(ids.length>0){
	        location.href="orderpre.do?ids="+ids;
            // $.post("orderpre.do","ids="+ids,function () {
            //
            // });
		}else {
	        alert("请选中商品!!");
		}

    }
</script>
</head>
<body style="background-color:#f5f5f5">
<script type="application/javascript" src="js/header.js"></script>
<div class="container" style="background-color: white;">
	<div class="row" style="margin-left: 40px">
		<h3>我的购物车<small>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</small></h3>
	</div>
	<div class="row" style="margin-top: 40px;">
		<div class="col-md-10 col-md-offset-1">
			<table class="table table-bordered table-striped table-hover">
 				<tr>
 					<th><input type="checkbox" id="ckall"></th>
 					<th>序号</th>
 					<th>图片</th>
 					<th>名称</th>
 					<th>价格</th>
 					<th>数量</th>
 					<th>小计</th>
 					<th>操作</th>
 				</tr>
 				<c:set value="0" var="sum"></c:set>

 				<c:forEach items="${carts}" var="c" varStatus="i">
	 				<tr>
	 					<th><input type="checkbox" id="ck${c.id}" name="ckids" onclick="addck(this)"></th>
	 					<th>${i.count}</th>
						<th><img src="${c.goods.flag==3?"":"/17fmpics/"}${c.goods.picurl}" width="100px" height="100px"/> </th>
	 					<th><a href="/goodsbyid.do?id=${c.goods.id}">${c.goods.name}</a> </th>
	 					<th>${c.goods.price/100.0}</th>
	 					<th width="100px">
		 					<div class="input-group">
		 						<span class="input-group-btn">
		 							<button class="btn btn-default" type="button" onclick="mNum(${c.id},${i.count})">-</button>
		 						</span>
		 						<input type="text" class="form-control" id="num_count${i.count}" value="${c.count}" readonly="readonly" style="width:40px">
		 						<span class="input-group-btn">
		 							<button class="btn btn-default" type="button" onclick="pNum(${c.id},${i.count})">+</button>
		 						</span>
	 						</div>
	 					</th>
	 					<th>¥&nbsp;${c.goods.price*c.count/100.0 }</th>
	 					<th>
	 						<button type="button" class="btn btn-default" onclick="clearCart()">删除购物车</button>
	 					</th>
	 				</tr>
	 				<c:set var="sum" value="${sum+c.goods.price*c.count/100.0}"></c:set>
 				</c:forEach>
			</table>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="pull-right" style="margin-right: 40px;">
			
	            <div>
	            	<a  href="addresslist.do" class="btn btn-default btn-lg">查看收货地址</a>
	            	&nbsp;&nbsp;
	            	<a href="javascript:createOrder()" class="btn  btn-danger btn-lg">生成订单</a>
	            </div>
	            <br><br>
	            <div style="margin-bottom: 20px;">        		  
	            	商品金额总计：<span id="total" class="text-danger"><b>￥&nbsp;&nbsp;${sum}</b></span>
	            </div>
		</div>
	</div>
</div>
	
    
<!-- 底部 -->
<script type="application/javascript" src="js/footer.js"></script>

</body>
</html>