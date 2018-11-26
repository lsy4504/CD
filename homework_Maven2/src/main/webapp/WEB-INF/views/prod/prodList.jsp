<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:useBean id="pagingVO" class="kr.or.ddit.vo.PagingInfoVO" scope="request"></jsp:useBean>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">	
  <script src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function <%=pagingVO.getFuncName()%>(page) {
		document.searchForm.page.value=page;
		document.searchForm.submit();
	}
  
  	$(function() {
  		var prod_lguTag=$("[name='prod_lgu']");
  		var prod_buyerTag=$("[name='prod_buyer']");
		prod_lguTag.val("${pagingVO.searchVO.prod_lgu}");
		prod_buyerTag.val("${pagingVO.searchVO.prod_buyer}");
  		
		$("[name='prod_lgu']").on("change",function(){
			var lprod_gu =$(this).val()
			var buyerOptions = $("[name='prod_buyer']").find("option");
			$(buyerOptions).hide();
			if(lprod_gu){
			var buyerOptions2=$("[name='prod_buyer']").find("option."+lprod_gu);
			$(buyerOptions2).show();
			}else{
			$(buyerOptions).show();
			}
				
		});
		$("#listBody").on("click","tr",function(){
			var prod_id=$(this).find("td:first").text();
			location.href="<%=request.getContextPath()%>/prod/prodView.do?what="+prod_id;
			
		});
	});
  
  </script>
<title>Insert title here</title>
</head>
<body>
<% 
	List<ProdVO> prodList= pagingVO.getDataList();
	Map<String,String> lprodList= (Map<String,String>)request.getAttribute("lprodList");
	List<BuyerVO> buyerList=(List<BuyerVO>)request.getAttribute("buyerList");
%>
<!-- 	스크린사이즈 7 -->
<!-- 	블럭사이즈 4  -->
	<div class="container">
	<form name='searchForm'>
	<input type="hidden" name="page"/>
	<select name="prod_lgu">
		<option value=""> 분류선택</option>
		<% 
			for(Entry<String,String> e:lprodList.entrySet()){
				%>
				<option value="<%=e.getKey() %>"><%= e.getValue() %></option>
				
				<% 
			}
		%>
	
	</select>
	<select name="prod_buyer">
		<option value=""> 거래처 선택</option>
		<% 
			for(BuyerVO buyer:buyerList){
		%>
				<option value="<%=buyer.getBuyer_id() %>" class="<%= buyer.getBuyer_lgu() %>"><%=buyer.getBuyer_name()%></option>
		<%		
		
			}
		
		%>
		
	</select>
	<input type="text" name="prod_name" value="${pagingVO.searchVO.prod_name }">
	<input type="submit" value="검색">
		
	</form>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>분류명</th>
				<th>거래처명</th>
				<th>판매가</th>
				<th>상품개요</th>
				<th>마일리지</th>
			</tr>
		</thead>
		<tbody id="listBody">
			<% 
			if(prodList.size()>0){
				for(ProdVO prod:prodList){
			%>
				<tr >
					<td><%=prod.getProd_id() %></td>	
					<td><%=prod.getProd_name() %></td>	
					<td><%=prod.getLprod_nm() %></td>	
					<td><%=prod.getBuyer_name() %></td>	
					<td><%=prod.getProd_price() %></td>	
					<td><%=prod.getProd_outline() %></td>	
					<td><%=prod.getProd_mileage() %></td>
				</tr>	
			<%	
				}
				}else{
					out.print("노상품.");
				}
			%>
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7">
		 			<nav aria-label="Page navigation example">
 						<%= pagingVO.getPagingHTML() %>
					</nav>
				</td>
			</tr>
		</tfoot>
		
	</table>
	</div>
	
</body>
</html>