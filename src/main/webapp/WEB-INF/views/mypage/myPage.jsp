<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>마이페이지 메인</title>

<%@include file="/WEB-INF/views/include/header.jsp"%>
<link href="resources/css/menu.css" rel="stylesheet" type="text/css">

<script type="text/javascript"> //회원탈퇴 js
function userexit(){
    
            if (confirm('정말로 회원탈퇴를 하시겠습니까 ? \n탈퇴 후 동일 아이디로 재가입이 불가합니다.')) {
            	$("#deleteSuccess").submit();
            	console.log("yes");
            	}
            else{
            	
            	console.log("no");
            }
        
}
</script>


<div id="contentWrapper">
	<div id="contentWrap">
		<div id="aside">
			<h2 class="aside-tit">마이페이지</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">쇼핑정보</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="#">주문내역</a></li>
							<li><a href="#">쿠폰내역</a></li>
							<li><a href="#">적립금내역</a></li>
							<li><a href="#">오늘본상품</a></li>
							<li><a href="GoCart.do">상품 보관함</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">쇼핑문의</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="myinquryList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내 문의사항 보기</a></li>
							<li><a href="myReviewList.do?user_email=${userVO.user_email}&user_seq=${userVO.user_seq}">내 후기 보기</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">개인정보</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a
								href="memberInfoUpdate.do">회원정보변경</a></li>
							<li><form action="memberInfoDelete.do" id = "deleteSuccess" method="POST">
							<input type="hidden" name ="user_id" value="${userVO.user_id }">
							<a href="javascript:userexit();" >회원정보탈퇴신청</a></form></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
		<hr>
		<div id="content">
			<div id="mypage">
				<div class="page-body">
					<!-- 회원 정보 -->
					<div class="info">
						<div class="user">
							<div class="user-img"></div>
							<div class="user-info">
								<p>
									<!-- 이런식으로 나와야 한다. 최형우[hyeognwoo26]님  -->
									
									<label>${userVO.user_name }[${userVO.user_id}]님</label>
									<a href="memberInfoUpdate.do" class="CSSbuttonWhite CSSbuttonMin">수정</a>
									
								</p>
								<div class="box">
									<dl>
										<dt>전 &nbsp;&nbsp;&nbsp; 화</dt>
										<dd>${userVO.user_phone }</dd>
									</dl>
									<dl>
										<!-- 이메일 --> 
										<dt>이 메 일</dt>
										<dd>${userVO.user_email }</dd>
									</dl>
									<dl>
										<dt>주 &nbsp;&nbsp;&nbsp; 소</dt>
										<dd>${userVO.user_zipcode } ${userVO.user_address1 } ${userVO.user_address2 }</dd>
									</dl>
								</div>
							</div>
						</div>
						<dl class="order">
							<dt class="tot">총 주문금액 :</dt>
							<dd class="tot">
								<strong>0</strong>원
							</dd>
							<dt>적 립 금</dt>
							<dd>
								<a href="#"><strong>0</strong>원</a>
							</dd>
							<dt>쿠 &nbsp;&nbsp;&nbsp; 폰</dt>
							<dd>
								<a href="#"><strong>0</strong>개</a>
							</dd>
						</dl>
					</div>
					<!-- //회원 정보 -->

					<!-- 회원 그룹 정보 -->
					<!-- //회원 그룹 정보 -->

					<!-- 최근 주문 정보 -->
					<div class="hd">
						<h3>최근 주문 정보</h3>
						<a class="view fe" href="#">+
							더보기</a>
					</div>
					<div class="tbl">
						<table summary="주문일자, 상품명, 결제금액, 주문상세">
							<caption>최근 주문 정보 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="140">
								<col width="140">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">날짜</div></th>
									<th><div class="tb-center">제품</div></th>
									<th><div class="tb-center">금액</div></th>
									<th><div class="tb-center">상세</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><div class="tb-center">주문 내역이 없습니다.</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //최근 주문 정보 -->

					<!-- 최근 등록 게시글 -->
					<div class="hd">
						<h3>최근 등록 게시글</h3>
						<a class="view fe" href="#">+더보기</a>
					</div>
					<div class="tbl">
						<table summary="등록일자, 제목, 게시판">
							<caption>최근 등록 게시물 목록</caption>
							<colgroup>
								<col width="150">
								<col width="*">
								<col width="200">
							</colgroup>
							<thead>
								<tr>
									<th><div class="tb-center">날짜</div></th>
									<th><div class="tb-center">게시글</div></th>
									<th><div class="tb-center">위치</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3"><div class="tb-center">작성된 게시글이 없습니다.</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //최근 등록 게시글 -->
				</div>
				<!-- .page-body -->
			</div>
			<!-- #mypage -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>