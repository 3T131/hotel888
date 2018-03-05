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

	
<!--   <link rel="stylesheet" href="/static/css/roomset/roomset.css" type="text/css"></link> -->
  <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link href="/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="/static/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="/static/bootstrap/js/bootstrap.js"></script>
   
   <style>
   
   .container{
     margin-top: 10px;
   }
   
   .theadone{
     background-color: #CCFF99;
    }
   
   .floatont{
     float:left;
   }
   
   .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
    
    .marginrightone{
      margin-right: 33px;
    }
    
    .marginrighttwo{
      margin-right: 16.5px;
    }
    
    .marginrightthree{
      margin-right: 43px;
    }
    
   .textone{
    margin-top:12px;
    }
    
    .inputone{
    width:54.2%;
    }
    
    .inputtwo{
      width:46.8%;
    }
    
    .inputthree{
      width:46.8%;
    }
    
    .cboone{
      margin-top:10px;
      height: 27px;
    }
    
    .margin-top-one{
      margin-top: -10px;
    }
    
    .margin-top-two{
      margin-top: -20px;
    }
  
    .textwidth{
      width: 138px;
    }
    
    .radiusone{
     margin-left: -4px;
    }
    
     @media(min-width:731px) and (max-width:767px){
      .inputthree{
      width: 50.5%;
    }
    }
    
    @media(min-width:550px) and (max-width:730px){
      .inputtwo{
      width: 46.2%;
    }
        .inputthree{
      width: 49.2%;
    }
    }
    
    
     @media(min-width:431px) and (max-width:550px){
      .inputtwo{
      width: 43.2%;
    }
      .inputthree{
      width: 47.5%;
    }
    }
    
    @media(min-width:366px) and (max-width:430px){
      .inputtwo{
      width: 40.2%;
    }
      .inputthree{
      width: 46%;
    }
    }
    
     @media(min-width:285px) and (max-width:366px){
      .inputtwo{
      width: 37.2%;
    }
      .inputthree{
      width: 44%;
    }
    }
    
     @media(min-width:237px) and (max-width:285px){
      .inputtwo{
      width: 30%;
    }
      .inputthree{
      width: 40%;
    }
    }
    .span12{
      width:95%;
    }
    
    .yangse{
      color:blue;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">旅客结账</h3>
        
      </div>
    </div>
    <form  method="post" onsubmit="return verify()">
    <input type="hidden" id="stayId" value="${stayRegister2.stayRegisterId}">         <!-- 住宿ID -->
    <input type="hidden" id="roomId" value="${stayRegister2.roomID}">         <!-- 住宿ID -->
    <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button type="button" class="btn btn-primary" onclick="payfunction()">
				   	 <li class="icon-check icon-white"></li>结账</button>
				  </div> 
				 
			  </div>
	  </div>
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>取消</button>
		   </div>
	     </div>
      </div>
       
    
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:20px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">房间号：</label>
		        <label class="yangse">${stayRegister2.roomNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客姓名：</label>
		        <label class="yangse">${stayRegister2.passengerList[0].name}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">接待对象：</label>
		        <label class="yangse">${stayRegister2.receiveTarget.principal}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">出租方式：</label>
		        <label class="yangse">${stayRegister2.rentOutType}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账单位：</label>
		        <label class="yangse">${stayRegister2.billUnit}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账方式：</label>
		         <select id="payWayId" class="yangse" style="width:70%;height:27px;">
		            <c:forEach items="${listOne}" var="item">
			          <option value="${item.attributeDetailsId}" <c:if test="${item.attributeDetailsId==21}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">登记时间：</label>
		        <label class="yangse"><fmt:formatDate value="${stayRegister2.registerTime}" pattern="yyyy-MM-dd"/></label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账时间：</label>
		        <label id="payTimeId" class="yangse"><fmt:formatDate value="${timestamp}" pattern="yyyy-MM-dd"/></label>
		     </div>
		     <div class="span3">
		        <label class="floatont">天数或钟点：</label>
		        <label class="yangse">${stayRegister2.stayNumber}</label>
		     </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
			  <div class="span4">
				  <label class="floatont">出租方式：</label>
				  <label class="yangse">${stayRegister2.rentOutType}</label>
			  </div>
		     <c:if test="${stayRegister2.rentOutTypeID==26}">
				 <div class="span4">
					 <label class="floatont">房价/天：</label>
					 <label class="yangse">${stayRegister2.room.standardPriceDay}</label>
				 </div>
			 </c:if>
		     <c:if test="${stayRegister2.rentOutTypeID==25}">
				 <div class="span4">
					 <label class="floatont">房价/小时：</label>
					 <label class="yangse">${stayRegister2.room.standardPrice}</label>
				 </div>
			 </c:if>
		     <div class="span3">
		        <label class="floatont">首段价格：</label>
		        <label class="yangse">${stayRegister2.room.firstDuration}</label>
		     </div>
		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">住宿费：</label>
		        <label class="yangse">${stayRegister2.accommodation}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">换房次数：</label>
		        <label class="yangse">
					<c:if test="${stayRegister2.changingRoomNumber!=null}">
						${stayRegister2.changingRoomNumber}次
					</c:if>
					<c:if test="${stayRegister2.changingRoomNumber==null}">
						0次
					</c:if>
				</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">换房费：</label>
		        <label class="yangse">
					<c:if test="${stayRegister2.changRoomMoney!=null}">
						${stayRegister2.changRoomMoney}元
					</c:if>
					<c:if test="${stayRegister2.changRoomMoney==null}">
						0.0元
					</c:if>
				</label>
		     </div>
		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">其他消费：</label>
		        <label class="yangse">${stayRegister2.otherConsumer}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账金额：</label>
		        <label class="yangse">${stayRegister2.sumConst}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">押金：</label>
		        <label class="yangse">${stayRegister2.depoit.depositMoney}</label>
		     </div>
		  </div>
	    </div>
	    <div class="span10">
          <fieldset>
            <legend></legend>
          </fieldset>
        </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <label style="float: left;">备注：　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　</label>
	      <label style="float: left;">应补缴金额：</label><label style="color:red;">${yingBuJinE}</label>
	      <input id="remarksId" class="yangse" type="text" style="width:100%;height:25px;"> 
	    </div>
	    
	
		  
      </form>
      
    </div>
  
 
 
 
 
 <script type="text/javascript">

	 $(function(){
	     if(${error!=null}){
	         alert("结账失败，请稍后再试..");
         }
	 })
    function verify(){
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do';
   }
   function payfunction(){
       alert("结账成功！");
	   var id=document.getElementById('stayId').value;
	   var remarks=document.getElementById('remarksId').value;
	   var payTime=document.getElementById('payTimeId').innerHTML;
	   var payWayId=document.getElementById('payWayId').value;
	   var roomId=document.getElementById('roomId').value;
	   if(remarks.length>100){
	      alert("你输入的  备注  太过长了，请控制为  100 位长度");
	      return false;
	   }
	   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/pay.do?stayRegisterId='+id+
	     '&remarks='+remarks+'&payTime='+payTime+'&payWayId='+payWayId+'&roomID='+roomId;
   }
 </script>
  </div>
  </body>
</html>
