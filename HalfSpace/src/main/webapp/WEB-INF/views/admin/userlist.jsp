<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" type="text/css" href="/resources/mainboard/list.css">
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<head>
</head>
<body>

	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />
	
	
	<div>
			 <table class="table table-hover" style="color: #48734A">
				<thead>
					<tr> 
						<th>userId</th>
						<th>userName</th>
						<th>gender</th>
						<th>birthdate</th>
						<th>email</th>
						<th>phoneNum</th>
						<th>address</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="user" items="${userList}">
							<tr>
							<td><a href="/admin/userdetail?userId=${user.userId }&page=${pageMaker.cri.page}
							      &searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${user.userId}</a></td>
							<td>${user.userName}</td>
							<td>${user.gender}</td>
							<td>${user.birthdate}</td>
							<td>${user.email}</td>
							<td>${user.phoneNum}</td>
							<td>${user.address}</td>
							</tr>						
						</c:forEach>
					</tr>
				</tbody>
			</table>
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
							href="/admin/userlist?page=${pNum }&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
							${pNum }
						</a>
					</li>	
				</c:forEach>
				<!-- Next -->
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item">
						<a class="page-link"
							href="/admin/userlist?page=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
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


	<jsp:include page="../footer.jsp" flush="true" /> 


			<hr/>
	
	<script type="text/javascript">

	</script>
		<!-- sidebar 기능-->
	<script src="/resources/basic/sideBar.js"></script>

</body>
</html>