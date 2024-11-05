<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, dao.*, model.*"%>

<%
String ngayBatDau = request.getParameter("ngayBatDau");
String ngayKetThuc = request.getParameter("ngayKetThuc");
int maDichVuPhuTung = Integer.parseInt(request.getParameter("ma"));
String tenDichVuPhuTung = request.getParameter("ten");
String loai = request.getParameter("loai");

ArrayList<TKDichVu533> listDv = null; // Khởi tạo danh sách dịch vụ
ArrayList<TKPhuTung533> listPt = null; // Khởi tạo danh sách phụ tùng

if ("Dịch Vụ".equalsIgnoreCase(loai)) {
    TKDichVuDAO533 tkDichVuDAO = new TKDichVuDAO533();
    listDv = tkDichVuDAO.getDSCacLanDungDV(maDichVuPhuTung, ngayBatDau, ngayKetThuc);
} else {
    TKPhuTungDAO533 tkPhuTungDAO = new TKPhuTungDAO533();
    listPt = tkPhuTungDAO.getDSCacLanDungPT(maDichVuPhuTung, ngayBatDau, ngayKetThuc);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Các lần sử dụng</title>
</head>
<body>
	<h2>
		<strong>Thống kê các lần sử dụng dịch vụ/ phụ tùng</strong>
	</h2>
	<p>
		<strong>Thời gian bắt đầu:</strong>
		<%= ngayBatDau %></p>
	<p>
		<strong>Thời gian kết thúc:</strong>
		<%= ngayKetThuc %></p>
	<p>
		<strong>Mã <%= loai %>:</strong>
		<%= maDichVuPhuTung %></p>
	<p>
		<strong>Tên <%= loai %>:</strong>
		<%= tenDichVuPhuTung %></p>

	<!-- Bảng hiển thị thống kê các lần sử dụng -->
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>TT</th>
			<th>Ngày</th>
			<th>Doanh thu</th>
		</tr>
		<%
		int i = 0;
            if (listDv != null && !listDv.isEmpty()) {
                for (TKDichVu533 tk : listDv) {
        %>
		<tr>
			<td><%= ++i %></td>
			<td><%= tk.getNgay() %></td>
			<td><%= tk.getDoanhthu() %></td>
		</tr>
		<%
                }
            } else if (listPt != null && !listPt.isEmpty()) {
                for (TKPhuTung533 tk : listPt) {
        %>
		<tr>
			<td><%= ++i %></td>
			<td><%= tk.getNgay() %></td>
			<td><%= tk.getDoanhthu() %></td>
		</tr>
		<%
                }
            } else {
        %>
		<tr>
			<td colspan="3">Không có dữ liệu thống kê trong khoảng thời gian này.</td>
		</tr>
		<%
            }
        %>
	</table>

	<button onclick="window.history.back()">Quay lại</button>
</body>
</html>
