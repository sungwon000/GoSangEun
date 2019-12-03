package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.ShopService;

/**
 * Servlet implementation class ShopReviewUpdateServlet
 */
@WebServlet("/ReviewUpdate.s")
public class ShopReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("No"));
		String info = request.getParameter("Info");
		int point = Integer.parseInt(request.getParameter("Point"));
		int shopId = Integer.parseInt(request.getParameter("shopId"));
		
		int result = new ShopService().updateReview(no,info,point);
		
		if(result > 0) {
			response.sendRedirect("/GoSangEun/Menu.s?shopId="+shopId);
		}else {
			System.out.println("리뷰 수정 실패!");
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
