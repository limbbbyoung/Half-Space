<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	.container { width: 400px;
	  			margin-top: 35px; }
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">	
		 <form action="/mainBoard/insert" method="post">
		     글제목 : <input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요." required><br/>
		     작성자 : <input class="form-control" type="text" name="writer" placeholder="작성자" required><br/>
		     카테고리 : <input class="form-control" type="text" name="catego" placeholder="카테고리" required><br/>
		     경기 장소 : <input class="form-control" type="text" name="gameplace" placeholder="경기 장소" required><br/>
		     경기 날짜 : <input class="form-control" type="date" name="gamedate" required><br/>
		     <p>글내용 : </p> <textarea class="form-control" cols="50" rows="12" name="content" required></textarea><br/>
		    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
		     <button type="submit" class="btn btn-success" >글 작성하기</button>
	     </form>
    </div>
    
    <div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<div class="uploadResult">
		<ul>
			<!-- 업로드된 파일들이 여기 나열됨. -->
		</ul>
	</div>
	
	
	<button id="uploadBtn">Upload</button>
</body>
</html>