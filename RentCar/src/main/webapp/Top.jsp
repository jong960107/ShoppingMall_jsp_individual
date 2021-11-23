<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 세션을 이용한 로그인 처리  -->
<%
String id = (String)session.getAttribute("id");
//로그인이 되어있지 않다면,
if(id == null){
	
	id = "GUEST";
	
}


%>

	<table width="1000" border = "1">
		<tr height="70">
		<td colspan="4">
		<a href="RentcarMain.jsp"style="text-decoration:none">
		<img alt="" src="images/RENT.png" width="65" height="65">
		</a>
		</td>
		<td align="center" width="200">
		<%=id %>님  
		<%
		if(id.equals("GUEST")){
			%>
			<button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp' ">로그인 </button>
			<% 
		}
		%>
		</td>
		</tr>
		
		<tr height="50">
		<td align="center" width="200" bgcolor="red">
		<font color="white" size="4"> <a href="RentcarMain.jsp?center=CarReserveMain.jsp"  style="text-decoration:none; color:white">예약하기</a>  </font>
		</td>
		
		<td align="center" width="200" bgcolor="red">
		<font color="white" size="4"> <a href="RentcarMain.jsp?center=CarReserveView.jsp"  style="text-decoration:none;color:white">예약확인</a>  </font>
		</td>
		
		<td align="center" width="200" bgcolor="red">
		<font color="white" size="4"> <a href="#" style="text-decoration:none;color:white">자유게시판 </a>  </font>
		</td>
		
		<td align="center" width="200" bgcolor="red">
		<font color="white" size="4"> <a href="#" style="text-decoration:none;color:white">이벤트 </a>  </font>
		</td>
		
		<td align="center" width="200" bgcolor="red">
		<font color="white" size="4"> <a href="#" style="text-decoration:none;color:white">고객센터 </a>  </font>
		</td>
		</tr>
	</table>


</body>
</html>