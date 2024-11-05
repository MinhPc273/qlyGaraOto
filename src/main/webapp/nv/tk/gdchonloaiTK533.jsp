<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chon thong ke</title>
</head>
<body>

<h2> Chọn thống kê </h2>
<button onclick="openPage('gdchonngayTK533.jsp?loaiTK=doanhThu')">Thống kê dịch vụ/ phụ tùng theo doanh thu</button>


<script>
    function openPage(pageUrl) {
        window.location.href = pageUrl;
    }
</script>

</body>
</html>