<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="prod" class="kr.or.ddit.vo.ProdVO" scope="request"></jsp:useBean>
<jsp:useBean id="errors" class="java.util.HashMap" scope="request"></jsp:useBean>
	<table>
		<tr>
			<th>상품코드</th>
			<td><input type="text" name="prod_id"
				value="<%=prod.getProd_id()%>" /><span class="error"><%=errors.get("prod_id")%></span></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="prod_name"
				value="<%=prod.getProd_name()%>" /><span class="error"><%=errors.get("prod_name")%></span></td>
		</tr>
		<tr>
			<th>분류명</th>
			<td><%= prod.getLprod_nm() %></td>
		</tr>
		<tr>
			<th>거래처정보</th>
			<td>
				<table>
					<thead>
						<tr>
						<th>거래처명</th>
						<th>소재지</th>
						<th>담당자명</th>
						<th>연라처명</th>
						
						</tr>
					</thead>
					<tbody>
					<tr>
					<td><%= prod.getBuyer().getBuyer_name() %></td>
					<td><%= prod.getBuyer().getBuyer_add1() %></td>
					<td><%= prod.getBuyer().getBuyer_charger() %></td>
					<td><%= prod.getBuyer().getBuyer_comtel() %></td>
					</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<th>매입가</th>
			<td><input type="text" name="prod_cost"
				value="<%=prod.getProd_cost()%>" /><span class="error"><%=errors.get("prod_cost")%></span></td>
		</tr>
		<tr>
			<th>판매가</th>
			<td><input type="text" name="prod_price"
				value="<%=prod.getProd_price()%>" /><span class="error"><%=errors.get("prod_price")%></span></td>
		</tr>
		<tr>
			<th>특가</th>
			<td><input type="text" name="prod_sale"
				value="<%=prod.getProd_sale()%>" /><span class="error"><%=errors.get("prod_sale")%></span></td>
		</tr>
		<tr>
			<th>상품정보</th>
			<td><input type="text" name="prod_outline"
				value="<%=prod.getProd_outline()%>" /><span class="error"><%=errors.get("prod_outline")%></span></td>
		</tr>
		<tr>
			<th>디테일</th>
			<td><input type="text" name="prod_detail"
				value="<%=prod.getProd_detail()%>" /><span class="error"><%=errors.get("prod_detail")%></span></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="text" name="prod_img"
				value="<%=prod.getProd_img()%>" /><span class="error"><%=errors.get("prod_img")%></span></td>
		</tr>
		<tr>
			<th>토탈스톡</th>
			<td><input type="text" name="prod_totalstock"
				value="<%=prod.getProd_totalstock()%>" /><span class="error"><%=errors.get("prod_totalstock")%></span></td>
		</tr>
		<tr>
			<th>입고날자</th>
			<td><input type="text" name="prod_insdate"
				value="<%=prod.getProd_insdate()%>" /><span class="error"><%=errors.get("prod_insdate")%></span></td>
		</tr>
		<tr>
			<th>프롭스톡</th>
			<td><input type="text" name="prod_properstock"
				value="<%=prod.getProd_properstock()%>" /><span class="error"><%=errors.get("prod_properstock")%></span></td>
		</tr>
		<tr>
			<th>사잊브</th>
			<td><input type="text" name="prod_size"
				value="<%=prod.getProd_size()%>" /><span class="error"><%=errors.get("prod_size")%></span></td>
		</tr>
		<tr>
			<th>색</th>
			<td><input type="text" name="prod_color"
				value="<%=prod.getProd_color()%>" /><span class="error"><%=errors.get("prod_color")%></span></td>
		</tr>
		<tr>
			<th>배달</th>
			<td><input type="text" name="prod_delivery"
				value="<%=prod.getProd_delivery()%>" /><span class="error"><%=errors.get("prod_delivery")%></span></td>
		</tr>
		<tr>
			<th>유닛</th>
			<td><input type="text" name="prod_unit"
				value="<%=prod.getProd_unit()%>" /><span class="error"><%=errors.get("prod_unit")%></span></td>
		</tr>
		<tr>
			<th>슈령</th>
			<td><input type="text" name="prod_qtyin"
				value="<%=prod.getProd_qtyin()%>" /><span class="error"><%=errors.get("prod_qtyin")%></span></td>
		</tr>
		<tr>
			<th>이수진바보</th>
			<td><input type="text" name="prod_qtysale"
				value="<%=prod.getProd_qtysale()%>" /><span class="error"><%=errors.get("prod_qtysale")%></span></td>
		</tr>
		<tr>
			<th>마일리지</th>
			<td><input type="text" name="prod_mileage"
				value="<%=prod.getProd_mileage()%>" /><span class="error"><%=errors.get("prod_mileage")%></span></td>
		</tr>
		
	</table>
	<% 
		MemberVO authMember= (MemberVO)session.getAttribute("authMember");
	boolean authorized=false;
	if(authMember!=null&& "ROLE_ADMIN".equals(authMember.getMem_auth())){
		authorized=true;
	}
	if(authorized){
	%>
	<h4>구매자 목록</h4>
	<table>
		<thead>
			<tr>
				<th>회원아이디</th>			
				<th>회원명</th>			
				<th>주소</th>			
				<th>연락처</th>			
				<th>이메일</th>			
			</tr>
		</thead>
		<tbody>
		<% 
		
			List<MemberVO> customers=prod.getCustomers();
			if(customers!=null && customers.size()>0){
				for(MemberVO tmp: customers){
					%>
					<tr>
					<td><%= tmp.getMem_id() %></td>
					<td><%= tmp.getMem_name() %></td>
					<td><%= tmp.getAddress() %></td>
					<td><%= tmp.getMem_hp() %></td>
					<td><%= tmp.getMem_mail() %></td>
					</tr>
					
					<%
				}
			}else{
				%>
				<tr>
					<td colspan="5">구매좀..</td>
				</tr>
				<% 
				
			}
	}
				%>
			
		</tbody>
	</table>
	
</body>
</html>