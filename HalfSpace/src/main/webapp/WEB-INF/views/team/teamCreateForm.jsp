<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/comment/modal.css">
<!DOCTYPE html>
<html>
<style>
	.container { width: 400px;
	  			margin-top: 35px; }
</style>
<head>
<meta charset="UTF-8">
<title>Team Create Form</title>
</head>
<body>
<div class="container">	
	 <form action="/team/teamCreate" method="post">
     팀 명 : <input class="form-control" type="text" name="name" placeholder="팀명을 입력해주세요." required><br/>
     감독(유저명) : <input class="form-control" type="text" name="coach" placeholder="user_tbl에 존재하는 user를 넣어주세요" required><br/>
     간단한 팀 소개글 : <input class="form-control" type="text" name="intro" placeholder="팀을 간단하게 소개해주세요." required><br/>
     <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
     <button type="submit" class="btn btn-success" >글 작성하기</button>
     </form>
    </div>

</body>
</html>