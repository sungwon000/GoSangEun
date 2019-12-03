package model.vo;

import java.io.Serializable;

public class Member implements Serializable {

   /**
   * 
   */
   private static final long serialVersionUID = 1L;

   private int USER_NO;
   private String USER_ID;
   private String RANK;
   private String USER_NAME;
   private String USER_NICKNAME;
   private String USER_PASSWORD;
   private String USER_PHONE;
   private String USER_EMAIL;
   private String USER_ADDRESS;
   private String USER_CARD;
   private String myShop;

   // 기본 생성자
   public Member() {
   }

   // 로그인용
   public Member(String uSER_ID, String uSER_PASSWORD) {
      super();
      USER_ID = uSER_ID;
      USER_PASSWORD = uSER_PASSWORD;
   }

   // 카드없음
   public Member(String uSER_NAME, String uSER_ID, String uSER_NICKNAME, String uSER_PASSWORD, String uSER_PHONE,
         String uSER_EMAIL, String uSER_ADDRESS) {
      super();
      USER_NAME = uSER_NAME;
      USER_ID = uSER_ID;
      USER_NICKNAME = uSER_NICKNAME;
      USER_PASSWORD = uSER_PASSWORD;
      USER_PHONE = uSER_PHONE;
      USER_EMAIL = uSER_EMAIL;
      USER_ADDRESS = uSER_ADDRESS;
   }

   // 카드있음
   public Member(String uSER_NAME, String uSER_ID, String uSER_NICKNAME, String uSER_PASSWORD, String uSER_PHONE,
         String uSER_EMAIL, String uSER_ADDRESS, String uSER_CARD) {
      super();
      USER_NAME = uSER_NAME;
      USER_ID = uSER_ID;
      USER_NICKNAME = uSER_NICKNAME;
      USER_PASSWORD = uSER_PASSWORD;
      USER_PHONE = uSER_PHONE;
      USER_EMAIL = uSER_EMAIL;
      USER_ADDRESS = uSER_ADDRESS;
      USER_CARD = uSER_CARD;
   }

   // 회원 전체 데이터 가져오기 위한 생성자
   public Member(int uSER_NO, String uSER_ID, String rANK, String uSER_NAME, String uSER_NICKNAME,
         String uSER_PASSWORD, String uSER_PHONE, String uSER_EMAIL, String uSER_ADDRESS, String uSER_CARD,
         int sHOP_ID) {
      super();
      USER_NO = uSER_NO;
      USER_ID = uSER_ID;
      RANK = rANK;
      USER_NAME = uSER_NAME;
      USER_NICKNAME = uSER_NICKNAME;
      USER_PASSWORD = uSER_PASSWORD;
      USER_PHONE = uSER_PHONE;
      USER_EMAIL = uSER_EMAIL;
      USER_ADDRESS = uSER_ADDRESS;
      USER_CARD = uSER_CARD;
      this.myShop = myShop;
   }

   public int getUSER_NO() {
      return USER_NO;
   }

   public void setUSER_NO(int uSER_NO) {
      USER_NO = uSER_NO;
   }

   public String getUSER_ID() {
      return USER_ID;
   }

   public void setUSER_ID(String uSER_ID) {
      USER_ID = uSER_ID;
   }

   public String getRANK() {
      return RANK;
   }

   public void setRANK(String rANK) {
      RANK = rANK;
   }

   public String getUSER_NAME() {
      return USER_NAME;
   }

   public void setUSER_NAME(String uSER_NAME) {
      USER_NAME = uSER_NAME;
   }

   public String getUSER_NICKNAME() {
      return USER_NICKNAME;
   }

   public void setUSER_NICKNAME(String uSER_NICKNAME) {
      USER_NICKNAME = uSER_NICKNAME;
   }

   public String getUSER_PASSWORD() {
      return USER_PASSWORD;
   }

   public void setUSER_PASSWORD(String uSER_PASSWORD) {
      USER_PASSWORD = uSER_PASSWORD;
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

   public String getUSER_ADDRESS() {
      return USER_ADDRESS;
   }

   public void setUSER_ADDRESS(String uSER_ADDRESS) {
      USER_ADDRESS = uSER_ADDRESS;
   }

   public String getUSER_CARD() {
      return USER_CARD;
   }

   public void setUSER_CARD(String uSER_CARD) {
      USER_CARD = uSER_CARD;
   }

   public String getMyShop() {
		return myShop;
	}

	public void setMyShop(String myShop) {
		this.myShop = myShop;
	}

   @Override
   public String toString() {
      return "Member [USER_NO=" + USER_NO + ", USER_NAME=" + USER_NAME + ", RANK=" + RANK + ", USER_ID=" + USER_ID
            + ", USER_NICKNAME=" + USER_NICKNAME + ", USER_PASSWORD=" + USER_PASSWORD + ", USER_PHONE=" + USER_PHONE
            + ", USER_EMAIL=" + USER_EMAIL + ", USER_ADDRESS=" + USER_ADDRESS + ", USER_CARD=" + USER_CARD
            +  ", myShop=" + myShop  + "]";
   }

}