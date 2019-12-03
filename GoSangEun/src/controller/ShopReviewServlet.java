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

/**
 * Insert문 리뷰
 */
@WebServlet("/Review.s")
public class ShopReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int shopId = Integer.parseInt(request.getParameter("shopId"));
		String Info = request.getParameter("Info");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		int point = Integer.parseInt(request.getParameter("Point"));
		
		int result = new ShopService().insertReview(shopId,Info,userId,userName,point);
		
		if(result > 0) {
			System.out.println("리뷰작성 성공");
			response.sendRedirect("/GoSangEun/Menu.s?shopId="+shopId);
		}else {
			System.out.println("리뷰작성 실패!");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
