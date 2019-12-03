package model.vo;

import java.io.Serializable;

public class ShopOrder implements Serializable {

	/**
	 * menuName 추가
	 */
	private static final long serialVersionUID = 2095843090908870850L;

	private int orderId;
	private int shopId;
	private String userId;
	private int menuNo;
	private String menuName;
	private int orderCount;
	private int orderSum;
	private String orderInfo;
	private String orderCheck;
	private String orderAddr;
	private String shopName;
	private int dvPrice ;

	public ShopOrder() {
		super();
	}
	
	
	public ShopOrder(int orderId, int shopId, String userId, int menuNo, String menuName, int orderCount, int orderSum,
			String orderCheck, String orderAddr) {
		super();
		this.orderId = orderId;
		this.shopId = shopId;
		this.userId = userId;
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.orderCount = orderCount;
		this.orderSum = orderSum;
		this.orderCheck = orderCheck;
		this.orderAddr = orderAddr;
	}


	public ShopOrder(int orderId, int shopId, int menuNo, String menuName, int orderCount, int orderSum,
			String orderInfo, String orderCheck, String orderAddr) {
		super();
		this.orderId = orderId;
		this.shopId = shopId;
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.orderCount = orderCount;
		this.orderSum = orderSum;
		this.orderInfo = orderInfo;
		this.orderCheck = orderCheck;
		this.orderAddr = orderAddr;
	}


	public ShopOrder(int orderId, int shopId, String userId, int menuNo, String menuName, int orderCount, int orderSum,
			String orderInfo, String orderCheck, String orderAddr) {
		super();
		this.orderId = orderId;
		this.shopId = shopId;
		this.userId = userId;
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.orderCount = orderCount;
		this.orderSum = orderSum;
		this.orderInfo = orderInfo;
		this.orderCheck = orderCheck;
		this.orderAddr = orderAddr;
	}


	public ShopOrder(int orderId, int shopId, int menuNo, String menuName, int orderCount, int orderSum,
			String orderCheck, String orderAddr) {
		super();
		this.orderId = orderId;
		this.shopId = shopId;
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.orderCount = orderCount;
		this.orderSum = orderSum;
		this.orderCheck = orderCheck;
		this.orderAddr = orderAddr;
	}
	

	public ShopOrder(int orderId, int shopId, String userId, int menuNo, String menuName, int orderCount, int orderSum,
			String orderInfo, String orderCheck, String orderAddr, String shopName, int dvPrice) {
		super();
		this.orderId = orderId;
		this.shopId = shopId;
		this.userId = userId;
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.orderCount = orderCount;
		this.orderSum = orderSum;
		this.orderInfo = orderInfo;
		this.orderCheck = orderCheck;
		this.orderAddr = orderAddr;
		this.shopName = shopName;
		this.dvPrice = dvPrice;
	}


	public int getOrderId() {
		return orderId;
	}



	public void setOrderId(int orderId) {
		this.orderId = orderId;
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



	public int getMenuNo() {
		return menuNo;
	}



	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}



	public String getMenuName() {
		return menuName;
	}



	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}



	public int getOrderCount() {
		return orderCount;
	}



	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}



	public int getOrderSum() {
		return orderSum;
	}



	public void setOrderSum(int orderSum) {
		this.orderSum = orderSum;
	}



	public String getOrderInfo() {
		return orderInfo;
	}



	public void setOrderInfo(String orderInfo) {
		this.orderInfo = orderInfo;
	}



	public String getOrderCheck() {
		return orderCheck;
	}



	public void setOrderCheck(String orderCheck) {
		this.orderCheck = orderCheck;
	}



	public String getOrderAddr() {
		return orderAddr;
	}



	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}


	public String getShopName() {
		return shopName;
	}


	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
	


	public int getDvPrice() {
		return dvPrice;
	}


	public void setDvPrice(int dvPrice) {
		this.dvPrice = dvPrice;
	}


	@Override
	public String toString() {
		return "ShopOrder [orderId=" + orderId + ", shopId=" + shopId + ", userId=" + userId + ", menuNo=" + menuNo
				+ ", menuName=" + menuName + ", orderCount=" + orderCount + ", orderSum=" + orderSum + ", orderInfo="
				+ orderInfo + ", orderCheck=" + orderCheck + ", orderAddr=" + orderAddr + ", shopName=" + shopName
				+ ", dvPrice=" + dvPrice + "]";
	}


	



	
	
}