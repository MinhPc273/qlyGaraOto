package model;

import java.io.Serializable;

public class TTDatLichHen533 implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String time;
    private KhachHang533 kh;

    public TTDatLichHen533() {
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public KhachHang533 getKhachHang() {
        return kh;
    }

    public void setKhachHang(KhachHang533 kh) {
        this.kh = kh;
    }
}
