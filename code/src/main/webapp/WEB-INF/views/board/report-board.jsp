
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<!-- <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css"> -->
    <meta charset="utf-8">
    <title>건의게시판</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
</head>
<style>
	
   	#pagebar{
    display: flex;
    justify-content: center;
    align-items: center;
	}
    
    <%@include file="/WEB-INF/views/inc/asset.jsp"%>
      
</style>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <!-- 사이드바  -->
        <%@include file="/WEB-INF/views/inc/board-sidebar.jsp"%>
        <!-- 사이드바 끝  -->
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            
            <!-- Navbar Start -->
            <!-- 상당 메뉴 -->
            <%@include file="/WEB-INF/views/inc/header.jsp"%>
            <!-- 상당 메뉴 끝-->
            <!-- Navbar End -->
        <!-- Content End -->
        <!-- fakecontent 안에서 작성 -->
      	<section class="reportboard">
        <div class="page-title">
              <div class="container">
                  <h3>건의 게시판</h3>
              </div>
          </div>
      
	    <!-- board seach area -->
	    <div id="board-search">
	      <div class="container">
	        <div class="search-window">
	          <form id="formSearch" method="GET" action="/account/board/freeBoard.do">
                <div class="search-wrap">
                  <select name="column">
                    <option value="total">제목+내용</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                  </select>
                  <label for="search" class="blind">게시판 검색</label>
                  <input id="search" type="search" name="word" placeholder="검색어를 입력해주세요." value="">
                  <button type="submit" class="btn btn-dark">검색</button>
                </div>
              </form>
	        </div>
	      </div>
	    </div>
	    
	    <!-- board list area -->
	    <div id="board-list">
	        <div class="container">
	            <table class="board-table">
	                <thead>
	                <tr>
	                    <th scope="col" class="th-num">번호</th>
	                    <th scope="col" class="th-title">제목</th>
	                    <th scope="col" class="th-writer">작성자</th>
	                    <th scope="col" class="th-date">등록일</th>
	                    <th scope="col" class="th-view">조회수</th>
	                    <th scope="col" class="th-like">추천</th>
	                    <th scope="col" class="th-like">비밀글</th>
	                </tr>
	                </thead>
	                <tbody>
	                <c:if test="${reportList.size() == 0}">
					    <tr>
					        <td>게시물이 없습니다.</td>
					    </tr>
					</c:if>
	                <c:forEach items="${reportList}" var="report">
			                <tr>
			                    <td>${report.seq}</td>
						        <td>
						            <c:choose>
						                <c:when test="${report.blindCheck eq '1'}">
						                    관리자에 의해 블라인드 처리 되었습니다.
						                </c:when>
						                <c:otherwise>
						                	<a href="/account/board/discussion.do?seq=${report.seq}">${report.title}</a>					                    
						                </c:otherwise>
						            </c:choose>
						        </td>
						        <td>${report.me_nickName != null ? report.me_nickName : report.ad_nickName}</td>
						        <td>${report.writeDate}</td>
						        <td>${report.viewCount}</td>
						        <td>${report.likeCount}</td>
						        <td id="secret">
						            <c:choose>
						                <c:when test="${report.secretCheck eq '1'}">
						                	<div class="fas fa-lock lock-icon"></div>
						                </c:when>
						                <c:otherwise>
						                    <div class="fas fa-unlock unlock-icon"></div>
						                </c:otherwise>
						            </c:choose>
						        </td>
						      
			                </tr>
	                </c:forEach>
	                </tbody>
	            </table>
	            <!-- 페이지바 -->
				<div id="pagebar">${pagebar}</div>
	            <div class="write-btn">
	                <a href="/account/board/write.do" class="btn btn-dark">글작성</a>
	            </div>
	        </div>
	        
	    </div>
		</section>

        <!-- fakecontent 끝 -->
        <!-- Back to Top -->
        
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    	</div>
    </div>

    <!-- JavaScript Libraries -->
   
    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/asset/css/temp/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>

    document.addEventListener('DOMContentLoaded', function() {
    const sidebarToggler = document.getElementById('sidebar-toggler');
    const sidebar = document.querySelector('.sidebar');
    const content = document.querySelector('.content');

        sidebarToggler.addEventListener('click', function() {
        sidebar.classList.toggle('hidden');
        content.classList.toggle('expanded');
        });
    });

    </script>
</body>

</html>

