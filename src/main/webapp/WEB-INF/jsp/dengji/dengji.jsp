<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />


  <%--<link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link>--%>
  <%--<link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>--%>
  <%--<link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>--%>
  <%--<link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->--%>
  <%--<script type="text/javascript" src="${ctx}/js/page.js"></script>--%>
  <%--<script type="text/javascript" src="${ctx}/js/common.js"></script>--%>
	  <%--<script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>--%>
	  <%--<script src="${ctx}/bootstrap/js/bootstrap.js"></script>--%>


	  <script src="/static/refre/js/back-to-top.js" type="text/javascript"></script>
	  <script src="/static/bootstrap/js/bootstrap.js"></script>
	  <script src="/static/refre/js/layout.js" type="text/javascript"></script>

	  <!-- Global styles END -->
	  <link  href="/static/bootstrap/css/bootstrap.css" rel="stylesheet" >
	  <link href="/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	  <%--<script src="/static/bootstrap/js/jquery-3.1.1.min.js"></script>--%>
  <%--<link href="/static/refre/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />--%>
	  <%--<script src="/static/refre/js/jquery-1.11.0.min.js"></script>--%>

	  <!-- Page level plugin styles START -->
	  <link href="/static/refre/css/owl.carousel.css" rel="stylesheet">
	  <link href="/static/refre/css/uniform.default.min.css" rel="stylesheet" type="text/css">
	  <link href="/static/refre/css/style.css" rel="stylesheet" type="text/css" media="all" />
	  <script type="text/javascript" src="/static/refre/js/memenu.js"></script>
	  <!-- Theme styles START -->
	  <link href="/static/refre/css/components.css" rel="stylesheet">
	  <link href="/static/refre/css/style-shop.css" rel="stylesheet" type="text/css">
	  <link href="/static/refre/css/style-responsive.css" rel="stylesheet">
	  <link href="/static/refre/css/red.css" rel="stylesheet" id="style-color">
	  <link href="/static/refre/css/custom.css" rel="stylesheet">


 
  <body>
  <div class="main" >

	  <div class="container">

		  <!-- BEGIN SIDEBAR & CONTENT -->
		  <div class="row margin-bottom-40">
			  <!-- BEGIN CONTENT -->
			  <div class="col-md-12 col-sm-12">
				  <h1>结账</h1>
				  <!-- BEGIN CHECKOUT PAGE -->
				  <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

					  <!-- BEGIN SHIPPING METHOD -->
					  <div id="shipping-method" class="panel panel-default">
						  <div class="panel-heading">
							  <h2 class="panel-title">
								  <a data-toggle="collapse" data-parent="#checkout-page" href="#shipping-method-content" class="accordion-toggle">
									  第一步 : 旅客登记
								  </a>
							  </h2>
						  </div>
						  <div id="shipping-method-content" class="panel-collapse collapse in">
							  <div class="panel-body row">
								  <div class="col-md-12">
								  <jsp:include page="register.jsp"/>
								  <button class="btn btn-primary  pull-right" type="submit" id="button-shipping-method" data-toggle="collapse" data-parent="#checkout-page" data-target="#payment-method-content">继续</button>
								  </div>
							  </div>
						  </div>
					  </div>
					  <!-- END SHIPPING METHOD -->

					  <!-- BEGIN PAYMENT METHOD -->
					  <div id="payment-method" class="panel panel-default">
						  <div class="panel-heading">
							  <h2 class="panel-title">
								  <a data-toggle="collapse" data-parent="#checkout-page" href="#payment-method-content" class="accordion-toggle">
									  第二步: 安排房间
								  </a>
							  </h2>
						  </div>
						  <div id="payment-method-content" class="panel-collapse collapse">
							  <div class="panel-body row">
								  <jsp:include page="arrangeroom.jsp"/>
								  <button class="btn btn-primary  pull-right" type="submit" id="button-shipping-method2" data-toggle="collapse" data-parent="#checkout-page" data-target="#confirm-content">继续</button>
							  </div>
						  </div>
					  </div>
					  <!-- END PAYMENT METHOD -->

					  <!-- BEGIN CONFIRM -->
					  <div id="confirm" class="panel panel-default">
						  <div class="panel-heading">
							  <h2 class="panel-title">
								  <a data-toggle="collapse" data-parent="#checkout-page" href="#confirm-content" class="accordion-toggle">
									  第四步: 确定订单
								  </a>
							  </h2>
						  </div>
						  <div id="confirm-content" class="panel-collapse collapse">
							  <div class="panel-body row">
								  <div class="col-md-12 clearfix">
									  <div class="table-wrapper-responsive">

									  </div>
									  <div class="checkout-total-block">
										  <ul>
											  <li>
												  <em>小计共</em>
												  <strong class="price"><span>$</span>47.00</strong>
											  </li>
											  <li>
												  <em>运费</em>
												  <strong class="price"><span>$</span>3.00</strong>
											  </li>
											  <li>
												  <em>折扣</em>
												  <strong class="price"><span>$</span>0.00</strong>
											  </li>
											  <li class="checkout-total-price">
												  <em>最终</em>
												  <strong class="price"><span>$</span>50.00</strong>
											  </li>
										  </ul>
									  </div>
									  <div class="clearfix"></div>
									  <button class="btn btn-primary pull-right" type="submit" id="button-confirm">确定订单</button>
									  <button type="button" class="btn btn-default pull-left margin-right-20">取消</button>
								  </div>
							  </div>
						  </div>
					  </div>
					  <!-- END CONFIRM -->
				  </div>
				  <!-- END CHECKOUT PAGE -->
			  </div>
			  <!-- END CONTENT -->
		  </div>
		  <!-- END SIDEBAR & CONTENT -->
	  </div>

  </div>


  <!-- END PAGE LEVEL JAVASCRIPTS -->


  </body>
</html>
