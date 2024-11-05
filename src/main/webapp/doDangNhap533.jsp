<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
<%

String username = (String) request.getParameter("username");
String password = (String) request.getParameter("password");
ThanhVien533 tv = new ThanhVien533();
tv.set_userName(username);
tv.set_passWord(password);
ThanhVienDAO533 dao = new ThanhVienDAO533();
boolean kq = dao.KiemTraDangNhap(tv);
if (kq && (tv.get_vaiTro().equalsIgnoreCase("khach hang"))) {
	session.setAttribute("khachhang", dao.getTTKH(tv));
	response.sendRedirect("kh\\gdchinhkh533.jsp");
} else if (kq && (tv.get_vaiTro().equalsIgnoreCase("nv quan li"))) {
	session.setAttribute("nhanvien", dao.getTTNV(tv));
	response.sendRedirect("nv\\gdchinhnv533.jsp");
} else {
	response.sendRedirect("gddangnhap.jsp?err=fail");
}
%>