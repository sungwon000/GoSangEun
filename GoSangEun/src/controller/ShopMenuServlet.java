package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ShopService;
import model.vo.Review;
import model.vo.Shop;
import model.vo.ShopMenu;

/**
 * Servlet implementation class ShopMenuServlet
 */
@WebServlet("/Menu.s")
public class ShopMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShopMenuServlet() {
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

		Shop s = new ShopService().selectShop(shopId);

		if (s != null) {
			ArrayList<ShopMenu> list = new ShopService().selectShopMenu(shopId);
			ArrayList<Review> rlist = new ShopService().selectReview(shopId);
			if (rlist != null)
				s = new ShopService().selectShop(shopId);
			if (list != null) {
				request.setAttribute("shop", s);
				request.setAttribute("list", list);
				request.setAttribute("rlist", rlist);
				request.getRequestDispatcher("about.jsp").forward(request, response);
			} else {
				System.out.println("식당메뉴 조회실패!");
			}
		} else {
			System.out.println("식당조회 실패!");
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
