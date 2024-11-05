package model;

import java.io.Serializable;

public class KhachHang533 extends ThanhVien533 implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String maKH;
	
	public KhachHang533() {}
	
	public String get_maKH() {
		return maKH;
	}
	
	public void set_maKH(String maKH) {
		this.maKH = maKH;
	}
}
