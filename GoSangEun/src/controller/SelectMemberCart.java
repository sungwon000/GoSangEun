package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.GoService;
import model.vo.Member;
import model.vo.ShopOrder;

/**
 * Servlet implementation class SelectMemberOrderList
 */
@WebServlet("/sCart.go")
public class SelectMemberCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMemberCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getUSER_ID();
		System.out.println("userId 는 ? : " + userId);
		ArrayList<ShopOrder> soList = new GoService().selectMemberCart(userId);
		
		String page = "";
		
		if(soList != null) {
			System.out.println("사용자 MemberOrder 불러오기 성공!");
			System.out.println("SelectMemberCart servlet : " + soList);
			session.setAttribute("soList", soList);
			page = "payment.jsp";
		}
		else {
			System.out.println("사용자 MemberOrder 불러오기 실패!");
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
