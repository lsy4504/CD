<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Map<String, String> lprodList = (Map<String, String>) request.getAttribute("lprodList");
	String message= (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
< <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">	
  <script src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
			<%
				if(StringUtils.isNotBlank(message)){
					
			%>
			alert("<%=message%>");
			<%
				}
			%>
		$("[name$='date']").datepicker({
			dateFormat:"yy-mm-dd"
		})	;
		var pattern = "<option value=%V> %T</option>";
		var prod_buyerTag=$("[name='prod_buyer']");
		$("#sel").on('change', function() {
			var lgu=$(this).val();
			var url="<%=request.getContextPath()%>/prod/getBuyerList.do";
			alert(lgu);
			$.ajax({
				url : url,
				method : "get",
				data : {
					prod_lgu:lgu,
// 					바보:"윤지영바보"
					
// 					?prod_lgu=P101&바보=윤지영
				},
				dataType : "json",
				success : function(resp) {//우리가 받아온 제이슨배열
					alert(resp);
					var options=pattern.replace("%V","").replace("%T","선택해")
					$.each(resp, function(idx, buyer){
						options+=pattern.replace("%V",buyer.buyer_id)
									.replace("%T",buyer.buyer_name);
					});
					prod_buyerTag.html(options);
				},
				error : function(resp) {

				}
			});
		});
	})
</script>
</head>
<body>
	<jsp:useBean id="prod" class="kr.or.ddit.vo.ProdVO" scope="request"></jsp:useBean>
	<jsp:useBean id="errors" class="java.util.HashMap" scope="request"></jsp:useBean>
	<form method="post">
		<table>

			<tr>
				<th>상품명</th>
				<td><input type="text" name="prod_name"
					value="<%=prod.getProd_name()%>" /><span class="error"><%=errors.get("prod_name")%></span></td>
			</tr>
			<tr>
				<th>판매항목</th>
				<td><select name="prod_lgu" id='sel'>
						<option value="">분류</option>
						<%
							for (Entry e : lprodList.entrySet()) {
						%>
						<option value="<%=e.getKey()%>"><%=e.getValue()%>
						</option>

						<%
							}
						%>


				</select></td>
			</tr>
			<tr>
				<th>판매자</th>
				<td>
					<select name="prod_buyer">
					</select>
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
				<td><input class="" type="text" name="prod_insdate"
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
			<tr>
				<td colspan="2"><input type="submit" value="전송" /> <input
					type="reset" value="취소" /> <input type="button" value="목록으로"
					onclick="location.href='<%=request.getContextPath()%>/prod/prodList.do';" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>