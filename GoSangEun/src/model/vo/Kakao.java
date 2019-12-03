package model.vo;

import java.io.Serializable;

public class Kakao implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6889553577030709840L;
	
	private int userId;
	private String USER_PHONE;
	private String USER_EMAIL;
	private String shopName;
	private int totalPrice;
	
	public Kakao() {}

	public Kakao(int userId, String uSER_PHONE, String uSER_EMAIL, String shopName, int totalPrice) {
		super();
		this.userId = userId;
		USER_PHONE = uSER_PHONE;
		USER_EMAIL = uSER_EMAIL;
		this.shopName = shopName;
		this.totalPrice = totalPrice;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUSER_PHONE() {
		return USER_PHONE;
	}

	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}

	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}

	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Kakao [userId=" + userId + ", USER_PHONE=" + USER_PHONE + ", USER_EMAIL=" + USER_EMAIL + ", shopName="
				+ shopName + ", totalPrice=" + totalPrice + "]";
	}

	

}
