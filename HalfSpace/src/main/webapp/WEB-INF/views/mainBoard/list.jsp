<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/mainboard/list.css">
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>boardList</title>
<style>

	body {
	    -webkit-text-size-adjust: 100%;
	    -webkit-tap-highlight-color: transparent;
	    --animate-duration: 1s;
	    --animate-delay: 1s;
	    --animate-repeat: 1;
	    --blue: #007bff;
	    --indigo: #6610f2;
	    --purple: #6f42c1;
	    --pink: #e83e8c;
	    --red: #dc3545;
	    --orange: #fd7e14;
	    --yellow: #ffc107;
	    --green: #28a745;
	    --teal: #20c997;
	    --cyan: #17a2b8;
	    --white: #fff;
	    --gray: #6c757d;
	    --gray-dark: #343a40;
	    --primary: #007bff;
	    --secondary: #6c757d;
	    --success: #28a745;
	    --info: #17a2b8;
	    --warning: #ffc107;
	    --danger: #dc3545;
	    --light: #f8f9fa;
	    --dark: #343a40;
	    --breakpoint-xs: 0;
	    --breakpoint-sm: 576px;
	    --breakpoint-md: 768px;
	    --breakpoint-lg: 992px;
	    --breakpoint-xl: 1200px;
	    --font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
	    --font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
	    box-sizing: border-box;
	    margin: 0;
	    font-weight: 400;
	    line-height: 1.5;
	    text-align: left;
	    color: #1a1a1a;
	    font-size: 14px;
	    -webkit-font-smoothing: antialiased;
	    font-family: 'Poppins', sans-serif;
	    background: white;
	    height: 100%;
	    
	}

	.navi-container {
	    text-align: left;
	    color: #1a1a1a;
	    font-size: 14px;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    font-family: "sbaggro","nucleo-icons";
	    font-weight: lighter;
	    margin: 0;
	    padding-top: 1rem;
	}
	
	.menu-container {
	    text-align: left;
	    color: #1a1a1a;
	    font-size: 14px;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    margin: 0;
	    font-family: "sbaggro","nucleo-icons";
	    font-weight: lighter;
	    padding-top: 1rem;
	    border-bottom: 1px solid #ddd;
	}
	
	.navi-content {
	    text-align: left;
	    color: #1a1a1a;
	    font-size: 16px;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    font-family: "sbaggro","nucleo-icons";
	    font-weight: lighter;
	    display: flex;
	    justify-content: space-around;
	    max-width: 800px;
	    margin: auto;
	}
	
	.footer {
	    text-align: left;
	    color: #1a1a1a;
	    font-size: 14px;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    display: block;
	    font-family: "sbaggro","nucleo-icons";
	    font-weight: lighter;
	    margin: 0;
	    background-color: #1a1a1a;
	}
	
	.footer {
	    text-align: left;
	    color: #1a1a1a;
	    font-size: 14px;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    display: block;
	    font-family: "sbaggro","nucleo-icons";
	    font-weight: lighter;
	    margin: 0;
	    background-color: #1a1a1a;
	    bottom: 0;
	}
	
	.footer-container {
	    color: #1a1a1a;
	    font-size: 14px;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    font-family: "sbaggro","nucleo-icons";
	    font-weight: lighter;
	    max-width: 600px;
	    margin: auto;
	    text-align: center;
	    padding: 70px 0;
	}
	
	.mt-3 {
	    -webkit-font-smoothing: antialiased;
	    text-align: center;
	    box-sizing: border-box;
	    margin-top: 1rem!important;
	    margin: 0;
	    color: #9a9a9a;
	    font-weight: 300;
	    font-family: "sbaggro";
	    font-size: 12px;
	}
	
	.copyright {
	    -webkit-font-smoothing: antialiased;
	    text-align: center;
	    box-sizing: border-box;
	    margin: 0;
	    color: #9a9a9a;
	    font-weight: 300;
	    font-family: "sbaggro";
	    font-size: 12px;
	    padding: 20px 0;
	}
	
</style>
</head>
<body>
	<div class="header">
<<<<<<< HEAD
		<nav class="navbar">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/mainBoard/welcomeHome"><img src="../resources/images/halfspacelogo.png" alt="" width="334" height="110" class="d-inline-block align-text-top">
		    </a>
		     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		      <ul class="navbar-nav">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="/mainBoard/welcomeHome">Home</a>
		        </li>
		      </ul>
		    </div>
		    <form class="d-flex">
		      <!--  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">-->
		      <button class="btn btn-outline-success"><a href="/login/join">회원가입</a></button>
		    </form>
		  </div>
		</nav>
	</div><!-- .header -->
	<hr/>
=======
		<div class="navi-container">
			<div class="d-flex justify-content-between align-items-center mx-auto p-0" style="max-width:800px">
				<a href="/mainBoard/welcomeHome">
					<img class="ml-3" src="../resources/images/halfspacelogo.png" width="70">
				</a>
				<div class="user-info-container">
					<input id="isLoggedIn" type="hidden" data-islogin="false">
					<div class="user-info-wrap">
						<a class="text-main btn-sm btn-neutral" href="/users/join">
							<strong>회원가입</strong>
						</a>
						<a class="text-main btn-sm rounded-pill border" href="/users/login">
							<strong>로그인</strong>
						</a>
						<a class="px-3" id="sidebarCollapse" href="#">
							<img src="../resources/images/threedots.png" max-width="300px" height="10px">
						</a>
					</div>
				</div>
			</div>
			<div class="menu-container">
				<div class="navi-content">
					<a class="active" href="/mainBoard/list">소셜매치</a>
					<a href="/post/list">자유게시판</a>
					<a href="/weather/today">날씨</a>
					<a href="#">QnA</a>
				</div>
			</div>
		</div>
	</div>
>>>>>>> sage
	<div class="container">
		<div class="row">
			<h1>
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
			매칭 글 목록</h1>
			 <table class="table table-hover" style="color: #48734A">
				<thead>
					<tr> 
						<th>글번호</th>
						<th>글제목</th>
						<th>글쓴이</th>
						<th>카테고리</th>
						<th>경기 날짜</th>
						<th>경기 장소</th>
						<th>쓴 날짜</th>
						<th>수정 날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="board" items="${boardList }">
							<tr>
							<td>${board.bno }</td>
							<td><a href="/mainBoard/detail?bno=${board.bno}&page=${pageMaker.cri.page}
							      &searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${board.title }[${board.replycount }]</a></td>
							<td>${board.writer }</td>
							<td>${board.catego }</td>
							<td>${board.gamedate }</td>
							<td>${board.gameplace }</td>
							<td>${board.regdate }</td>
							<td>${board.updatedate }</td>
							</tr>						
						</c:forEach>
					</tr>
				</tbody>
			</table>
			<a class="btn" href="/mainBoard/insert" id="btn-filed">글 쓰기</a>
			<ul class="pagination my justify-content-center">
				<!-- Prev -->
				<c:if test="${pageMaker.prev }">
					<li class="page-item">
						<a class="page-link" href="/mainBoard/list?page=${pageMaker.startPage - 1 }
						&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}" aria-lable="Prev">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }"
						var="pNum">
					<li class="page-item 
						<c:out value="${pageMaker.cri.page == pNum ? 'active' : '' }"/>">
						<a class="page-link"
							href="/mainBoard/list?page=${pNum }&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
							${pNum }
						</a>
					</li>	
				</c:forEach>
				<!-- Next -->
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item">
						<a class="page-link"
							href="/mainBoard/list?page=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
							&raquo;	
						</a>
					</li>
				</c:if>
			</ul>
		</div><!-- .row 끝나는 지점 -->
		<div class="row">
			<div class="box-body" style="text-align: center">
				<select name="searchType" class="selectpicker">
				<option value="n"
					<c:out value="${pageMaker.cri.searchType == 'n' ? 'selected' : '' }"/>>
						-
					</option>
					<option value="t"
					<c:out value="${pageMaker.cri.searchType == 't' ? 'selected' : '' }"/>>
						제목
					</option>
					<option value="c"
					<c:out value="${pageMaker.cri.searchType == 'c' ? 'selected' : '' }"/>>
						본문내용
					</option>
					<option value="w"
					<c:out value="${pageMaker.cri.searchType == 'w' ? 'selected' : '' }"/>>
						글쓴이
					</option>
					<option value="tc"
					<c:out value="${pageMaker.cri.searchType == 'tc' ? 'selected' : '' }"/>>
						제목+본문내용
					</option>
					<option value="cw"
					<c:out value="${pageMaker.cri.searchType == 'cw' ? 'selected' : '' }"/>>
						글쓴이+본문내용
					</option>
					<option value="tcw"
					<c:out value="${pageMaker.cri.searchType == 'tcw' ? 'selected' : '' }"/>>
						모든내용
					</option>
				</select>
				<input type="text" name="keyword" id="keywordInput" 
					value="${pageMaker.cri.keyword }">
				<button class="btn" id="searchBtn">Search</button>
			</div><!-- .box-body  -->
		</div><!-- .row  -->
	</div><!-- .container  -->
	<footer class="footer">
		<div class="footer-container">
			<a class="my-3" href="/">
				<img src="../resources/images/halfspacelogo.png" width="80">
			</a>
			<p class="mt-3">사람들과 함께하는 공간</p>
			<div class="copyright">
				<p class="mb-3">Spring Project A조</p>
				서울특별시 마포구 백범로 23 3층<br/>
				임병영<br/>
				김동완<br/>
				신동호
				<p class="mb-4">대표 전화번호 010-9966-8908</p>
				<p>COPYRIGHT HalfSpace C&C ALL RIGHT RESERVED</p>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
	    // 검색버튼 작동
		$('#searchBtn').on("click", function(event){
			
			self.location = "list"
				+ "?page=1"
				+ "&searchType="
				+ $('select option:selected').val()
				+ "&keyword=" + $('#keywordInput').val();
		});
	    
	  
	    
	</script>
</body>
</html>
