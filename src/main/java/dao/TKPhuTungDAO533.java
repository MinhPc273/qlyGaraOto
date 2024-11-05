package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.*;

public class TKPhuTungDAO533 extends DAO533{
	public TKPhuTungDAO533() {
		super();
	}
	
	public ArrayList<TKPhuTung533> getDSCacLanDungPT(int ma, String ngayBatDau, String ngayKetThuc) {
		ArrayList<TKPhuTung533> thongkeList = new ArrayList<TKPhuTung533>();
		String sql = "SELECT hd.ngay AS ngay, ct.soluong AS soluong, ct.dongia AS dongia, "
				+ "(ct.soluong * ct.dongia) as doanhthu " + "FROM tblchitietphutung533 ct "
				+ "JOIN tblhoadonban533 hdb ON ct.tblhoadon533id = hdb.tblhoadon533id "
				+ "JOIN tblhoadon533 hd ON hdb.tblhoadon533id = hd.id "
				+ "JOIN tblphutung533 dv ON ct.tblphutung533id = dv.id " + "WHERE dv.id = ? AND hd.ngay BETWEEN ? AND ? "
				+ "ORDER BY hd.ngay";

		try (PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, ma);
			ps.setString(2, ngayBatDau);
			ps.setString(3, ngayKetThuc);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TKPhuTung533 tKPhuTung533 = new TKPhuTung533();
				tKPhuTung533.setNgay(rs.getString("ngay"));
				tKPhuTung533.setDoanhthu(rs.getFloat("doanhthu"));
				thongkeList.add(tKPhuTung533);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return thongkeList;
	}
}





