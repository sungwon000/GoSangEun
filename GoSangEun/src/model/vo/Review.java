package model.vo;

import java.io.Serializable;

public class Review implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4988112199249968035L;

	public Review() {
		super();
	}

	private int no;
	private int shopId;
	private String userId;
	private String userName;
	private String info;
	private int point;

	public Review(int no, int shopId, String userId, String userName, String info, int point) {
		super();
		this.no = no;
		this.shopId = shopId;
		this.userId = userId;
		this.userName = userName;
		this.info = info;
		this.point = point;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "Review [no=" + no + ", shopId=" + shopId + ", userId=" + userId + ", userName=" + userName + ", info="
				+ info + ", point=" + point + "]";
	}

}
