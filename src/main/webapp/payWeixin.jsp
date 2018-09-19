<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
		<title>在线支付</title>
	<link rel="stylesheet" type="text/css" href="css/login2.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<script type="application/javascript" src="js/header.js"></script>
<body>
	<div class="container">
		<div class="row">
			<div class="">
				<div class="panel panel-default"  style="margin: 0 auto;width: 95%;">
				  <div class="panel-heading">
				    <h3 class="panel-title"><span class="glyphicon glyphicon-yen"></span>&nbsp;&nbsp;在线支付
				    	<span class="pull-right"><a href="${pageContext.request.contextPath }/orderlist.do">返回订单列表</a>
				    	</span>
				    </h3>
				  </div>
				  <div class="panel-body">	 
				  	<form  action="/paypre.do" method="post">
					<table class="table table-bordered table-striped table-hover">
						<tr>
							<td colspan="1">订单号:</td>
							<td colspan="3"><input type="text" class="form-control" name="oid" value="<%=request.getParameter("oid")%>" readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan="1">支付金额:</td>
							<td colspan="3">
								<div class="input-group" style="width: 200px;">
							      <input type="text" class="form-control"  name="price" value="<%=request.getParameter("omoney")%>">
							      <div class="input-group-addon"><span class="glyphicon glyphicon-yen"></span></div>
						      	</div>
							</td>
						</tr>
						<tr>
							<td colspan="1">商品介绍:</td>
							<td colspan="3"><input type="text" class="form-control" name="body" value="" >

							</td>
						</tr>
						
					</table>
					<div class="pull-right" style="margin-right: 30px;">
						<input type="submit" value="确认支付" class="btn btn-warning btn-lg">
						
					</div>
					</form>
				 </div>
			   </div>
			</div>
			
		</div>
		
	</div>
	<!-- 底部 -->
  <script type="application/javascript" src="js/footer.js"></script>

	
</body>
</html>