<%@page import="java.util.Date"%>
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
request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="rbean" class="db.CarReserveBean">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>

	<%
String id = (String)session.getAttribute("id");
if(id==null){
%>

	<script type="text/javascript">
		alert("로그인후 예약이 가능합니다.")
		location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
	</script>

<%
}

//날짜 비교 
Date d1 = null;
Date d2 = null;

%>
</body>
</html>