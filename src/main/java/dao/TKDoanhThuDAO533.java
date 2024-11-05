package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.*;

public class TKDoanhThuDAO533 extends DAO533{
	public TKDoanhThuDAO533() {
		super();
	}
	
	public ArrayList<TKDoanhThu533> getTKDoanhThu(String ngayBatDau, String ngayKetThuc) {
		ArrayList<TKDoanhThu533> thongkeList = new ArrayList<TKDoanhThu533>();
		String sql = "SELECT ma, ten, loai, SUM(doanhthu) as doanhthu FROM (" +
                "    SELECT dv.id as ma, dv.ten as ten ,'Dịch Vụ' AS loai, SUM(ct.dongia * ct.soluong) AS doanhthu " +
                "    FROM tblchitietdichvu533 ct " +
                "    JOIN tblhoadonban533 hdb ON ct.tblhoadonban533id = hdb.tblhoadon533id " +
                "    JOIN tbldichvu533 dv ON ct.tbldichvu533id = dv.id " +
                "    JOIN tblhoadon533 hd ON hdb.tblhoadon533id = hd.id " +
                "    WHERE hd.ngay BETWEEN ? AND ? " +
                "    GROUP BY dv.id, dv.ten " +
                "    UNION ALL " +
                "    SELECT pt.id AS ma, pt.ten AS ten, 'Phụ Tùng' AS loai, SUM(ct.dongia * ct.soluong) AS doanhthu " +
                "    FROM tblchitietphutung533 ct " +
                "    JOIN tblhoadonban533 hdb ON ct.tblhoadon533id = hdb.tblhoadon533id " +
                "    JOIN tblphutung533 pt ON ct.tblphutung533id = pt.id " + 
                "    JOIN tblhoadon533 hd ON hdb.tblhoadon533id = hd.id " + 
                "    WHERE hd.ngay BETWEEN ? AND ? " +
                "    GROUP BY pt.id, pt.ten " + 
                ") AS doanhthuTong " +
                "GROUP BY ma, ten, loai " + 
                "ORDER BY doanhthu DESC";

        try (
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, ngayBatDau);
            ps.setString(2, ngayKetThuc);
            ps.setString(3, ngayBatDau);
            ps.setString(4, ngayKetThuc);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                TKDoanhThu533 tkDoanhThu = new TKDoanhThu533();
                tkDoanhThu.setMa(rs.getString("ma"));
                tkDoanhThu.setTen(rs.getString("ten"));
                tkDoanhThu.setLoai(rs.getString("loai"));
                tkDoanhThu.setDoanhthu(rs.getFloat("doanhthu"));
                thongkeList.add(tkDoanhThu);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return thongkeList;
	}
}





