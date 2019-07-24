<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 구매 내역</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp" />
<style>
.orderWrapper {
	border: 1px solid #dddddd;
	border-top: none;
	width: 100%;
}

#header_v5_wrap_height {
	height: 200px;
}

.goods_name {
	line-height: 15px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis
}

.cell {
	border-left: 1px solid #ddd
}

input {
	padding-left: 5px;
	padding-top: 3px;
	padding-bottom: 3px;
}

table.list_table_style {
	border: 0px;
	border-top: 2px solid #559c75;
}

table.list_table_style thead th {
	font-size: 12px;
	height: 35px;
	font-family: 'Spoqa Han Sans', sans-serif;
	border-right: 0px;
	border-left: 0px;
}

.cell {
	font-size: 12px;
}

table.list_table_style td.cell {
	font-family: 'Spoqa Han Sans', sans-serif;
	border-right: 0px;
	border-left: 0px;
}

.white {
	color: white;
}

.bottom_line {
	border-bottom: 1px solid #dddddd;
}

.orderImg {
	border-radius: 10px;
	width: 100%;
}

.orderLists {
	height: 100px;
}

.productsImg {
	border-radius: 10px;
}

#listSearchBox {
	padding: 40px;
	font-size: 13px;
}

.durBtns {
	font-size: 13px;
	margin-right: 3px;
	padding: 3px;
	padding-left: 4px;
	padding-right: 4px;
}

.showShipping {
	background-color: dimgray;
	border: dimgray;
	font-size: 13px;
	margin-right: 3px;
	padding: 3px;
	padding-left: 4px;
	padding-right: 4px;
}
#empty{
	font-size: 13px;
}
</style>


<script>
	$(function() {
		$(".durBtns").on("click", function() {
			$("#btnValue").val($(this).val());
			$("#orderSearch").submit();
		})

		$(".showShipping").on("click", function(){
			var title = $(this).parent().parent().find("td:nth-child(2)").find("table:nth-child(1)").find("tr:nth-child(1)").find("td:nth-child(2)").find("div:nth-child(1)").find("a:nth-child(1)").html();
			window.open("shipping?s_orderno="+$(this).parent().find("input:nth-child(3)").val()+"&s_p_title="+title, "",
			"width=900px, height=700px");
		})
	});
</script>



</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp" />
	<!-- 	images -->
	<div class="container-fluid imageContainer m-0 p-0 my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="resources/img/mypage1.jpg" align="bottom"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="resources/img/mypage2.jpg" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="resources/img/mypage3.jpg" class="d-block w-100"
								alt="...">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	contents -->
	<div class="container my wrapper">
		<div class="row text-center mt-5 my">

			<jsp:include page="/WEB-INF/views/module/mypage.jsp" />


			<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12 pt-5 my">
				<div class="list-group">
					<a href="/mypageFirst" class="list-group-item list-group-item-action">Overview</a>
				  <a href="/mypageInfo" class="list-group-item list-group-item-action">내 정보 수정</a>
				  <a href="orderList" class="list-group-item list-group-item-action currentActive">구매 내역</a>
				  <a href="subsList" class="list-group-item list-group-item-action">정기 구독</a>
				  <c:if test="${grade == 'admin'}">
				  		<a href="productsAdd" class="list-group-item list-group-item-action">상품 등록</a>
				  </c:if>
				  <a href="/mypageDelete" class="list-group-item list-group-item-action">탈퇴하기</a>
				</div>
			</div>


			<div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pt-5 pb-5 my">
				<div class="row my">
					<div class="common-container-right-section col-12">

						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active" href="#">구매
									내역</a></li>
						</ul>
						<div class="orderWrapper">
							<div id="listSearchBox">
								<form action="orderSearch" id="orderSearch" method="post">
									<span id="orderStatus" class="mr-3">주문상태 </span> <select
										name="orderStatus" class="p-1">
										<option>전체</option>
										<option>입금 대기</option>
										<option>결제 완료</option>
										<option>배송중</option>
										<option>배송 완료</option>
										<option>구매 완료</option>
										<option>구매 취소</option>
									</select> <span id="orderDuration" class="ml-5 mr-3">조회기간 </span> <span>
										<input type="button" value="1주일" id="week"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="1개월" id="month"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="3개월" id="months"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="6개월" id="halfyear"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="전체" id="all"
										class="btn btn-outline-secondary durBtns"> <input
										type="hidden" id="btnValue" name="orderDuration">
									</span>
								</form>
							</div>

							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="list_table_style">
								<thead class="bottom_line">
									<tr>
										<th width="60">주문번호</th>
										<th width="110">상품명</th>
										<th width="90">주문일</th>

										<th width="70">주문금액</th>
										<th width="70" class="goods_delivery_info">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test='${listWrapper=="[]"}'>
											<tr>
												<td class="td_bottom_line" align="center" colspan="9"
													height="80" id="empty">구매 내역이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${listWrapper}">
												<c:set var="count" value="0" />
												<c:set var="total" value="0" />
												<c:forEach var="dto" items="${list}" varStatus="status">
													<c:set var="total"
														value="${total + dto.s_p_price*dto.s_p_count}" />
													<c:set var="count" value="${count+1}" />
													<c:if test="${status.last}">
														<tr class="pt-3 pb-3 orderLists bottom_line">
															<td class="cell">${dto.s_orderno }</td>
															<td class="cell">
																<table width="100%" border="0" cellpadding="0"
																	cellspacing="0">
																	<tr>
																		<td class="center" width="100" height="60"
																			valign="middle"><img src="${dto.s_p_imagepath }"
																			class="productsImg" width="70px" height="70px"></td>
																		<td valign="middle">
																			<div class="goods_name">
																				<c:choose>
																					<c:when test="${count-1==0 }">
																						<a href="#" title="${dto.s_p_title }">${dto.s_p_title }
																						</a>
																					</c:when>
																					<c:otherwise>
																						<a href="#" title="${dto.s_p_title }">${dto.s_p_title } 외  ${count-1 } 건</a>
																					</c:otherwise>
																				</c:choose>
																			</div>
																		</td>
																	</tr>
																</table>
															</td>
															<td class="cell">${dto.s_orderdate }</td>
															<td class="cell"><fmt:formatNumber value="${total }"
																	type="number" />원</td>
															<c:choose>
																<c:when test="${dto.s_statement =='배송중'}">
																	<td class="cell"><span class="mr-1">${dto.s_statement }</span><input
																		type="button" value="배송조회"
																		class="showShipping btn btn-dark">
																		<input type="hidden" value="${dto.s_orderno }"></td>
																</c:when>
																<c:when test="${dto.s_statement =='입금 대기'}">
																	<td class="cell" style="color:dodgerblue;">${dto.s_statement }</td>
																</c:when>
																<c:when test="${dto.s_statement =='주문 만료'}">
																	<td class="cell" style="color:red;">${dto.s_statement }</td>
																</c:when>
																<c:otherwise>
																	<td class="cell">${dto.s_statement }</td>
																</c:otherwise>
															</c:choose>

														</tr>
													</c:if>
												</c:forEach>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp" />
</body>
</html>