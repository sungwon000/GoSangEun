package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.MemberService;
import model.vo.Member;

/**
 * Servlet implementation class lostIdServelt
 */
@WebServlet("/lostid.do")
public class lostIdServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lostIdServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
	      request.setCharacterEncoding("UTF-8");

	      String username = request.getParameter("USER_NAME");
		  String userid = null;
		  String usernname = null;
		  String password = null;
		  String phone = request.getParameter("USER_PHONE");
		  String email = null;
		  String address = null;

		  Member m = new Member(username, userid, usernname, password, phone, email, address);
	      System.out.println("m controller : " + m);

	      MemberService ms = new MemberService();

	      m = ms.lostid(m);

	      System.out.println("m result : " + m);
	      
	      if (m != null) {
	         System.out.println("성공 : " + m);

	         RequestDispatcher view = request.getRequestDispatcher("login.jsp");

	         HttpSession session = request.getSession();
	         
	         session.setAttribute("id", m.getUSER_ID());
	         
	         view.forward(request, response);

	      } else {
	         System.out.println("실패");
	         
	         response.sendRedirect("login.jsp");
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
