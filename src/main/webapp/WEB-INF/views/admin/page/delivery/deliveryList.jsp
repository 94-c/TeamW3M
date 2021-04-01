<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/page/include/admin_header.jsp"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>배송 현황</title>

<style type="text/css">
table {
	margin: auto;
}

table, td, th {
	border-collapse: collapse;
	border: 1px solid black;
}
#submitbutton {
	margin: 10px;
	float: right;
	margin-left: 3px;
	width: 108px;
	height: 38px;
	font-size: 13px;
	line-height: 38px
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".changeState").click(function(e){
		e.preventDefault();
		document.deliveryForm.submit();
	});
});
	//이전 버튼 이벤트
	function fn_prev(page, range, rangSize, searchKeyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pagContext.request.contextPath}/getDeliveryList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangSize, searchKeyword) {
		var url = "${pagContext.request.contextPath}/getDeliveryList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangSize, searchKeyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pagContext.request.contextPath}/getDeliveryList.mdo";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword" + searchKeyword;
		location.href = url;
	}

	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/getDeliveryList.mdo";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});
</script>
<c:url var="getDeliveryList" value="getDeliveryList.mdo">
	<c:param name="page" value="${pagination.page }" />
	<c:param name="range" value="${pagination.range }" />
	<c:param name="rangeSize" value="${pagination.rangeSize}" />
	<c:param name="searchKeyword" value="${pagination.searchKeyword}" />
</c:url>
<main>
	<div class="container-fluid">
		<h1 class="mt-4">배송 현황 페이지</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">SHIPPING LIST</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 배송 목록
			</div>
			<form action="changeDeliveryState.mdo" name="deliveryForm">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th class="text-center">송장번호</th>
									<th class="text-center">주문번호</th>
									<th class="text-center">주문상품명</th>
									<th class="text-center">회원ID</th>
									<th class="text-center">수령인</th>
									<th class="text-center">주소</th>
									<th class="text-center">연락처1/연락처2</th>
									<th class="text-center">배송메모</th>
									<th class="text-center">주문날짜</th>
									<th class="text-center">배송상태</th>
									<th class="text-center">배송상태 수정</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="del" items="${deliveryList}">
									<tr>
										<td class="text-center">${del.delivery_seq}</td>
										<td class="text-center">${del.order_seq}</td>
										<td class="text-center">${del.prod_title}</td>
										<td class="text-center">${del.user_id}</td>
										<td class="text-center">${del.receiver_name}</td>
										<td class="text-center">${del.receiver_zipcode} ${del.receiver_address1} ${del.receiver_address2}</td>
										<td class="text-center">${del.receiver_phone1} / ${del.receiver_phone2}</td>
										<td class="text-center">${del.receiver_memo}</td>
										<td class="text-center"><fmt:formatDate value="${del.order_date}" pattern="yyyy-MM-dd" /></td>
										<td class="text-center">${del.delivery_state}</td>
										<td>
											<select name="delivery_state">
												<option selected="selected" value="before">배송전</option>
												<option value="ing">배송중</option>
												<option value="after">배송완료</option>
												<option value="cancel">주문취소</option>
											</select>
											<input type="hidden" name="delivery_seq" value="${del.delivery_seq}">
											<a href="#" class="changeState">상태변경</a>
										</td>										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					<!-- pagination -->
							<div id="paginationBox">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
									</c:if>

									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="idx">
										<li
											class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
											class="page-link" href="#"
											onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
												${idx} </a></li>
									</c:forEach>

									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
									</c:if>
								</ul>
							</div>
							<!-- search{s} -->
							<div class="searchText">
								<div class="w100" style="padding-right: 10px">
									<select class="form-control form-control-sm" name="searchType" id="searchType">
										<option value="user_id">회원 아이디</option>
									</select>

								</div>
								<div class="w300" style="padding-right: 10px">
									<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
								</div>

								<div>
									<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
								</div>

							</div>
							<!-- search{e} -->
					</div>
				</div>
			</form>
		</div>
	</div>
</main>

<%@include file="/WEB-INF/views/admin/page/include/admin_footer.jsp"%>
