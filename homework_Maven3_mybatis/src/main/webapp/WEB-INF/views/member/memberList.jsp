<%@page import="java.util.Objects"%>
<%@page import="kr.or.ddit.vo.PagingInfoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">	
  <script src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<% 
	PagingInfoVO pagingVO= (PagingInfoVO)request.getAttribute("pagingVO");
	List<MemberVO> memberList=pagingVO.getDataList();
%>
  <script type="text/javascript">
  function <%=pagingVO.getFuncName()%>(page) {
		document.searchForm.page.value=page;
		document.searchForm.submit();
	}
  	
  </script>
<%-- <jsp:useBean id="memberList" class="java.util.ArrayList"  scope="request"></jsp:useBean> --%>
<title>member/memberList.jsp</title>
</head>
<body>
	<h4>회원 목록</h4>
<input type="button" class="button" value="신규등록"
	onclick="location.href='<%=request.getContextPath()%>/member/memberInsert.do'"
/>

	<div class="container">
	<table class="table">
		<thead class="thead-dark">
		<tr  >
			<th>회원아이딬</th>
			<th>회원명</th>
			<th>주소</th>
			<th>휴대폰</th>
			<th>이메일</th>
			<th>마일리지</th>
		</tr>
		 </thead>
		 <tbody>
		 <%
		 	String pattern = "<tr class='info'><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%d</td></td>";
		 	if(memberList.size()!=0){
		 		for(MemberVO member:memberList){
		 			out.print(String.format(pattern, member.getMem_id(),"<a href='"+request.getContextPath()+"/member/memberView.do?who="+member.getMem_id()+"'>"+ member.getMem_name()+"</a>",member.getAddress(),member.getMem_hp(),member.getMem_mail(),member.getMem_mileage()));
		 		}
		 	}else{
		 		out.print("회원 목록 0");
		 	}
		 %>
		 </tbody>
		 <tfoot>
		 	<tr>
		 		<td colspan='6'>
		 			<nav aria-label="Page navigation example">
 						<%= pagingVO.getPagingHTML() %>
					</nav>
					<form name="searchForm">
					<input type="text" name="page"/>
					<select name="searchType">
						<option value="all">전체</option>
						<option value="name">이름</option>
						<option value="addr">지역</option>
					</select>
					<script type="text/javascript">
						document.searchForm.searchType.value = "<%=Objects.toString( pagingVO.getSearchType(), "all")%>";
					</script>
					<input type="text" name="searchWord" value="<%= Objects.toString(pagingVO.getSearchWord(),"")  %>">
					<input type="submit" value="검색">
					</form>
		 		</td>
		 	</tr>
		 </tfoot>
	</table> 
	</div>
</body>
</html>