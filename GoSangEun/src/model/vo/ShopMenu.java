package model.vo;

import java.io.Serializable;

public class ShopMenu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9001365691493623424L;

	private int No;
	private int shopId;
	private String Code;
	private String Name;
	private int Price;
	private String info;

	public ShopMenu() {
		super();
	}

	public ShopMenu(int no, int shopId, String code, String name, int price, String info) {
		super();
		No = no;
		this.shopId = shopId;
		Code = code;
		Name = name;
		Price = price;
		this.info = info;
	}

	public ShopMenu(int no, int shopId, String code, String name, int price) {
		super();
		No = no;
		this.shopId = shopId;
		Code = code;
		Name = name;
		Price = price;
	}

	public int getNo() {
		return No;
	}

	public void setNo(int no) {
		No = no;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		Code = code;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "ShopMenu [No=" + No + ", shopId=" + shopId + ", Code=" + Code + ", Name=" + Name + ", Price=" + Price
				+ ", info=" + info + "]";
	}

}
