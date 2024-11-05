package model;

import java.io.Serializable;

public class NhanVien533 extends ThanhVien533 implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maNV;
	
	public NhanVien533() {};
	
	public String get_maNV() {
		return maNV;
	}

	public void set_maNV(String maNV) {
		this.maNV = maNV;
	}
}
