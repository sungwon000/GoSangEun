package model.vo;

import java.io.Serializable;

public class Shop implements Serializable{

   /**
    * 
    */
   private static final long serialVersionUID = 1L;
   
   private int shopId;       // 식당번호 
   private String categoryId;   // 카테고리 분류 코드
   private String shopName ;   // 식당이름
   private String shopLogo ;   // 식당 사진 경로
   private String shopPhone ;   // 식당 전화번호
   private String shopTime ;   // 식당 운영시간
   private String shopInfo ;   // 식당 상세설명
   private String shopAddr ;   // 식당 주소
   private double point ;      // 식당 별점
   private   int minPrice ;       // 최소 주문 금액
   private int dvTime ;       // 배달시간
   private int dvPrice ;       // 배달료
   
   public Shop() {
      
   }

   public Shop(int shopId, String categoryId, String shopName, String shopLogo, String shopPhone, String shopTime,
         String shopInfo, String shopAddr, double point, int minPrice, int dvTime, int dvPrice) {
      super();
      this.shopId = shopId;
      this.categoryId = categoryId;
      this.shopName = shopName;
      this.shopLogo = shopLogo;
      this.shopPhone = shopPhone;
      this.shopTime = shopTime;
      this.shopInfo = shopInfo;
      this.shopAddr = shopAddr;
      this.point = point;
      this.minPrice = minPrice;
      this.dvTime = dvTime;
      this.dvPrice = dvPrice;
   }

   public int getShopId() {
      return shopId;
   }

   public void setShopId(int shopId) {
      this.shopId = shopId;
   }

   public String getCategoryId() {
      return categoryId;
   }

   public void setCategoryId(String categoryId) {
      this.categoryId = categoryId;
   }

   public String getShopName() {
      return shopName;
   }

   public void setShopName(String shopName) {
      this.shopName = shopName;
   }

   public String getShopLogo() {
      return shopLogo;
   }

   public void setShopLogo(String shopLogo) {
      this.shopLogo = shopLogo;
   }

   public String getShopPhone() {
      return shopPhone;
   }

   public void setShopPhone(String shopPhone) {
      this.shopPhone = shopPhone;
   }

   public String getShopTime() {
      return shopTime;
   }

   public void setShopTime(String shopTime) {
      this.shopTime = shopTime;
   }

   public String getShopInfo() {
      return shopInfo;
   }

   public void setShopInfo(String shopInfo) {
      this.shopInfo = shopInfo;
   }

   public String getShopAddr() {
      return shopAddr;
   }

   public void setShopAddr(String shopAddr) {
      this.shopAddr = shopAddr;
   }

   public double getPoint() {
      return point;
   }

   public void setPoint(double point) {
      this.point = point;
   }

   public int getMinPrice() {
      return minPrice;
   }

   public void setMinPrice(int minPrice) {
      this.minPrice = minPrice;
   }

   public int getDvTime() {
      return dvTime;
   }

   public void setDvTime(int dvTime) {
      this.dvTime = dvTime;
   }

   public int getDvPrice() {
      return dvPrice;
   }

   public void setDvPrice(int dvPrice) {
      this.dvPrice = dvPrice;
   }

   @Override
   public String toString() {
      return "Shop [shopId=" + shopId + ", categoryId=" + categoryId + ", shopName=" + shopName + ", shopLogo="
            + shopLogo + ", shopPhone=" + shopPhone + ", shopTime=" + shopTime + ", shopInfo=" + shopInfo
            + ", shopAddr=" + shopAddr + ", point=" + point + ", minPrice=" + minPrice + ", dvTime=" + dvTime
            + ", dvPrice=" + dvPrice + "]";
   }


   
   
   
}