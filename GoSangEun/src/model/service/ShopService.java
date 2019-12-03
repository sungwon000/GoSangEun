package model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import model.dao.ShopDao;
import model.vo.Review;
import model.vo.Shop;
import model.vo.ShopMenu;
import model.vo.ShopOrder;

/**
 * 
 * 식당리스트 , 식당 상세 페이지 부분 Service
 * 
 * @author heera
 *
 */
public class ShopService {

	private Connection con = null;
	private ShopDao sDao = new ShopDao();

	/**
	 * @현우
	 * @param shopId
	 * @return
	 */
	public Shop selectShop(int shopId) {

		con = getConnection();

		Shop s = sDao.selectShop(con, shopId);

		close(con);

		return s;
	}

	/**
	 * @현우
	 * @param shopId
	 * @return
	 */
	public ArrayList<ShopMenu> selectShopMenu(int shopId) {
		con = getConnection();

		ArrayList<ShopMenu> list = sDao.selectShopMenu(con, shopId);

		close(con);

		return list;
	}

	/**
	 * @현우
	 * @param shopId
	 * @return
	 */
	public ArrayList<Review> selectReview(int shopId) {
		con = getConnection();

		ArrayList<Review> list = sDao.selectReview(con, shopId);

		if (list != null) {
			int result = sDao.updateShopPoint(con, shopId);

			if (result > 0) {
				commit(con);
			} else {
				rollback(con);
				System.out.println("별점 업데이트 실패!");
			}
		}

		close(con);

		return list;
	}

	/**
	 * @수진
	 * @param category
	 * @return
	 */
	public ArrayList<Shop> selectShopList(String cateCode) {

		Connection conn = getConnection();

		ArrayList<Shop> sList = sDao.selectShopList(conn, cateCode);

		close(conn);

		return sList;

	}

	/**
	 * @수진
	 * @param sortCol
	 * @return
	 */
	public ArrayList<Shop> sortShop(String sortCol, String cateCode) {

		Connection conn = getConnection();

		ArrayList<Shop> sList = sDao.sortShop(conn, sortCol, cateCode);

		close(conn);

		return sList;
	}

	public int insertReview(int shopId, String info, String userId, String userName, int point) {
		con = getConnection();

		int result = sDao.insertReview(con, shopId, info, userId, userName, point);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public int updateReview(int no, String info, int point) {
		con = getConnection();

		int result = sDao.updateReview(con, no, info, point);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public int deleteReview(int no) {
		con = getConnection();

		int result = sDao.deleteReview(con, no);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public ArrayList<ShopOrder> selectShopOrderList(String uSER_ID) {
		con = getConnection();

		ArrayList<ShopOrder> list = sDao.selectShopOrderList(con, uSER_ID);

		close(con);

		return list;
	}

	public int updateMyshop(int userId, String str) {

		Connection conn = getConnection();

		int result = sDao.updateMyshop(conn, userId, str);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public ArrayList<Shop> selectMyShop(ArrayList<Integer> myShop) {

		Connection conn = getConnection();

		ArrayList<Shop> sList = sDao.selectMyShop(conn, myShop);

		close(conn);

		return sList;
	}

	public ArrayList<Shop> sortMyShop(String sortCol, ArrayList<Integer> myShop) {

		Connection conn = getConnection();

		ArrayList<Shop> sList = sDao.sortMyShop(conn, sortCol, myShop);

		close(conn);

		return sList;
	}

	public int deleteShopOrder(int orderNo, String userId) {
		con = getConnection();
		int result = sDao.deleteShopOrder(con, orderNo,userId);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);
		return result;
	}

	public int insertShopOrder(int shopId, String userId, int menuNo, int count, int sum, int groupNum) {
		con = getConnection();
		int result = sDao.insertShopOrder(con, shopId, userId, menuNo, count, sum, groupNum);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public int selectGroupNum(String userId) {
		con = getConnection();
		int result = sDao.selectGroupNum(con, userId);

		close(con);
		return result;
	}

	public int insertShopOrder(int shopId, int menuNo, int count, int sum, int nonGroupNum) {
		con = getConnection();
		int result = sDao.insertShopOrder(con, shopId, menuNo, count, sum, nonGroupNum);
		
		if (result > 0 )
			commit(con);
		else
			rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<ShopOrder> selectShopOrderList() {
		con = getConnection();
		ArrayList<ShopOrder> list = sDao.selectShopOrderList(con);
		close(con);
		return list;
	}

	public int deleteShopOrder(int orderNo) {
		con = getConnection();
		int result = sDao.deleteShopOrder(con, orderNo);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);
		return result;
	}

	public ArrayList<ShopOrder> selectNoCart() {
		
		Connection conn = getConnection();
		
		ArrayList<ShopOrder> noList = new ShopDao().selectNoCart(conn);
		
		close(conn);
		
		return noList;
	}
}