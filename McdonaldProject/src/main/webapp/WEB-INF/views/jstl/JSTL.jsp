<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만드셨나용?</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<h1>JSTL이란...?</h1>
	
	<p>
		JSP Standard Tag Library JSP에서 사용할 수 있는 커스텀 액션 태그 <br>
		공통적으로 사용해야하는 코드들을 보다 쉽게 사용할 수 있도록
		태그화해서 표준으로 제공하는 라이브러리
		
	</p>
	
	<hr>
	
	<p>
		JSTL을 사용하기 위해선 먼저 라이브러리를 추가해준 후 <br>
		JSTL을 사용하고자 하는 JSP페이지 상단에 선언을 해주어야함!! <br>
	</p>
	
	
	<% if(true){ %>	
		ABCDE
	<%	} %>
	
	<h2>Core 라이브러리 실전압축핵심요약 빠르게 배우고 넘어가기</h2>
	
	
	<p>
		if라는 태그를 작성하여 조건문을 만들어 낼 수 있음 
		- Java에서의 단일 if문과 똑같은 역할을 할 수 있는 태그 <br>
		- 조건식은 test라는 속성에 작성
		(제발 부탁드립니다.. 조건식을 만들때 반드시 EL 구문으로 작성해주세요)
		
	</p>
	<br>
	
	<c:if test="${ 1 lt 2 }">
	<strong> 1이 2보다 작습니다. </strong>
	</c:if>
	
	<c:if test="${ 1 gt 2 }">
		<strong>1이 2보다 큽니다.</strong>
	</c:if>
	
	<c:if test="${ '안녕하세요' ne '반갑습니다' }">
		<mark>안녕하세요와 반갑습니다는 같지 않습니다.</mark>
	</c:if>
	
	<hr>
	
	<h3>2) choose, when, otherwise</h3>
	
	<!-- point라는 키값으로 value가 넘어옴 -->
	
	<!--
		포인트 사용량이 100이하라면 일반회원이라고 출력해주고 싶음
		포인트 사용량이 300이하라면 우수회원이라고 출력해주고 싶음
		앞의 두 케이스에 걸리지 않을 시 최우수회원이라고 출력해주고 싶음
	-->
	
	choose에는 when 아니면 otherwise만 넣을 수 있음
	
	<c:choose>
		<c:when test="${ point le 100 }">
			일반회원 <br>
		</c:when>
		<c:when test="${ point le 300 }">
			<label style ="color: gold;">우수회원</label>
		</c:when>
		<c:otherwise>
			<mark style="color: white; background-color: black;">최우수회원</mark>
		</c:otherwise>
	</c:choose>
	
	<h3>3) 반복문 - forEach </h3>
	
	<pre>
		자바스크립트에서 주로 쓰는 반복문 : 
		
		for(let i = 0; i < 10; i++) {};
		
		for(let i in list) {};
		
		for(let of list) {};
		
		머시기.map(e => {
		
		});

		머시기.filter(e => {
		
		});
		
		[ 표현법 ]
		for loop 문 
		&lt;c:forEach var="속성명" begin="초기값" end="끝값"
		step="증가시킬값"(생략가능) &gt; 
		&lt;c:forEach var="속성명" items="순차적으로 접근할 배열 또는 컬렉션" &gt;
		
		&lt;c:forEach var="속성명" items="순차적으로 접근할 배열 또는 컬렉션"&gt;
		&lt;c:/forEach&gt;
	</pre>
	
	<c:forEach var="i" begin="0" end="9">
		${ i }
	
	</c:forEach>

	<c:forEach var="i" begin="1" end="6">
    		${ i }
			<h${i}> 이런것도 가능</h${i}> 
    </c:forEach>
    
    <hr>
    
    <ul>
     	<c:forEach var="c" items="${ colors }">
    		<li style="color: ${c}">${ c }</li>
    	</c:forEach>
    </ul>
    
    <hr>
    
    <h3>회원목록</h3>
    <!-- 
    	caption,
    	thead, tbody, tfoot
    	tr
    	th, td 
     -->
    
    <table class="table table-hover"">
    	<thead>
    		<tr>
    			<th>번호</th>
    			<th>이름</th>
    			<th>아이디</th>
    			<th>가입일</th>
    		</tr>
    	</thead>
    	<tbody>
    		<!-- 조회결과가 있는지 없는지 확인 -->
    		<!-- 
    			조건식 만들때 필요한것
    			최소 한 개 이상의 값
    		 -->
    		<c:choose>
    			<c:when test="${ empty requestScope.users }">
    				
    				<tr>
    					<td colspan= "4"> 조회 결과가 존재하지 않습니다. </td>
    				</tr>
    				
    			</c:when>
    			<c:otherwise>
    				<c:forEach items="${ requestScope.users }" var="user">
    					<tr>	
    						<td>${ user.userNo }</td>
    						<td>${ user.userId }</td>
    						<td>${ user.userName }</td>
    						<td>${ user.enrollDate }</td>
    						
    					</tr>
    				</c:forEach>
    			</c:otherwise>
    		</c:choose>
    		
    	</tbody>
    	
    
    </table>
    
   
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>