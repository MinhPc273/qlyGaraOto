package model;

import java.io.Serializable;

public class ThanhVien533 implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String passWord;
	
	private int id;
	private String hoTen;
	private String vaiTro;
	private String sdt;
	
	public ThanhVien533() {}

	public String get_userName() {
		return userName;
	}

	public void set_userName(String userName) {
		this.userName = userName;
	}

	public String get_passWord() {
		return passWord;
	}

	public void set_passWord(String passWord) {
		this.passWord = passWord;
	}

	public int get_id() {
		return id;
	}

	public void set_id(int id) {
		this.id = id;
	}

	public String get_hoTen() {
		return hoTen;
	}

	public void set_hoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String get_vaiTro() {
		return vaiTro;
	}

	public void set_vaiTro(String vaiTro) {
		this.vaiTro = vaiTro;
	}

	public String get_sdt() {
		return sdt;
	}

	public void set_sdt(String sdt) {
		this.sdt = sdt;
	}
}
