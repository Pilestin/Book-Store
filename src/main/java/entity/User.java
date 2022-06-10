package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

// User için model sınıfımız ve hibernate entityleri

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name = "user_id")
	private int userID;
	@Column(length = 100, name = "user_name")
	private String userName;
	@Column(length = 100, name = "user_email")
	private String userEmail;
	@Column(length = 100, name = "user_password")
	private String userPassword;
	@Column(length = 100, name = "user_phone")
	private String userPhone;
	@Column(length = 1500, name = "user_photo")
	private String userPhoto;
	@Column(length = 1500, name = "user_address")
	private String userAddress;
    @Column(name="user_type")
    private String userType;

	public User(int userID, String userName, String userEmail, String userPassword, String userPhone, String userPhoto,
			String userAddress, String userType) {
		this.userID = userID;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPhoto = userPhoto;
		this.userAddress = userAddress;
		this.userType=userType;
	}

	public User(String userName, String userEmail, String userPassword, String userPhone, String userPhoto,
			String userAddress, String userType) {
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPhoto = userPhoto;
		this.userAddress = userAddress;
		this.userType=userType;
	}

	public User() {

	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    

	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userPhoto=" + userPhoto + ", userAddress="
				+ userAddress + "]";
	}

}
