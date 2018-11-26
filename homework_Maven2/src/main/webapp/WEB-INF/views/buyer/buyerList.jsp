<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pagingInfoVO" class="kr.or.ddit.vo.PagingInfoVO" scope="request"></jsp:useBean>
<% 
	List<BuyerVO> buyerList=pagingInfoVO.getDataList();
%>
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
<title>Insert title here</title>
</head>
<body>
	<h4>회원 목록</h4>
<input type="button" class="button" value="신규등록"
	onclick="location.href='<%=request.getContextPath()%>/buyer/buyerInsert.do'"
/>

	<div class="container">
	<table class="table">
		<thead class="thead-dark">
		<tr  >
			<th>판매자아디</th>
			<th>판매처</th>
			<th>주소</th>
			<th>전번</th>
			<th>은행</th>
			<th>계좌번호</th>
		</tr>
		 </thead>
		 <tbody>
		 <%
		 	String pattern = "<tr class='info'><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></td>";
		 	if(buyerList.size()!=0){
		 		for(BuyerVO buyer:buyerList){
		 			out.print(String.format(pattern, buyer.getBuyer_id(),"<a href='"+request.getContextPath()+"/buyer/buyerView.do?who="+buyer.getBuyer_id()+"'>"+ buyer.getBuyer_name()+"</a>",buyer.getAddress(),buyer.getBuyer_comtel(),buyer.getBuyer_bank(),buyer.getBuyer_bankno()));
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
 						<%= pagingInfoVO.getPagingHTML() %>
					</nav>
		 		</td>
		 	</tr>
		 </tfoot>
	</table> 
	</div>
</body>

</body>
</html>