<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chu khach hang</title>
</head>
<body>
<%
KhachHang533 kh = (KhachHang533)session.getAttribute("khachhang");
if(kh==null){
response.sendRedirect("dangnhap.jsp?err=timeout");
}
%>
<h2> Trang chủ khách hàng </h2>
<button onclick="openPage('gdchonthoigianhen533.jsp')">Đặt lịch hẹn trực tuyến</button>

<script>
    function openPage(pageUrl) {
        window.location.href = pageUrl;
    }
</script>

</body>
</html>