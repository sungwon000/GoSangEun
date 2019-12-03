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
 * Servlet implementation class ShopNonOrderSelectServlet
 */
@WebServlet("/NonSelect.s")
public class ShopNonOrderSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	

	@Override
	public void init() throws ServletException {
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShopNonOrderSelectServlet() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ArrayList<ShopOrder> list = new ShopService().selectShopOrderList();
		session.setAttribute("NonShopOrder", list);
		response.sendRedirect("index.jsp");
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
