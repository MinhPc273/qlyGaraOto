package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import model.KhachHang533;
import model.NhanVien533;
import model.ThanhVien533;

public class ThanhVienDAO533 extends DAO533{
	public ThanhVienDAO533() {
		super();
	}
	
	public boolean KiemTraDangNhap(ThanhVien533 tv) {
		boolean kq = false;
		
		// check SQL injection attacks
		if(tv.get_userName().contains("true") 
		|| tv.get_userName().contains("=") 
		|| tv.get_passWord().contains("true")
		|| tv.get_passWord().contains("=")) return false;
		
		String sql = "SELECT * FROM tblthanhvien533 WHERE userName = ? AND passWord = ?";
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, tv.get_userName());
			cs.setString(2, tv.get_passWord());
			
			ResultSet rs = cs.executeQuery();
			
			if(rs.next()) {
				tv.set_id(rs.getInt("Id"));
				tv.set_hoTen(rs.getString("HoTen"));
				tv.set_vaiTro(rs.getString("vaiTro"));
				tv.set_sdt(rs.getString("sdt"));
				kq = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = false;
		}
		return kq;
	}
	
	public KhachHang533 getTTKH(ThanhVien533 tv) {
		KhachHang533 kh = new KhachHang533();
		kh.set_id(tv.get_id());
		kh.set_hoTen(tv.get_hoTen());
		kh.set_vaiTro(tv.get_vaiTro());
		kh.set_sdt(tv.get_sdt());
		
		String sql = "SELECT * FROM tblKhachHang533 Where tblThanhVien533Id = ?";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, tv.get_id());
			
			ResultSet rs = cs.executeQuery();
			
			if(rs.next()) {
				kh.set_maKH(rs.getString("maKH"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kh;
	}
	
	public NhanVien533 getTTNV(ThanhVien533 tv) {
		NhanVien533 nv = new NhanVien533();
		nv.set_id(tv.get_id());
		nv.set_hoTen(tv.get_hoTen());
		nv.set_vaiTro(tv.get_vaiTro());
		nv.set_sdt(tv.get_sdt());
		
		String sql = "SELECT * FROM tblNhanVien533 Where tblThanhVien533Id = ?";
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, tv.get_id());
			
			ResultSet rs = cs.executeQuery();
			
			if(rs.next()) {
				nv.set_maNV(rs.getString("maNV"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nv;
	}
}
