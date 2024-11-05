package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.*;

public class TKDichVuDAO533 extends DAO533 {
	public TKDichVuDAO533() {
		super();
	}

	public ArrayList<TKDichVu533> getDSCacLanDungDV(int ma, String ngayBatDau, String ngayKetThuc) {
		ArrayList<TKDichVu533> thongkeList = new ArrayList<TKDichVu533>();
		String sql = "SELECT hd.ngay AS ngay, ct.soluong AS soluong, ct.dongia AS dongia, "
				+ "(ct.soluong * ct.dongia) as doanhthu " + "FROM tblchitietdichvu533 ct "
				+ "JOIN tblhoadonban533 hdb ON ct.tblhoadonban533id = hdb.tblhoadon533id "
				+ "JOIN tblhoadon533 hd ON hdb.tblhoadon533id = hd.id "
				+ "JOIN tbldichvu533 dv ON ct.tbldichvu533id = dv.id " + "WHERE dv.id = ? AND hd.ngay BETWEEN ? AND ? "
				+ "ORDER BY hd.ngay";
		
		try (PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, ma);
			ps.setString(2, ngayBatDau);
			ps.setString(3, ngayKetThuc);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				TKDichVu533 tkDichVu = new TKDichVu533();
				tkDichVu.setNgay(rs.getString("ngay"));
				tkDichVu.setDoanhthu(rs.getFloat("doanhthu"));
				thongkeList.add(tkDichVu);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return thongkeList;
	}
}
