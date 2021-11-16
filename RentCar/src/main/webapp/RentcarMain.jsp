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
String center = request.getParameter("center");
//처음 실행시에는 center값이넘어오지 않기에 

if(center==null){//null 처리해줌,안하면 매일마다 프로그램 에러남 
	center = "Center.jsp";//디폴트 center값을 부여 
	
	
}

%>
<center>
<table width="1000">
<!-- top부분  -->
<tr height="120" align="center">
<td align="center" width="1000">
<jsp:include page="Top.jsp"></jsp:include>
</td>
</tr>

<!-- CENTER 부분  -->
<tr height="470" align="center">
<td align="center" width="1000">
<jsp:include page="<%=center %>"></jsp:include>
</td>
</tr>

<!-- Bottom 부분  -->
<tr height="100" align="center">
<td align="center" width="1000">
<jsp:include page="Bottom.jsp"></jsp:include>
</td>
</tr>


</table>
</center>
</body>
</html>