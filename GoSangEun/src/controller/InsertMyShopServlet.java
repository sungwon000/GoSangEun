package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.ShopService;
import model.vo.Member;

/**
 * Servlet implementation class InsertMyShopServlet
 */
@WebServlet("/myInsert.go")
public class InsertMyShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertMyShopServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		Member m = (Member) session.getAttribute("member");

		String[] myArr = null;
		ArrayList myList = new ArrayList();

		int shopId = Integer.parseInt(request.getParameter("shopId"));

		int userId = -1;
		String myShop = "";
		String str = "";
		System.out.println("즐겨찾기 서블릿 : " + shopId);

		if (m != null) {
			System.out.println("즐겨찾기 서블릿 : " + m);
			userId = m.getUSER_NO();
			System.out.println("즐겨찾기 서블릿 : " + userId);
			myShop = m.getMyShop();

			System.out.println("즐겨찾기 서블릿 : " + myShop);

			

			if (myShop == null) {
				System.out.println("1");
				m.setMyShop("");
				myShop = "";
			}
			else {
				myArr = myShop.split(",");
	
				for (int i = 0; i < myArr.length; i++) {
					if (!myArr[i].equals("")) {
						myList.add(Integer.parseInt(myArr[i]));
					}
				}
			}
			System.out.println("myList : " + myList + "size : " + myList.size());
			System.out.println("2");
			if (myList.contains(shopId)) {
				System.out.println("해당되는게 있음");
				myList.remove((Integer) shopId);
				System.out.println("remove가 되나요");
				for (int i = 0; i < myList.size(); i++) {
					System.out.println(myList.get(i));
					str += myList.get(i) + ",";
				}
				System.out.println("str1 : " + str);
			} else {
				str = myShop + shopId + ",";
			}
			
		
			System.out.println("str 은 ? : " + str);
			int result = new ShopService().updateMyshop(userId, str);
			if (result > 0) {
				System.out.println("즐겨찾기 update 성공!");
				m.setMyShop(str);
				response.getWriter().print("즐겨찾기 성공해써!");

			} else {
				System.out.println("즐겨찾기 update 실패!");
			}

			// 중복되는 shopId 일때는 즐겨찾기 목록에서 삭제
			/*
			 * for(int i = 0; i < myArr.length ; i++) { if(shopId ==
			 * Integer.parseInt(myArr[i])) {
			 * 
			 * } }
			 */

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
