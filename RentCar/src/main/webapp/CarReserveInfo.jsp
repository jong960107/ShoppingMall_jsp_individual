<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	int no = Integer.parseInt(request.getParameter("no"));

	//데이터베이스에 접근 
	RentcarDAO rdao = new RentcarDAO();
	//렌트카 하나에 대한 정보를 얻어옴 
	CarListBean bean = rdao.getOneCar(no);
	//카테고리 분류값을 받아옴 

	int category = bean.getCategory();
	String temp = "";
	if (category == 1) {
		temp = "소형";
	} else if (category == 2) {
		temp = "중형";

	} else if (category == 3) {
		temp = "대형";
	}
	%>


	<center>
		<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
			<table width="1000">
				<tr height="100">
					<td align="center" colspan="3"><font size="5" color="gray">
							<%=bean.getName()%>차량선택
					</font></td>
				</tr>
				<tr>
					<td rowspan="5" width="500"><img alt=""
						src="images/<%=bean.getImg()%>" width="450"></td>
					<td width="250" align="center">차량 이름</td>
					<td width="250" align="center"><%=bean.getName()%></td>
				</tr>
				<tr>
					<td width="250" align="center">차량 수량</td>
					<td width="250" align="center"><select name="qty">
							<option value="1">1</option>

							<option value="2">2</option>

							<option value="3">3</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">차량 분류</td>
					<td width="250" align="center"><%=temp%></td>
				</tr>

				<tr>
					<td width="250" align="center">대여 가격</td>
					<td width="250" align="center"><%=bean.getPrice()%> 원</td>
				</tr>

				<tr>
					<td width="250" align="center">제조 회사</td>
					<td width="250" align="center"><%=bean.getCompany()%>차량선택</td>
				</tr>

				<tr>
					<td align="center" width="250"><input type="hidden" name="no"
						value="<%=bean.getNo()%>"/></td>
					<td align="center" width="250"><input type="hidden" name="images"
						value="<%=bean.getImg()%>"/></td>
							
					<td align="center" width="250" colspan="2"><input type="submit" value="옵션선택후 구매하기 " /></td>
				</tr>
			</table>
			<br> <br> <br> <font size="5" color="gray">
				차량정보보기 </font>
			<p>
				<%=bean.getInfo()%>
		</form>
	</center>


</body>
</html>