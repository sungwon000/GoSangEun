package model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import model.vo.Kakao;
import model.vo.ShopOrder;


/**
 * 
 * 그 외 Dao
 * @author heera
 *
 */
public class GoDao {

   private Properties prop;
   
   public GoDao() {
      
      prop = new Properties();
      
      String filePath = GoDao.class.getResource("/config/go-query.properties").getPath();
      
      try {
         prop.load(new FileReader(filePath));
      }
      catch(IOException e) {
         e.printStackTrace();
      }
   }

   public int insertOrder(Connection con, ShopOrder sod) {
	   int result = 0;
      
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertOrder");
      
      try {
         pstmt.setInt(1, sod.getOrderId());
         pstmt.setInt(2, sod.getShopId());
         pstmt.setString(3, sod.getUserId());
         pstmt.setInt(4, sod.getMenuNo());
         pstmt.setInt(5, sod.getOrderCount());
         pstmt.setInt(6, sod.getOrderSum());
         pstmt.setString(7, sod.getOrderInfo());
         pstmt.setString(8, sod.getOrderAddr());
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   
   }

	public ArrayList<ShopOrder> selectMemberCart(Connection con, String userId) {
		
		ArrayList<ShopOrder> soList = new ArrayList<>();
		ShopOrder so = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberCart");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				so = new ShopOrder();
				
				so.setUserId(rset.getString("USER_ID"));
				so.setShopName(rset.getString("SHOP_NAME"));
				so.setMenuName(rset.getString("MENU_NAME"));
				so.setOrderCount(rset.getInt("ORDER_COUNT"));
				so.setOrderSum(rset.getInt("ORDER_SUM"));
				so.setOrderInfo(rset.getString("ORDER_INFO"));
				so.setDvPrice(rset.getInt("SHOP_DVPRICE"));
				
				soList.add(so);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(pstmt);
		}
		
		
		return soList;
	}

//	updateOrder=UPDATE SHOP_ORDER SET ORDER_INFO = ? , ORDER_CHECK = 'Y' , DV_ADDRESS = ? WHERE USER_ID = ?	
	
	public int updateOrder(Connection con, ShopOrder so, String userId, String orderInfo, String orderCheck, String addr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateOrder");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, so.getOrderInfo());
			pstmt.setString(2, so.getOrderAddr());
			pstmt.setString(3, userId); 
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
	}
	
	
}