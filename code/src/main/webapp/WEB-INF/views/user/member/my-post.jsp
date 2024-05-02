<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
</head>
<style>

   #fakecontainer {

        table {
            border-collapse: collapse;
            border-spacing: 0;
          }
          section.notice {
            padding: 80px 0;
          }
          
          .page-title {
            margin-bottom: 60px;
          }
          .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
          }
          
          #board-search .search-window {
            padding: 15px 0;
            background-color: #f9f7f9;
          }
          #board-search .search-window .search-wrap {
            position: relative;
          /*   padding-right: 124px; */
            margin: 0 auto;
            width: 80%;
            max-width: 564px;
          }
          #board-search .search-window .search-wrap input {
            height: 40px;
            width: 100%;
            font-size: 14px;
            padding: 7px 14px;
            border: 1px solid #ccc;
          }
          #board-search .search-window .search-wrap input:focus {
            border-color: #333;
            outline: 0;
            border-width: 1px;
          }
          #board-search .search-window .search-wrap .btn {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            width: 108px;
            padding: 0;
            font-size: 16px;
          }
          .board-list {
            position: relative;
          }

          

          .board-table {
            font-size: 13px;
            width: 90%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            
          }
          
          .board-table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
          }
          .board-table a:hover {
            text-decoration: underline;
          }
          .board-table th {
            text-align: center;
          }
          
          .board-table .th-num {
            width: 100px;
            text-align: center;
          }
          
          .board-table .th-date {
            width: 200px;
          }
          
          .board-table th, .board-table td {
            padding: 14px 0;
          }
          
          .board-table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
          }
          
          .board-table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
          }
          
          .board-table tbody th p{
            display: none;
          }
          
          .btn {
            display: inline-block;
            padding: 0 30px;
            font-size: 15px;
            font-weight: 400;
            background: transparent;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            text-transform: uppercase;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            -ms-transition: all 0.3s;
            -o-transition: all 0.3s;
            transition: all 0.3s;
          }
          
          .btn-dark {
            background: #555;
            color: #fff;
          }
          
          .btn-dark:hover, .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
          }
          
          .btn-dark {
            background: #555;
            color: #fff;
          }
          
          .btn-dark:hover, .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
          }
          
          /* reset */
          
          * {
            list-style: none;
            text-decoration: none;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
          }
          .clearfix:after {
            content: '';
            display: block;
            clear: both;
          }
          .container {
            width: 1100px;
            margin: 0 auto;
          }
          .blind {
            position: absolute;
            overflow: hidden;
            clip: rect(0 0 0 0);
            margin: -1px;
            width: 1px;
            height: 1px;
          }
          
          .search-wrap {
            display: flex;
            align-items: center;
        }
        
        .search-wrap select {
            height: 40px;
            width: 100px;
            font-size: 14px;
            padding: 7px 14px;
            border: 1px solid #ccc;
            margin-right: 10px;
        }
        .write-btn {
            float: right;
            margin-top: 20px;
        }

        .board-table .lock-icon {
            color: #555;
        }
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
        <%@include file="/WEB-INF/views/inc/mypage-sidebar.jsp"%>
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
        
        	<div id="fakecontent">
            <section class="notice">
            <!-- board list area -->
            <div id="board-list">
                <div class="container">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-writer">작성자</th>
                            <th scope="col" class="th-date">등록일</th>
                            <th scope="col" class="th-view">조회수</th>
                            <th scope="col" class="th-like">추천</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>
                              <a href="#!">거니더마마사지</a>
                            </th>
                            <td>ㅇㅇ</td>
                            <td>04:20</td>
                            <td>2</td>
                            <td>0</td>
                        </tr>
                        
                        <tr>
                            <th><a href="#!">ㅇㅇㅇ</a></th>
                            <td>ㅇㅇㅇ</td>
                            <td>2024.04.11</td>
                            <td>2222</td>
                            <td>30</td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
              </section>
        </div>
      

        <!-- fakecontent 끝 -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        
    </div>
    </div>

    <!-- JavaScript Libraries -->
   
    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/asset/css/temp/js/main.js"></script>
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
    
    <!-- Code injected by live-server -->
<script>
	// <![CDATA[  <-- For SVG support
	if ('WebSocket' in window) {
		(function () {
			function refreshCSS() {
				var sheets = [].slice.call(document.getElementsByTagName("link"));
				var head = document.getElementsByTagName("head")[0];
				for (var i = 0; i < sheets.length; ++i) {
					var elem = sheets[i];
					var parent = elem.parentElement || head;
					parent.removeChild(elem);
					var rel = elem.rel;
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
					}
					parent.appendChild(elem);
				}
			}
			var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
			var address = protocol + window.location.host + window.location.pathname + '/ws';
			var socket = new WebSocket(address);
			socket.onmessage = function (msg) {
				if (msg.data == 'reload') window.location.reload();
				else if (msg.data == 'refreshcss') refreshCSS();
			};
			if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
				console.log('Live reload enabled.');
				sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
			}
		})();
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}
	// ]]>
</script>
</body>

</html>
