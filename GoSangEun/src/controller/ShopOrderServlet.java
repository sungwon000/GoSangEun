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
import model.vo.ShopOrder;


/**
 * 장바구니 추가 서블릿
 */
@WebServlet("/Order.s")
public class ShopOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShopOrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int shopId = Integer.parseInt(request.getParameter("shopId"));
		String userId = request.getParameter("userId");
		int menuNo = Integer.parseInt(request.getParameter("menuNo"));
		int count = Integer.parseInt(request.getParameter("oCount"));
		int Sum = Integer.parseInt(request.getParameter("oSum")) * count;

		HttpSession session = request.getSession();
		int result = 0;
		
		if( userId != null ) {
			int groupNum = new ShopService().selectGroupNum(userId);
			result = new ShopService().insertShopOrder(shopId, userId, menuNo, count, Sum,groupNum);
		}else {
			int nonGroupNum = 1;
			result = new ShopService().insertShopOrder(shopId, menuNo, count, Sum, nonGroupNum);
		}

		if (result > 0) {
			ArrayList<ShopOrder> so = new ShopService().selectShopOrderList(userId); // 새로고침용
			ArrayList<ShopOrder> nSo = new ShopService().selectShopOrderList(); // 비회원용
			session.setAttribute("ShopOrder", so);
			session.setAttribute("NonShopOrder", nSo);
		} else {
			System.out.println("장바구니 담기 실패!");
		}
		response.sendRedirect("Menu.s?shopId=" + shopId);

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
