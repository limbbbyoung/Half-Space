<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />
	

	${user}
	<br/>
	<sec:authentication property="principal.user.authList"/></p><hr/>
	<form action="/admin/update" method="post">
     유저명 : <input class="form-control" type="text" name="userId" value="${user.userId}" readonly><br/>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="auth" value="ROLE_USER" id="flexRadio1">
		  <label class="form-check-label" for="flexRadio1">
		    회원 권한
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="auth" value="ROLE_MANAGER" id="flexRadio2">
		  <label class="form-check-label" for="flexRadio2">
		    매니저 권한
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="auth" value="ROLE_ADMIN" id="flexRadio3">
		  <label class="form-check-label" for="flexRadio3">
		    관리자 권한
		  </label>
		</div>
	 <input type="hidden" name="page" value="${param.page}">
     
     <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
     <button type="submit" class="btn btn-success" >권한 수정 요청</button>
     </form>
     <br>

	<jsp:include page="../footer.jsp" flush="true" /> 

</body>
</html>