package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.vo.Kakao;
import model.vo.Member;
import model.vo.ShopOrder;

/**
 * Servlet implementation class kakaoServlet
 */
@WebServlet("/kServlet.go")
public class KakaoServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      String pay = request.getParameter("pay");
      System.out.println("pay : " + pay);
      
      HttpSession session = request.getSession(false);
      
      ArrayList<ShopOrder> soList = (ArrayList<ShopOrder>)session.getAttribute("soList");
      ArrayList<ShopOrder> noList = (ArrayList<ShopOrder>)session.getAttribute("noList");
      Member m = (Member)session.getAttribute("member");
      
      System.out.println("kakao servlet soList : " + soList);
      System.out.println("kakao servlet noList : " + soList);
      // kakao.jsp 에 필요한 값들
      int totalPrice = 0;
      if(m != null) {
	      for(int i = 0; i < soList.size() ; i++) {
	         totalPrice += soList.get(i).getOrderSum();
	      }
	      totalPrice += soList.get(0).getDvPrice();
      }
      else {
    	  for(int i = 0; i < noList.size() ; i++) {
 	         totalPrice += noList.get(i).getOrderSum();
 	      }
 	      totalPrice += noList.get(0).getDvPrice();
      }
      
      
      // ordercompt.jsp 에 필요한 값들 totalPrice도 필요
      
      /*int orderId = (int)((Math.random() * 1000000000) + 1);
      System.out.println("orderId : "+ orderId);*/
      
      //  비회원일때 가져오는 핸드폰번호
      String phone = request.getParameter("phone");
      String orderInfo = request.getParameter("textrequest");
      String newAddr = request.getParameter("addr");
      
      
      Kakao kk = new Kakao();
      if(m != null) {
    	  kk.setUSER_PHONE(m.getUSER_PHONE());
    	  kk.setUSER_EMAIL(m.getUSER_EMAIL());
    	  kk.setShopName(soList.get(0).getShopName());
    	  m.setUSER_ADDRESS(newAddr);
          m.setUSER_PHONE(phone);	  
      }
      else {
    	  kk.setUSER_PHONE(phone);
    	  kk.setUSER_EMAIL("noMem@test.com");
    	  kk.setShopName(noList.get(0).getShopName());
      }
      kk.setTotalPrice(totalPrice);
      
      request.setAttribute("kakao", kk);
      System.out.println("KAKAOSERVLET : "+ kk);
      
      request.setAttribute("newAddr", newAddr);
      request.setAttribute("phone", phone);
      request.setAttribute("totalPrice", totalPrice);
      request.setAttribute("orderInfo" , orderInfo);
      request.setAttribute("pay", pay);
      
      System.out.println("kakao서블릿 ");
      System.out.println("newAddr :" + newAddr);
      System.out.println("phone : " + phone);
      System.out.println("totalPrice : " + totalPrice);
      System.out.println("orderInfo : " + orderInfo);
            
      request.getRequestDispatcher("views/kakaopay.jsp").forward(request,response);
       
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}