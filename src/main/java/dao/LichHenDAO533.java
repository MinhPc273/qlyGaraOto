package dao;

import java.sql.PreparedStatement;

import model.TTDatLichHen533;

public class LichHenDAO533 extends DAO533{
	public LichHenDAO533() {
		super();
	}
	
	public boolean LuuLichHen(TTDatLichHen533 lh) {
		String sql = "INSERT INTO tbllichhen533 (time, tblkhachhang533id) VALUES (?, ?)";
		boolean isSave = false;
        try (
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, lh.getTime()); // assuming `time` in `LichHen` is LocalDateTime
            ps.setInt(2, lh.getKhachHang().get_id());
            
            // Execute the insert statement
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSave = true; 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSave;
	}
}
