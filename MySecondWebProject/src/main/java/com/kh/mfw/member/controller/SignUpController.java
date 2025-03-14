package com.kh.mfw.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mfw.member.model.dto.MemberDTO;
import com.kh.mfw.member.model.service.MemberService;


@WebServlet("/sign-up")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SignUpController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1) 인코딩설정
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
	
		MemberDTO member = new MemberDTO(memberId, memberPw, memberName, email, null);
		
		// 요청처리 -> 사용자가 입력한 값들을 저 멀리있는 DB Server의 KH_MEMBER테이블에 한 행 INSERT
		int result = 0; //new MemberService().signUp(member);
		
		String path = request.getContextPath();
		/*
		if(result != 0) {
			// 실패했을 경우 => 회원가입페이지로 이동
			// 유지보수가 용이해짐
			// response.sendRedirect(request.getContextPath() + "/join");
			path = request.getContextPath() + "/join";
		} else {
		// 성공했을 경우 => 웰컴페이지로 이동
		// response.sendRedirect(request.getContextPath());
			path = request.getContextPath();
		}
		*/

		
		// "중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요" -> 문자열을 화면상 출력
		// alert 인자값으로 문자열 넣고 싶음 
		// request.setAttribute("message", "중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요");
		// --> 사용할 수 있는 방법이 아님
		
		// 변수의 사용목적 --> 1. 값의 재활용 2. 의미를 담기위해
		// -> 한번 사용하는 기능을 변수로 정의하는건 비효율적
		if(result == 0) {
			request.getSession().setAttribute
			("message", "중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		} 
		
		response.sendRedirect(result != 0 ? path + "/join" : path);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}