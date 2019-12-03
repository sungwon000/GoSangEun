package model.vo;

import java.io.Serializable;

public class OrderInfo implements Serializable{

   /**
    * 
    */
   private static final long serialVersionUID = 1L;
   
   private int menuNo ;
   private int count ;
   
   public OrderInfo() {
      
   }
   
   public OrderInfo(int menuNo, int count) {
      super();
      this.menuNo = menuNo;
      this.count = count;
   }

   public int getMenuNo() {
      return menuNo;
   }

   public void setMenuNo(int menuNo) {
      this.menuNo = menuNo;
   }

   public int getCount() {
      return count;
   }

   public void setCount(int count) {
      this.count = count;
   }

   @Override
   public String toString() {
      return "OrderInfo [menuNo=" + menuNo + ", count=" + count + "]";
   }
   
   

}