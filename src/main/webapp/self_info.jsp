<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/login2.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>个人中心-收货地址页面</title>
<script type="text/javascript">
	function deleteAddr(id){
		var res = confirm("是否删除");
		if(res==true){
			window.location.href="http://localhost:8080/xiaomi/userAddress?flag=delete&id="+id;
		}
	}
	function defaultAddr(id){
		var res = confirm("是否设为默认");
		if(res==true){
			window.location.href="http://localhost:8080/xiaomi/userAddress?flag=default&id="+id;
		}
	}
</script>
</head>
<body>
<script type="application/javascript" src="js/header.js"></script>
<!--网站中间内容开始-->
<div id="dingdanxiangqing_body">
    <div id="dingdanxiangqing_body_big">
        <div id="big_left">
           	   <p style="font-size:18px;margin-top: 15px">订单中心</p>
               <a id="big_left_a" href="dingdanxiangqing.html">我的订单</a><br/>
               <a id="big_left_a" href="">意外保</a><br/>
               <a id="big_left_a" href="">团购订单</a><br/>
               <a id="big_left_a" href="">评价晒单</a><br/>
               <p style="font-size:18px">个人中心</p>
               <a id="big_left_a" href="self_info.html">我的个人中心</a><br/>
               <a id="big_left_a" href="">消息通知</a><br/>
               <a id="big_left_a" href="">优惠券</a><br/>
               <a id="big_left_a" href="">收货地址</a><br/>
        </div>
     <div id="big_right" style="height: 500px;overflow: scroll;">
     
         <div style="margin:0 20px;">
	         <h3>收货地址</h3>
	         <hr>
	         <table class="table table-striped table-hover table-bordered">
				<tr>
					<th>序号</th>
					<th>收件人</th>
					<th>手机号</th>
					<th>地址</th>
					<th>是否默认</th>
					<th>操作</th>
				</tr>
				<c:forEach var="address" items="${addresslist}" varStatus="i" >
					<tr>
						<Td>${i.count}</Td>
						<td>${address.name}</td>
						<td>${address.phone}</td>
						<td>${address.detail}</td>
						<td>${address.ord==1?"是":"否"}</td>
						<td>
							<button onclick="deleteAddr(${address.id})" class="btn btn-danger btn-sm">删除</button>&nbsp;&nbsp;
							<button class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal${address.id}">修改</button>&nbsp;&nbsp;
							<!-- 弹出模态框 -->
							<div class="modal fade" tabindex="-1" role="dialog" id="myModal${address.id}">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span>&times;</span>
										</button>
										<h4 class="modal-title">修改地址</h4>
									</div>
									<form action="userAddress?flag=update" method="post" class="form-horizontal">
										<div class="motal-body">
											<div class="form-group">
												<label class="col-sm-2 control-label">收件人</label>
												<div class="col-sm-10">
													<input type="hidden" name="id" value="${address.id}">
													<input type="hidden" name="ord" value="${address.ord}">
													<input type="text" name="name" class="form-control" value="${address.name}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">电话</label>
												<div class="col-sm-10">
													<input type="text" name="phone" class="form-control" value="${address.phone}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">收件人</label>
												<div class="col-sm-10">
													<input type="text" name="detail" class="form-control" value="${address.detail}">
												</div>
											</div>
											
										</div>
										<div class="motal-footer">
											<button type="submit" class="btn btn-primary">修改</button>
										</div>
									</form>
								</div>
							</div>
							</div>
							
							<button onclick="defaultAddr(${address.id})" class="btn btn-primary btn-sm">设为默认</button>
							<c:if test="${address.ord==1}">
								<span class="badge" style="background-color:red;">默认</span>
							</c:if>
							<c:if test="${address.ord!=1}">
								<span class="badge">普通</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<div class="container" style="width:960px;">
			<form action="addresssave.do" method="post" class="form-horizontal">
				<div class="form-group">
				    <label class="col-sm-2 form-label">收件人</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control" name="name"/>
				    </div>
				    <label class="col-sm-2 col-sm-offset-1 form-label">手机号</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control" name="phone"/>
				    </div>
				</div>
				<div class="form-group">
					<div class="form-group">
						<label class="col-sm-2 form-label">省市县</label>
						<div class="col-sm-3">
							<select name="pid" class="form-control" onchange="changePro(this)">
								<option value="-1">--请选择省份--</option>
								<c:forEach items="${provinces}" var="p">
									<option value="${p.id}">${p.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-3">
							<select name="cityid" class="form-control" id="scity" onchange="changeCity(this)">
								<option value="-1">--请选择市--</option>
							</select>
						</div>
						<div class="col-sm-3">
							<select name="countyid" class="form-control"  id="scounty">
								<option value="-1">--请选择县--</option>
							</select>
						</div>
					</div>

				</div>
				<div class="form-group">
					<label class="form-label">详细地址</label>
					<textarea rows="3" class="form-control" name="detail" ></textarea>	
				</div>
				<div class="form-group col-md-12">
					<input type="submit" class="btn btn-primary" value="添加地址">
				</div>
				<input type="hidden" value="${loginUser.id}" name="uid">
			</form>
	      </div>
       </div>
    </div>
</div>
	<script type="application/javascript">
		//监听省份变化  改变市
        function changePro(obj) {
            $("#scity").html("<option value=\"-1\">--请选择市--</option>");
            $("#scounty").html("<option value=\"-1\">--请选择/区--</option>");
            var pid=parseFloat(obj.value);
            if(pid>0){
                //发起Ajax
                $.get("citylist.do","pid="+pid,function (arr) {
                    for(var i=0;i<arr.length;i++){
                        $("#scity").append("<option value='"+arr[i].id+"'>"+arr[i].name+"</option>");
                    }
                });
            }
        }
        //监听省份变化  改变市
        function changeCity(obj) {
            $("#scounty").html("<option value=\"-1\">--请选择/区--</option>");
            var cid=parseFloat(obj.value);
            if(cid>0){
                //发起Ajax
                $.get("countylist.do","cid="+cid,function (arr) {
                    for(var i=0;i<arr.length;i++){
                        $("#scounty").append("<option value='"+arr[i].id+"'>"+arr[i].name+"</option>");
                    }
                });
            }
        }
	</script>
<!-- 底部 -->
<script type="application/javascript" src="js/footer.js"></script>

</body>
</html>