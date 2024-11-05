<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
TTDatLichHen533 ttDatLichHen533 = (TTDatLichHen533)session.getAttribute("ttlichhen");
if ((new LichHenDAO533()).LuuLichHen(ttDatLichHen533)) {
%>
<script type="text/javascript">
	alert("Đăng kí thành công!");
	window.location.href = "gdchinhkh533.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("Lỗi đăng kí!");
	history.back();
</script>
<%
}
%>