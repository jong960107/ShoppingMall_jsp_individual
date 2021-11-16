<%@page import="db.CarListBean"%>
<%@page import="java.util.Vector"%>
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

<center>
<table width="1000">

<tr height="60">
<td align="center" colspan="3">
<font size="5" color="gray">전체 렌트카 보기  </font>
</td>
</tr>
<%
	
		RentcarDAO rdao = new RentcarDAO();
		
		Vector<CarListBean> v = rdao.getAllCar();

		//tr을 3개씩 보여주고 다시 tr을 실행할수 있도록 적용하는 변수선언 
		int j = 0;
		for(int i = 0;i<v.size();i++){
			
			//벡터에 저장되어있는 빈클래스를 추출
			CarListBean bean = v.get(i);
			if(j%3==0){
				%>
				<tr height="220">
				<%} %>
				<td width="333" align="center">
				<a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
				<img alt="" src="images/<%=bean.getImg()%>" width="300" height="200">
				</a><p>
				<font size= "3" color="gray"><b>차량명 :<%=bean.getName() %></b> </font></p></td>
<% 				
			j = j+ 1;

			}
%>			


</table>
</center>


</body>
</html>