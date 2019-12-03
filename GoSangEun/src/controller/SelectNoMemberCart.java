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
 * Servlet implementation class SelectNoMemberCart
 */
@WebServlet("/noMcart.go")
public class SelectNoMemberCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoMemberCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("비회원 주문 카트 불러오기");
		HttpSession session = request.getSession(false);
		
		
		ArrayList<ShopOrder> noList = new ShopService().selectNoCart();
		
		String page = "";
		
		if(noList != null) {
			System.out.println("비회원 카트 불러오기 성공!");
			session.setAttribute("noList", noList);
			System.out.println("noList : " + noList);
			page = "payment.jsp";
		}
		else {
			System.out.println("비회원 카트 불러오기 실패!");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
