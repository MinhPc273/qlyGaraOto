<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chon ngay thong ke</title>
</head>
<body>
<%
    // Lấy tham số 'loaiTK' từ URL
    String loaiTK = request.getParameter("loaiTK");

    // Lưu vào session nếu 'loaiTK' có giá trị
    if (loaiTK != null) {
        session.setAttribute("loaiThongKe", loaiTK);
    }
    
    
%>

<h2>Chọn ngày thống kê</h2>
<p><strong>Thống kê dịch vụ/ phụ tùng theo doanh thu</strong></p>
<form action="gdxemTK533.jsp" method="post">
    <!-- Ô chọn ngày bắt đầu -->
    <label for="ngayBatDau">Ngày bắt đầu:</label>
    <input type="date" id="ngayBatDau" name="ngayBatDau" required><br><br>

    <!-- Ô chọn ngày kết thúc -->
    <label for="ngayKetThuc">Ngày kết thúc:</label>
    <input type="date" id="ngayKetThuc" name="ngayKetThuc" required><br><br>

    <!-- Nút xem thống kê -->
    <button type="submit">Xem thống kê</button>
</form>

</body>
</html>
