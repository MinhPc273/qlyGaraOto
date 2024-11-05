<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
<%
String ngayBatDau = request.getParameter("ngayBatDau");
String ngayKetThuc = request.getParameter("ngayKetThuc");

TKDoanhThuDAO533 tkDoanhThuDAO = new TKDoanhThuDAO533();
ArrayList<TKDoanhThu533> thongkeList = tkDoanhThuDAO.getTKDoanhThu(ngayBatDau, ngayKetThuc);

float tongDoanhThu = 0;
if (thongkeList != null) {
    for (TKDoanhThu533 tk : thongkeList) {
        tongDoanhThu += tk.getDoanhthu();
    }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem thong ke</title>
<script>
    function openDetail(ma, ten, loai, ngayBatDau, ngayKetThuc) {
        window.location.href = 'gdcaclandung533.jsp?ma=' + ma + '&ten=' + ten + '&loai=' + loai + '&ngayBatDau=' + ngayBatDau + '&ngayKetThuc=' + ngayKetThuc;
    }
</script>
</head>
<body>
    <h2><strong>Thống kê dịch vụ/ phụ tùng theo doanh thu</strong></h2>
    <p><strong>Ngày bắt đầu: <%= ngayBatDau %></strong></p>
    <p><strong>Ngày kết thúc: <%= ngayKetThuc %></strong></p>

    <!-- Bảng hiển thị thống kê doanh thu -->
    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
        	<th>TT</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Loại</th>
            <th>Doanh thu</th>
        </tr>
        <%
            if (thongkeList != null && !thongkeList.isEmpty()) {
            	int i = 0;
                for (TKDoanhThu533 tk : thongkeList) {
        %>
                    <tr onclick="openDetail('<%= tk.getMa() %>', '<%= tk.getTen() %>', '<%= tk.getLoai() %>', '<%= ngayBatDau %>', '<%= ngayKetThuc %>')" style="cursor: pointer;">
                        <td><%= ++i %></td>
                        <td><%= tk.getMa() %></td>
                        <td><%= tk.getTen() %></td>
                        <td><%= tk.getLoai() %></td>
                        <td><%= tk.getDoanhthu() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="4">Không có dữ liệu thống kê trong khoảng thời gian này.</td>
                </tr>
        <%
            }
        %>
        <!-- Hiển thị tổng doanh thu -->
        <tr>
            <td colspan="4" style="text-align: left;"><strong>Tổng doanh thu:</strong></td>
            <td><%= tongDoanhThu %></td>
        </tr>
    </table>
    
     <!-- Nút Quay lại -->
    <button onclick="window.history.back()">Quay lại</button>
</body>
</html>