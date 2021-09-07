<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="renderer" content="webkit" />
		<meta name="robots" content="index, follow" />
		<title>求租房屋信息_我的网站</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="skin/css/font-awesome.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/bootstrap.min.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/owl.carousel.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/owl.theme.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/settings.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/style-red.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/tk.css" media="screen" />
		<script type="text/javascript" src="skin/js/jquery.min.js"></script>
		<script type="text/javascript" src="skin/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="skin/js/owl.carousel.min.js"></script>
	</head>

	<body>
		<div id="container">
			<jsp:include page="top.jsp"></jsp:include>

			<div class="breadcrumb-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-4 bcid-cat">求租房屋信息</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>求租房屋信息</a> > </span></div>
					</div>
				</div>
			</div>
			
			
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
				<aside class="sidebar col-md-12 inner-right" role="complementary" style="    margin-bottom: 20px;">
							<section class="widget side-search">
								<h3 class="title">站内搜索</h3>
								<form class="searchform" id="searchform" name="formsearch" method="post" action="selectGoodsList_qz.do">
									<div class="sform-div">
										<input type="text"  name="name" placeholder="输入租房屋名称" id="s" class="sidebar col-md-3 inner-right"   style="display: block; width: 15%;"/>
										<select name="price1" class="sidebar col-md-3 inner-right"   style="display: block; width: 15%; height: 48px;">
										<option value="">请选择单价</option>
										<option value="1">800元/月以下</option>
										<option value="2">800~1000元/月</option>
										<option value="3">1000元/月以上</option>
										</select>
										<!-- <select name="zprice" class="sidebar col-md-2 inner-right"   style="display: block; width: 15%; height: 48px;">
										<option value="">请选择总价</option>
										<option value="1">50万以下</option>
										<option value="2">50~80万</option>
										<option value="3">80万以上</option>
										</select> -->
										<select name="area" class="sidebar col-md-2 inner-right"   style="display: block; width: 15%; height: 48px;">
										<option value="">请选择面积</option>
										<option value="1">50m²以下</option>
										<option value="2">50~70m²</option>
										<option value="3">70m²以上</option>
										</select>
										<select name="fid" class="sidebar col-md-2 inner-right"   style="display: block; width: 15%; height: 48px;">
										<option value="">请选择户型</option>
										<c:forEach items="${tlist }" var="t">
										<option value="${t.id }">${t.name }</option>
										</c:forEach>
										</select>
										<input type="submit" id="searchsubmit" value="" />
									</div>
								</form>
							</section>
						</aside>
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="prolist-wrap">
								<div id="portfolio-container">
									<div class="row portfolio-3-columns isotope-x clearfix">
									<c:forEach items="${list }" var="u">
										<div class="portfolio-item isotope-item col-sm-4 col-xs-6">
											<article>
												<figure class="glass-animation">
													<a class="swipebox" href="showGoodsx.do?id=${u.id }"> <span class="background"></span> <span class="glass"><span class="circle"><i class="handle"></i></span></span>
													 <img class="img-responsive" src="./upload/${u.img }" alt="${u.name }" style="width:262px;height:262px;"/> </a>
												</figure>
												<h5 class="item-title"> <a href="showGoodsx.do?id=${u.id }" title="${u.name }">求租房屋名称：${u.name }</a> </h5>
												<h5 class="item-title"> <a href="showGoodsx.do?id=${u.id }" title="${u.name }">分类：
												<c:forEach items="${tlist }" var="t">
												<c:if test="${t.id==u.fid }">
												${t.name }
												</c:if>
												</c:forEach>
												</a> </h5>
												<h5 class="item-title"> <a href="showGoodsx.do?id=${u.uid }" title="${u.name }">单价：${u.price1 }</a> </h5>
												<div class="flex separator"> <span class="line"></span> <span class="wrap"><span class="square"></span></span>
												</div>
											</article>
										</div>
										</c:forEach>
										
									</div>
									<div id="pages" class="page">
									<c:if test="${sessionScope.p==1 }">
										<c:if test="${page.page>1}">
							             <a href="showGoodsList_qz.do?page=1" >首页</a>
							             <a href="showGoodsList_qz.do?page=${page.page-1 }"> 上一页</a> 
							             </c:if>
							    	     <c:if test="${page.page<page.totalPage}">
									     <a href="showGoodsList_qz.do?page=${page.page+1 }">下一页</a>
										 <a href="showGoodsList_qz.do?page=${page.totalPage }">末页</a>
									    </c:if>
									    </c:if>
									    <c:if test="${sessionScope.p==2 }">
										<c:if test="${page.page>1}">
							             <a href="selectGoodsList_qz.do?page=1" >首页</a>
							             <a href="selectGoodsList_qz.do?page=${page.page-1 }"> 上一页</a> 
							             </c:if>
							    	     <c:if test="${page.page<page.totalPage}">
									     <a href="selectGoodsList_qz.do?page=${page.page+1 }">下一页</a>
										 <a href="selectGoodsList_qz.do?page=${page.totalPage }">末页</a>
									    </c:if>
									    </c:if>
									    <c:if test="${sessionScope.p==3 }">
										<c:if test="${page.page>1}">
							             <a href="showGoodsList_qz_commend.do?page=1" >首页</a>
							             <a href="showGoodsList_qz_commend.do?page=${page.page-1 }"> 上一页</a> 
							             </c:if>
							    	     <c:if test="${page.page<page.totalPage}">
									     <a href="showGoodsList_qz_commend.do?page=${page.page+1 }">下一页</a>
										 <a href="showGoodsList_qz_commend.do?page=${page.totalPage }">末页</a>
									    </c:if>
									    </c:if>
										
									</div>
								</div>
							</div>
						</div>
						<!-- <aside class="sidebar col-md-3 inner-right" role="complementary">
							<section class="widget side-search">
								<h3 class="title">站内搜索</h3>
								<form class="searchform" id="searchform" name="formsearch" method="post" action="selectGoodsList_qz.do">
									<input type="hidden" name="kwtype" value="0" />
									<div class="sform-div">
										<input type="text"  name="name" placeholder="输入求租房屋名称" id="s" />
										<input type="submit" id="searchsubmit" value="" />
									</div>
								</form>
							</section>
						</aside> -->
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
			
			<jsp:include page="foot.jsp"></jsp:include>
			
		</div>
		
     <jsp:include page="foot2.jsp"></jsp:include>


