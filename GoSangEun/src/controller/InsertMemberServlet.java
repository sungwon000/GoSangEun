package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.MemberService;
import model.vo.Member;

/**
 * Servlet implementation class insert
 */
@WebServlet("/join.do")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertMemberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 회원 가입 서비스를 연동하는 서블릿

		// 1. 인코딩(생략)

		// 2. memberJoin.jsp 페이지에서 전달받은 값을 저장

		String username = request.getParameter("USER_NAME");
		String userid = request.getParameter("USER_ID");
		String usernname = request.getParameter("USER_NICKNAME");
		String password = request.getParameter("USER_PASSWORD");
		String phone = request.getParameter("USER_PHONE");
		String email = request.getParameter("USER_EMAIL");
		String address = request.getParameter("USER_ADDRESS");

		// 카드 등록

		// 회원 가입시 전달을 위한 vo 생성
		Member m = new Member(username, userid, usernname, password, phone, email, address);

		System.out.println("m controller : " + m);

		// 회원 가입 서비스 실행
		MemberService ms = new MemberService();

		int result = ms.insertMember(m);

		System.out.println("m controller result : " + result);

		if (result > 0) {
			// 회원 가입 성공
			System.out.println("회원가입에 성공");
			System.out.println("가입 회원 정보 확인 : " + m);

			RequestDispatcher view = request.getRequestDispatcher("login.jsp");

			view.forward(request, response);
		} else {
			// 회원 가입 실패
			System.out.println("실패");
			
			response.sendRedirect("joinF.jsp");

		}

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