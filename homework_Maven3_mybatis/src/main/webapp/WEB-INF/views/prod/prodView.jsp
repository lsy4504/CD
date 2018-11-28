<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   ProdVO prod = (ProdVO) request.getAttribute("prod");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
   integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://jqueryui.com/resources/demos/style.css">
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
   integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
   integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
   crossorigin="anonymous"></script>
</head>
<body>
   <%--    <jsp:useBean id="prod" class="kr.or.ddit.vo.ProdVO" scope="request"></jsp:useBean> --%>
   <jsp:useBean id="errors" class="java.util.LinkedHashMap"
      scope="request"></jsp:useBean>
   <table>
      <tr>
         <th>상품코드</th>
         <td><%=prod.getProd_id()%></td>
      </tr>
      <tr>
         <th>상품명</th>
         <td><%=prod.getProd_name()%></td>
      </tr>
      <tr>
         <th>분류명</th>
         <td><%=prod.getLprod_nm()%></td>
      </tr>
      <tr>
         <th>거래처정보</th>
         <td>
         <table>
            <thead>
               <tr>
                  <th>거래처명</th>
                  <th>소세지</th>
                  <th>담당자명</th>
                  <th>연락처</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td><%=prod.getBuyer().getBuyer_name() %></td>
                  <td><%=prod.getBuyer().getBuyer_add1() %></td>
                  <td><%=prod.getBuyer().getBuyer_charger() %></td>
                  <td><%=prod.getBuyer().getBuyer_comtel() %></td>
               </tr>
            </tbody>
         </table>
         </td>
      </tr>
      <tr>
         <th>구매가</th>
         <td><%=prod.getProd_cost()%></td>
      </tr>
      <tr>
         <th>판매가</th>
         <td><%=prod.getProd_price()%></td>
      </tr>
      <tr>
         <th>특판가</th>
         <td><%=prod.getProd_sale()%></td>
      </tr>
      <tr>
         <th>시용상품정보</th>
         <td><%=prod.getProd_outline()%></td>
      </tr>
      <tr>
         <th>상세정보</th>
         <td><%=prod.getProd_detail()%></td>
      </tr>
      <tr>
         <th>이미지경로</th>
         <td><%=prod.getProd_img()%></td>
      </tr>
      <tr>
         <th>재고량</th>
         <td><%=prod.getProd_totalstock()%></td>
      </tr>
      <tr>
         <th>입고일</th>
         <td><%=prod.getProd_insdate()%></td>
      </tr>
      <tr>
         <th>적정재고</th>
         <td><%=prod.getProd_properstock()%></td>
      </tr>
      <tr>
         <th>상품크기</th>
         <td><%=prod.getProd_size()%></td>
      </tr>
      <tr>
         <th>상품색상</th>
         <td><%=prod.getProd_color()%></td>
      </tr>
      <tr>
         <th>배송방법</th>
         <td><%=prod.getProd_delivery()%></td>
      </tr>
      <tr>
         <th>단위</th>
         <td><%=prod.getProd_unit()%></td>
      </tr>
      <tr>
         <th>입고량</th>
         <td><%=prod.getProd_qtyin()%></td>
      </tr>
      <tr>
         <th>판매량</th>
         <td><%=prod.getProd_qtysale()%></td>
      </tr>
      <tr>
         <th>마일리지</th>
         <td><%=prod.getProd_mileage()%></td>
      </tr>
   </table>
   <%
      boolean authorized = false;
      MemberVO authMember= (MemberVO)session.getAttribute("authMember");
      authorized = authMember!=null && "ROLE_ADMIN".equals(authMember.getMem_auth());
      
      if(true){
         
   %>
   <input type="button" value="상품수정"
      onclick="location.href='<%=request.getContextPath()%>/prod/prodUpdate.do?what=<%=prod.getProd_id()%>'"/>
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
         List<MemberVO> customers = prod.getCustomers();
         if(customers!=null && customers.size()>0){
            for(MemberVO tmp : customers){
            %>
            <tr>
               <td><%=tmp.getMem_id() %></td>
               <td><%=tmp.getMem_name() %></td>
               <td><%=tmp.getAddress() %></td>
               <td><%=tmp.getMem_hp() %></td>
               <td><%=tmp.getMem_mail() %></td>
            </tr>
            <%
            }
         }else{
            %>
            <tr>
               <td colspan="5">구매자가 없음...</td>
            </tr>
            <%
         }
      %>
      </tbody>
   </table>
   <%
      }
   %>
</body>
</html>