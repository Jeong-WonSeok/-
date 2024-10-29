<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/searchList.css" />
<div class="content-box">
	<div class="main-container" >
		<p class="title-31">${title}</p>
		<div class="top-container"><button class="button-medium" onclick="location.href='${pageContext.request.contextPath}/admin/joinForm'">+ 직원 추가하기</button></div>
		<div class="middle-container">
			<p>검색된 직원수: ${total}</p>
			<div class="search">
				<select class="form-select" id="search-menu" name="holiday-type">
					<option value="0" selected>이름</option>
					<option value="1">직급</option>
					<option value="2">부서</option>
				</select>
				<div class="searchBar">
					<input type="text" placeholder=" 검색" id="search"
						onkeyup="enterkeySearch()" autocomplete="off">
					<button type="button" class="btn">
						<img
							src="${pageContext.request.contextPath}/resources/image/search_icon.png"
							alt="검색 아이콘">
					</button>
				</div>
			</div>
		</div>
		<div class="bottom-container">
			<table class="tableContent">
				<thead>
					<tr>
						<td>이름</td>
						<td>직급</td>
						<td>입사일</td>
						<td>부서</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empDeptList}" var="empDept">
						<tr onclick="location.href = '${pageContext.request.contextPath}/admin/empDetail?empId=${empDept.empInfo.empId}'">
							<td>${empDept.empInfo.empName}</td>
							<td>${empDept.empInfo.position}</td>
							<td><fmt:formatDate value='${empDept.empInfo.empHiredate}' pattern='yyyy-MM-dd'/></td>
							<td>${empDept.deptName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav class="mt-5 mb-3">
               <ul class="pagination justify-content-center">
                 <li class="page-item disabled">
                   <a class="page-link text-dark" href="#" tabindex="-1" aria-disabled="true"><img class="arrow-left" src="${pageContext.request.contextPath}/resources/image/arrow/page-left-arrow.svg" width="10px"></a>
                 </li>
                 <li class="page-item"><a class="page-link text-dark page-border-none ms-3" href="#">1</a></li>
                 <li class="page-item"><a class="page-link text-dark page-border-none ms-1" href="#">2</a></li>
                 <li class="page-item"><a class="page-link text-dark page-border-none ms-1" href="#">3</a></li>
                 <li class="page-item"><a class="page-link text-dark page-border-none ms-1" href="#">4</a></li>
                 <li class="page-item"><a class="page-link text-dark page-border-none ms-1 me-3" href="#">5</a></li>
                 <li class="page-item">
                   <a class="page-link text-dark mb-4" href="#"><img class="arrow-right" src="${pageContext.request.contextPath}/resources/image/arrow/page-right-arrow.svg" width="10px"></a>
                 </li>
               </ul>
          	</nav>
		</div>
	
<script type="text/javascript">
	contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin/searchList.js"></script>
		
<%@ include file="/WEB-INF/views/common/footer.jsp"%>