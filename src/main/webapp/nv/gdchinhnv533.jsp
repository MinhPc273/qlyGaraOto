<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chu nhan vien</title>
</head>
<body>
<%

NhanVien533 nv = (NhanVien533)session.getAttribute("nhanvien");
if(nv==null){
response.sendRedirect("dangnhap.jsp?err=timeout");
}
%>
<h2> Trang chủ nhân viên quản lí </h2>
<button onclick="openPage('tk/gdchonloaiTK533.jsp')">Xem báo cáo</button>

<script>
    function openPage(pageUrl) {
        window.location.href = pageUrl;
    }
</script>

</body>
</html>