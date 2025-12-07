package Controller;

import jakarta.servlet.http.HttpServlet;

// Yêu cầu: getters/setters và constructor mặc định
public class User {

    private String fullname; 
    private boolean gender; 
    private String country; 

    // Constructor không tham số (Bắt buộc cho JavaBean)
    public User() { }

    // Getters và Setters (Yêu cầu Lab)
    public String getFullname() {
        return fullname;
    }
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    // Đối với boolean, getter nên là isGender() hoặc getGender()
    public boolean isGender() {
        return gender;
    }
    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
}