package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.service.ShopService;
import model.vo.Member;
import model.vo.Shop;

/**
 * Servlet implementation class SortShopServlet
 */
@WebServlet("/sort.go")
public class SortShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SortShopServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Integer> myShop = new ArrayList<>();

		HttpSession session = request.getSession(false);
		Member m = (Member) session.getAttribute("member");
		String[] myArr = null;

		if (m != null) {

			System.out.println("현재 즐겨찾기는 ? : " + m.getMyShop());
			if (m.getMyShop() != null) {
				myArr = m.getMyShop().split(",");
				for (int i = 0; i < myArr.length; i++) {
					if (!myArr[i].equals("")) {
						myShop.add(Integer.parseInt(myArr[i]));
					}

				}
			}
		}
		System.out.println("String myShop 은 ? : " + myShop);
		String sort = request.getParameter("sort");
		String category = request.getParameter("category");

		String sortCol = "";
		String cateCode = "";

		System.out.println("정렬 기준 : " + sort);
		System.out.println("sort category : " + category);

		ShopService ss = new ShopService();

		switch (sort) {
		case "point":
			sortCol = "point";
			break;
		case "min":
			sortCol = "minPrice";
			break;
		case "time":
			sortCol = "dvTime";
			break;
		}

		switch (category) {
		case "한식":
			cateCode = "KO";
			break;
		case "중식":
			cateCode = "CH";
			break;
		case "족발":
			cateCode = "ZOK";
			break;
		case "치킨":
			cateCode = "CK";
			break;
		case "피자":
			cateCode = "PZ";
			break;
		case "즐찾":
			cateCode = "MY"; // 즐겨찾기는 더 생각해보깅
			break;

		}

		System.out.println("sortColumn : " + sortCol);

		ArrayList<Shop> sList = null;
		
		if(!cateCode.equals("MY")) {
			sList =  ss.sortShop(sortCol, cateCode); 
		}
		else {
			sList = ss.sortMyShop(sortCol , myShop);
		}
				
				
		String page = "";

		if (sList != null) {
			System.out.println("sort Servlet shopList : " + sList);
			page = "shopList.jsp";
			request.setAttribute("shopList", sList);

		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "식당리스트 불러오기 실패");

		}

		request.getRequestDispatcher(page).forward(request, response);

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