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
import model.vo.Kakao;
import model.vo.Member;
import model.vo.OrderInfo;
import model.vo.ShopOrder;


/**
 * Servlet implementation class InsertOrderServlet
 */
@WebServlet("/oUpdate.go")
public class UpdateOrderServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderServlet() {
        super();
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  HttpSession session = request.getSession(false);
      
	  System.out.println("카카오 또는 현금 결제 성공!");
	  
	  ShopOrder so = new ShopOrder();
	  
	  Member m = (Member)session.getAttribute("member");
	  String userId = m.getUSER_ID();
	  System.out.println("userID : "+userId);
	  
	  String phone = request.getParameter("phone");
	  String shopName = request.getParameter("shopName");
	  int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	  String addr = request.getParameter("newAddr");
	  String orderInfo = request.getParameter("orderInfo");
	  String orderCheck = request.getParameter("orderCheck");
	  String pay = request.getParameter("pay");
	  
	  System.out.println("UpdateOrder 서블릿 !");
	  System.out.println("phone : " + phone);
	  System.out.println("shopName : " + shopName);
	  System.out.println("totalPrice : " + totalPrice);
	  System.out.println("addr : " + addr);
	  System.out.println("orderInfo : " + orderInfo);
	  System.out.println("pay : " + pay);

	  // Service,dao pay 추가!!!!!!!!!
	  int result = new GoService().updateOrder(so,userId,orderInfo,orderCheck,addr);
	  System.out.println("결제완료 result : "+result);
	  
	  if(result > 0) {
		  response.sendRedirect("ordercompt.jsp");
	  }else {
		  request.setAttribute("msg", "주문 완료 실패");
		  request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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