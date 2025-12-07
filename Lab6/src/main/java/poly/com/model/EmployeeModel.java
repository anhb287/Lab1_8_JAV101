package poly.com.model; 

import java.sql.Date;
import java.math.BigDecimal;

public class EmployeeModel {
    
    private int maNhanVien;
    private String ten;
    private String ho;
    private String email;
    private String soDienThoai;
    private Date ngayVaoLam; 
    private String chucDanh;
    private BigDecimal luong; 
    private Integer maQuanLy; 
    private String idPhongBan; 

    // Constructor Rỗng
    public EmployeeModel() {
    }

    // Constructor Đầy Đủ Tham Số 
    public EmployeeModel(int maNhanVien,
    		String ten, 
    		String ho, 
    		String email, 
    		String soDienThoai, 
    		Date ngayVaoLam,        
    		String chucDanh,
    		BigDecimal luong, 
    		Integer maQuanLy, 
    		String idPhongBan) {
        this.maNhanVien = maNhanVien;
        this.ten = ten;
        this.ho = ho;
        this.email = email;
        this.soDienThoai = soDienThoai;
        this.ngayVaoLam = ngayVaoLam;
        this.chucDanh = chucDanh;
        this.luong = luong;
        this.maQuanLy = maQuanLy;
        this.idPhongBan = idPhongBan;
    }

    // --- Getter và Setter ---
    public int getMaNhanVien() { 
    	return maNhanVien; 
    	}
    public void setMaNhanVien(int maNhanVien) { 
    	this.maNhanVien = maNhanVien; 
    	}
    public String getTen() { 
    	return ten; 
    	}
    public void setTen(String ten) { 
    	this.ten = ten; 
    	}
    public String getHo() { 
    	return ho; }
    public void setHo(String ho) { 
    	this.ho = ho; 
    	}
    public String getEmail() { 
    	return email; }
    public void setEmail(String email) { 
    	this.email = email; 
    	}
    public String getSoDienThoai() { 
    	return soDienThoai; 
    	}
    public void setSoDienThoai(String soDienThoai) { 
    	this.soDienThoai = soDienThoai;
    	}
    public Date getNgayVaoLam() { 
    	return ngayVaoLam; 
    }
    public void setNgayVaoLam(Date ngayVaoLam) { 
    	this.ngayVaoLam = ngayVaoLam;
    	}
    public String getChucDanh() { 
    	return chucDanh; 
    	}
    public void setChucDanh(String chucDanh) {
    	this.chucDanh = chucDanh; 
    	}
    public BigDecimal getLuong() { 
    	return luong; 
    	}
    public void setLuong(BigDecimal luong) { 
    	this.luong = luong; 
    	}
    public Integer getMaQuanLy() { 
    	return maQuanLy; 
    	}
    public void setMaQuanLy(Integer maQuanLy) { 
    	this.maQuanLy = maQuanLy; 
    	}
    public String getIdPhongBan() { 
    	return idPhongBan; 
    	}
    public void setIdPhongBan(String idPhongBan) { 
    	this.idPhongBan = idPhongBan; 
    	}
}