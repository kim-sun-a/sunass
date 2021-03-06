<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>고객센터</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/customer_center_yj.css" />
		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<!--header css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index_header.css">
		<!-- fontawesome(글리피콘) 적용 -->
		<script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>
		
		<style type="text/css">
	       	ul, li {
	       		list-style: none;
	       		padding: 0;
	       		margin: 0;
	       		margin-bottom: 30px;
	       	}
	       	
	       	ul:last-child {
	       		margin-bottom: 0;
	       	}
	       	
	       	h4 {
	       		padding: 0;
	       	}
       </style>

		</head>
		
	<body>
		<div class="container"> <!-- 페이지 전체 영역 -->
		<div id="menu">
			<c:if test="${login != null }">
				<c:choose>
					<c:when test="${fn:contains(login.type, 'M')}">
						<%@ include file="../index_header_login_mom.jsp"%>
					</c:when>
					<c:when test="${fn:contains(login.type, 'S')}">
						<%@ include file="../index_header_login_sitter.jsp"%>
					</c:when>
				</c:choose>
			</c:if>
			<c:if test="${login == null }">
				<%@ include file="../index_header.jsp"%>
			</c:if>
			<%-- <h3>${login.type}, ${login.momno }</h3>
			<p>${login.sitterno }</p> --%>
		</div>
		<div class="section_wrap"> <!-- section 전체영역 -->
			<div class="col-xs-12"> 
			<div class="section_main"> <!-- Background-image -->
			<div class="section_input"> <!-- glyphicon -->
			<form action="${pageContext.request.contextPath}/customer/cus_search.do" role="search" class="search search-full" data-search
              data-instant="true" autocomplete="off" accept-charset="UTF-8" method="GET">
              	<input type="search" name="keyword" id="keyword" class="cus_search" value="${keyword}" placeholder="검색어를 입력하세요." aria-label="검색">
              	<button type="submit" class="cus_btn"><i class="fas fa-search"></i></button>
              </form>
		</div>
	</div>
	</div>
	</div> <!-- section 전체영역 끝 -->
		<div class="activity_wrap"> <!-- activity 전체영역 -->
			<section class="section_block">
				<div class="row">
					<div class="col-xs-12">
						<ul class="block_list">
							<li class="block_item">
								<a href="${pageContext.request.contextPath}/customer/faq.do" class="block_item_link">
									<span class="block_item_title">자주묻는 질문</span>
									<span class="block_item_title2">FAQ</span>
								</a>
							</li>
							<li class="block_item">
								<a href="${pageContext.request.contextPath}/customer/notice_site.do" class="block_item_link">
									<span class="block_item_title">공지사항</span>
								</a>
							</li>
							<li class="block_item">
								<a href="${pageContext.request.contextPath}/customer/question_mom.do" class="block_item_link">
									<span class="block_item_title">부모회원</span>
									<span class="block_item_title2">이용가이드</span>
								</a>
							</li>
							<li class="block_item">
								<a href="${pageContext.request.contextPath}/customer/question_sitter.do" class="block_item_link">
									<span class="block_item_title">시터회원</span>
									<span class="block_item_title2">이용가이드</span>
								</a>
							</li>
						</ul>
					</section>
					<section class="section_activity">
						<div class="row">
							<div class="col-xs-12">
								<div class="activity">
									<h2 class="activity_header">최근 활동</h2>
								</div>
							</div>
						</div>
						<div class="activity_list">
							<c:choose>
	                 			<c:when test="${output==null || fn:length(output) == 0}">
	                 				<p>조회결과가 없습니다.</p>
	                 			</c:when>
	                 			
	                 			<c:otherwise>
	                 				<c:forEach var="item" items="${output}" varStatus="status">
	                 					
	                 					<%-- 상세페이지 URL --%>
	                 					<c:url value="/customer/cus_view.do" var="viewUrl">
	                 						<c:param name="boardnum" value="${item.boardnum}"/>
	                 					</c:url>
	                 					<fmt:parseNumber var="i" type="number" value="${item.edit_date}" />
	                 					<c:if test="${item.edit_date < 15 }">
											<ul>
												<li>
													<h4>${item.sub_category}</h4> <br>	
													<a href="${viewUrl}">[${item.sub_category}] ${item.title}</a>
												</li>
											</ul>
											<hr>
	                 					</c:if> 
	                 					
	                 				</c:forEach>
	                 			</c:otherwise>
                 			</c:choose>
						</div>
					</section>
				</div>
				<div class="footer">
				</div>
			</div> <!-- 페이지 전체 영역 끝 -->
		<script type="text/javascript">
		$(function () {
			$("#mybutton").click(function(e) {
				$.ajax( {
					// 결과를 읽어올 URL
					url: '${pageContext.request.contextPath}/customer/hello.do',
					// 웹 프로그램에게 데이터를 전송하는 방식
					// 생략할 경우 get으로 자동 지정됨
					method: 'get',
					// 전달할 조건값은 JSON형식으로 구성
					// 사용하지 않을 경우 명시 자체를 생략할 수 있다.
					data: {},
					// 읽어올 내용의 형식(생략할 경우 json)
					dataType: 'html',
					// 읽어온 내용을 처리하기 위한 함수
					success: function(req) {
						// 준비된 요소에게 읽어온 내용을 출력한다.
						$("#mybutton").before(req);
					}
				}); // end $.ajax
			}) // end $.#mybutton
				//모달의 로그인 버튼 클릭시
				$("#login_btn").on("click", function () {
					location.replace('${pageContext.request.contextPath}/login/login.do');
				});

				//모달의 회원가입 버튼 클릭시
				$("#go_to_join").on("click", function () {
					location.replace('${pageContext.request.contextPath}/join/join.do');
				});
			});
			</script>
	</body>
</html>