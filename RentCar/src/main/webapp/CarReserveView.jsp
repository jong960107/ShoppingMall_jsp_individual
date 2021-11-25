<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
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

<%
String id = (String)session.getAttribute("id");

if(id==null){
	%>
	<script type="text/javascript">
	alert("로그인을 먼저해주세요. ");
	location.href = 'RentcarMain.jsp?center=MemberLogin.jsp';
	</script>
	
	<%
	
	//로그인 되어있는 아이디를 읽어 옴 
	RentcarDAO rdao = new RentcarDAO();
	Vector<CarViewBean> v = rdao.getAllReserve(id);
	

%>

	<center>
	<table width="1000">
	<tr height="100">
	<td align="center" colspan="11">
	<font size="6" color="gray">차량예약화면  </font>
	</td>
	</tr>
	
	<tr height="40">
		<td width="150" align="center">차량이미지  </td>
		<td width="150" align="center">차량명  </td>
		<td width="150" align="center"> 대여일  </td>
		<td width="60" align="center">대여기간  </td>
		<td width="100" align="center">금액  </td>
		<td width="60" align="center">수량  </td>
		<td width="60" align="center">보험유무  </td>
		<td width="60" align="center">wifi 유무  </td>
		<td width="60" align="center">베이비 시트 유무  </td>
		<td width="60" align="center">네비게이션  </td>
		<td width="150" align="center">삭제  </td>
	</tr>
<%
	for(int i = 0;i<v.size();i++){
		CarViewBean bean = v.get(i);
	

%>
	
	
	<tr height="40" bordercolor="blue">
		<td width="150" align="center"> <img alt="" src="img/<%=bean.getImg()%>" width="120" height="70"> 차량이미지  </td>
		<td width="150" align="center"><%=bean.getName() %>  </td>
		<td width="150" align="center"> <%=bean.getRday() %> </td>
		<td width="60" align="center"><%=bean.getDday() %>  </td>
		<td width="100" align="center"><%=bean.getPrice() %>  </td>
		<td width="60" align="center"><%=bean.getQty() %>  </td>
		<td width="60" align="center"><%=bean.getUsein() %>  </td>
		<td width="60" align="center"><%=bean.getUsewifi() %>  </td>
		<td width="60" align="center"><%=bean.getUseseat() %>  </td>
		<td width="60" align="center"><%=bean.getUsenavi() %>  </td>
		<td width="150" align="center"><button onclick="location.href='CarReserveDelete.jsp?id=<%id%>&rday=<%=bean.getRday()%>' ">삭제 </button>  </td>
	</tr>
	
	<%
	
	}}
%>
	</table>
	</center>
</body>
</html>