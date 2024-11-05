<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="model.*, java.text.SimpleDateFormat, java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xac nhan lich hen</title>
</head>
<body>
	<%
	KhachHang533 kh = (KhachHang533) session.getAttribute("khachhang");

	if (kh == null) {
		response.sendRedirect("dangnhap.jsp?err=timeout");
		return;
	}

	String thoiGianHenStr = request.getParameter("thoiGianHen");
	Date thoiGianHen = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(thoiGianHenStr);
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm a");
	String thoiGianHenFormatted = dateFormat.format(thoiGianHen);
	thoiGianHenFormatted = thoiGianHenFormatted.replace("am", "SA").replace("pm", "CH");
	
	TTDatLichHen533 lh = new TTDatLichHen533();
	lh.setKhachHang(kh);
	lh.setTime(thoiGianHenFormatted);
	session.setAttribute("ttlichhen", lh);
	%>

	<h2>Xác nhận lịch hẹn</h2>

	<p>
		<strong>Mã khách hàng:</strong>
		<%=kh.get_maKH()%></p>
	<p>
		<strong>Tên khách hàng:</strong>
		<%=kh.get_hoTen()%></p>
	<p>
		<strong>Số điện thoại:</strong>
		<%=kh.get_sdt()%></p>
	<p>
		<strong>Thời gian hẹn:</strong>
		<%=thoiGianHenFormatted%></p>

	<form action="doLuuLichHen533.jsp" method="post">
		<button type="submit">Xác nhận</button>
	</form>
</body>
</html>
