package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.GoService;
import model.vo.OrderInfo;
import model.vo.ShopOrder;


/**
 * Servlet implementation class InsertOrderServlet
 */
@WebServlet("/oInsert.go")
public class InsertOrderServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertOrderServlet() {
        super();
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // DEFAULT 주소 (DB) / 새로 추가시 새로 입력하는 주소(ORDER_ADDR)
      
      // ShopOrder VO
      int orderId = (int)((Math.random() * 1000000000) + 1);
      int shopId = Integer.parseInt(request.getParameter("shopId"));
      String userId = request.getParameter("userId");
      int menuNo = Integer.parseInt(request.getParameter("menuNo"));
      String menuName = request.getParameter("menuName");
      int orderCount = Integer.parseInt(request.getParameter("orderCount")); // 메뉴개수
//      String orderStr = "";
//      ArrayList<OrderInfo> oList = (ArrayList<OrderInfo>)request.getAttribute("oList");
//      for(int i = 0 ; i < oList.size() ; i++) {
//         orderStr += oList.get(i).getMenuNo() + "," + oList.get(i).getCount();
//         
//      }
      int orderSum = Integer.parseInt(request.getParameter("orderSum")); // 가격
      String orderInfo = request.getParameter("orderInfo");
      String orderCheck = request.getParameter("orderCheck");
      String orderAddr = request.getParameter("orderAddr");
      
      ShopOrder sod = new ShopOrder(orderId,shopId,userId,menuNo,menuName,orderCount,orderSum,orderInfo,orderCheck,orderAddr);
      
      int result = new GoService().insertOrder(sod);
      
      if(result > 0) {
         System.out.println("결제 페이지 값 넘기기 성공");
//         response.sendRedirect("oComplete.go");
         request.setAttribute("ShopOrder", sod);
         request.getRequestDispatcher("ordercompt.jsp").forward(request, response);
      }else {
         request.setAttribute("msg", "결제 페이지 값 실패");
         request.getRequestDispatcher("views/common/errorPage.jsp");
      }
      
      // 주문 내역 ArrayList
//      ArrayList<ShopOrder> list = new ArrayList<>();
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}