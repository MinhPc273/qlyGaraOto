<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chon thoi gian hen</title>
</head>
<body>
<%

	KhachHang533 kh = (KhachHang533) session.getAttribute("khachhang");
%>

<h2>Chọn ngày giờ</h2>
<form action="gdnhapttvaxacnhan533.jsp" method="post">
    <label for="thoiGianHen">Thời gian:</label>
    <input type="datetime-local" id="thoiGianHen" name="thoiGianHen" required><br><br>
    <button type="submit">Tiếp tục</button>
</form>

<script>
    function openPage(pageUrl) {
        window.location.href = pageUrl;
    }
</script>
</body>
</html>
