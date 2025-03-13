package com.kh.mfw.member.model.service;

import com.kh.mfw.member.model.dao.MemberDAO;
import com.kh.mfw.member.model.dto.MemberDTO;

public class MemberService {
	
	public MemberDTO login(MemberDTO member) {
		
		/*
		 * 로그인하는데 -> 로그인이라고 하면 
		 * DB의 SELECT절로 사용자가 입력한 아이디 / 비밀번호 값을
		 * 조건절에 사용해서 조회를 하는 절차
		 * 
		 * ID가 틀리거나 PW가 틀려서 로그인에 실패할 수 있는 가능성이 있음
		 * 
		 * 	member.getMemberId().length() > 10
		 *  아이디가 10글자가 넘어갈경우 실패 로직 
		 * 	member.getMemberId().equeal("")
		 *	=> id / pw의 
		 * 
		 * DB에 가기전
		 * 서비스 단에서 유효성검사하기 (Validation)
		 */
		
		MemberDTO loginMember = new MemberDAO().login(member);
		return loginMember;
	
		
		
 		
	}
	
	public int signUp(MemberDTO member) {
		
		int result = new MemberDAO().checkId(member.getMemberId());
		
		if (result > 0) {
			return result;
		}
		
		new MemberDAO().signUp(member);
		return result;
		
	}
}
