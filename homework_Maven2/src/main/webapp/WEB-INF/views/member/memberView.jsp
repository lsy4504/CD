<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.CommonException"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberSerivce"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="message" class="java.lang.String" scope="request"></jsp:useBean>
<%
	// 	MemberVO member=(MemberVO) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">	
  <script src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
$( function() {
	<%
		if(StringUtils.isBlank(message)){
			message=(String)
					session.getAttribute("message");
			session.removeAttribute("message");
		}
	if(StringUtils.isNotBlank(message)){
		
	%>
	alert("<%=message%>");
	<%
		}
	%>
    $( "[type='date']" ).datepicker({
    	  dateFormat: "yy-mm-dd"
    
    });
    $("#delBtn").on('click',function(){
    	var chk=confirm(" 정말로 탈퇴함? 리얼 투르? 실화냐 구라 즐.");
    	if(chk){
    		var pass=prompt("비밀번호 입력하시오...");
    		if(pass){
	//     		document.delForm.mem_pass.value=pass;
				$("[name='mem_pass']").val(pass);
				document.delForm.submit();
    		}
    		
    	}
    })
  } );
	
</script>
</head>
<body>
		<jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO"
			scope="request"></jsp:useBean>
		<jsp:useBean id="errors" class="java.util.HashMap" scope="request"></jsp:useBean>
		<% 
				boolean mutable= false;
				MemberVO authMember =(MemberVO)session.getAttribute("authMember");
				if(authMember!=null&& !"ROLE_ADMIN".equals(authMember.getMem_auth())){
					if(authMember.getMem_id().equals(member.getMem_id())){
						mutable=true;
					}
				}
				if(mutable){
			%>
<form name="delForm" action="<%= request.getContextPath() %>/member/memberDelete.do" method="post">
	<input type="hidden" name="mem_id" value="<%= member.getMem_id() %>"/>
	<input type="hidden" name="mem_pass"  value=""/>
</form>

<form action="<%= request.getContextPath() %>/member/memberUpdate.do" method="post">
<% 
				}
%>
	<table>
		<%--
		
		if(member!=null){
			out.print("<tr><th>아이디</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>비밀번호</th><td>"+member.getMem_pass()+"</td></tr>");
			out.print("<tr><th>이름</th><td>"+member.getMem_name()+"</td></tr>");
			out.print("<tr><th>주민번호</th><td>"+member.getMem_regno1()+"-"+member.getMem_regno2()+"</td></tr>");
			out.print("<tr><th>생일</th><td>"+member.getMem_bir()+"</td></tr>");
			out.print("<tr><th>우편번호</th><td>"+member.getMem_zip()+"</td></tr>");
			out.print("<tr><th>주소</th><td>"+member.getAddress()+"</td></tr>");
			out.print("<tr><th>집전화</th><td>"+member.getMem_hometel()+"</td></tr>");
			out.print("<tr><th>회사</th><td>"+member.getMem_comtel()+"</td></tr>");
			out.print("<tr><th>휴대폰</th><td>"+member.getMem_hp()+"</td></tr>");
			out.print("<tr><th>직업</th><td>"+member.getMem_job()+"</td></tr>");
			out.print("<tr><th>취미</th><td>"+member.getMem_like()+"</td></tr>");
			out.print("<tr><th>기념일</th><td>"+member.getMem_memorial()+"</td></tr>");
			out.print("<tr><th>기념일자</th><td>"+member.getMem_memorialday()+"</td></tr>");
			out.print("<tr><th>마일리지</th><td>"+member.getMem_mileage()+"</td></tr>");
		}else{
		}
	--%>
		<tr>
			<th>회원아이디</th>
			<td><%=member.getMem_id()%> <input type="hidden" name="mem_id"
				value="<%=member.getMem_id()%>"  /><span class="error"><%=errors.get("mem_id")%></span></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="mem_pass"
				value="<%=member.getMem_pass()%>" /><span class="error"><%=errors.get("mem_pass")%></span></td>
		</tr>
		<tr>
			<th>회원명</th>
			<td><input type="text" name="mem_name" 
				value="<%=member.getMem_name()%>" /><span class="error"><%=errors.get("mem_name")%></span></td>
		</tr>
		<tr>
			<th>주민번호1</th>
			<td><input type="text" name="mem_regno1" disabled="disabled"
				value="<%=member.getMem_regno1()%>" /><span class="error"><%=errors.get("mem_regno1")%></span></td>
		</tr>
		<tr>
			<th>주민번호2</th>
			<td><input type="text" name="mem_regno2" disabled="disabled"
				value="<%=member.getMem_regno2()%>" /><span class="error"><%=errors.get("mem_regno2")%></span></td>
		</tr>
		<tr>
			<th>생일</th>
			<td><input type="text" name="mem_bir" disabled="disabled"
				value="<%=member.getMem_bir()%>" /><span class="error"><%=errors.get("mem_bir")%></span></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" name="mem_zip"
				value="<%=member.getMem_zip()%>" /><span class="error"><%=errors.get("mem_zip")%></span></td>
		</tr>
		<tr>
			<th>주소1</th>
			<td><input type="text" name="mem_add1"
				value="<%=member.getMem_add1()%>" /><span class="error"><%=errors.get("mem_add1")%></span></td>
		</tr>
		<tr>
			<th>주소2</th>
			<td><input type="text" name="mem_add2"
				value="<%=member.getMem_add2()%>" /><span class="error"><%=errors.get("mem_add2")%></span></td>
		</tr>
		<tr>
			<th>집번</th>
			<td><input type="text" name="mem_hometel"
				value="<%=member.getMem_hometel()%>" /><span class="error"><%=errors.get("mem_hometel")%></span></td>
		</tr>
		<tr>
			<th>회번</th>
			<td><input type="text" name="mem_comtel"
				value="<%=member.getMem_comtel()%>" /><span class="error"><%=errors.get("mem_comtel")%></span></td>
		</tr>
		<tr>
			<th>폰번</th>
			<td><input type="text" name="mem_hp"
				value="<%=member.getMem_hp()%>" /><span class="error"><%=errors.get("mem_hp")%></span></td>
		</tr>
		<tr>
			<th>이멜</th>
			<td><input type="text" name="mem_mail"
				value="<%=member.getMem_mail()%>" /><span class="error"><%=errors.get("mem_mail")%></span></td>
		</tr>
		<tr>
			<th>직업</th>
			<td><input type="text" name="mem_job"
				value="<%=member.getMem_job()%>" /><span class="error"><%=errors.get("mem_job")%></span></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><input type="text" name="mem_like"
				value="<%=member.getMem_like()%>" /><span class="error"><%=errors.get("mem_like")%></span></td>
		</tr>
		<tr>
			<th>기념일</th>
			<td><input type="text" name="mem_memorial"
				value="<%=member.getMem_memorial()%>" /><span class="error"><%=errors.get("mem_memorial")%></span></td>
		</tr>
		<tr>
			<th>기념일자</th>
			<td><input type="text" name="mem_memorialday"
				value="<%=member.getMem_memorialday()%>" /><span class="error"><%=errors.get("mem_memorialday")%></span></td>
		</tr>
		<tr>
			<th>마일리지</th>
			<td><%=member.getMem_mileage()%></td>
		</tr>
		<tr>
			<th>탈퇴여부</th>
			<td><%="Y".equals(member.getMem_delete())?"탈":"활"%></td>
		</tr>
		<tr>
		<td colspan="2">
			<input type="button" value="뒤로가기" onclick="history.back();"/> 
			<% if(mutable){
				%>
			<input type="submit" value="수정"/> 
			<input type="reset" value="리셋"/> 
			<input type="button" value="탈퇴하기" id="delBtn" />
			<% } %> 
		</td>
		</tr>
	</table>
	<% if(mutable){ %>
</form>
<% } %>
<h4>구매상품목록</h4>
	<table calss="table">
		<thead>
			<tr>
			<th>품번</th>
			<th>품명</th>
			<th>매입가</th>
			<th>가격</th>
			<th>상세정보?</th>
			</tr>
		</thead>
		<tbody>
				<% 
					List<ProdVO> prodList= member.getProdList();
				if(prodList!=null&&prodList.size()>0){
					for(ProdVO p:prodList){
			%>
			<tr>
				<td><%= p.getProd_id() %></td>
				<td><%= p.getProd_name() %></td>
				<td><%= p.getProd_cost() %></td>
				<td><%= p.getProd_price() %></td>
				<td><%= p.getProd_outline() %></td>
			</tr>
			<% }}else{
				%>
				<tr>
					<td colspan="5"> 구매 노 상 구매 노상 거ㅈ;ㅣ냐고</td>
				</tr>
			<%
					}
			%>
		</tbody>
	</table>

</body>
</html>