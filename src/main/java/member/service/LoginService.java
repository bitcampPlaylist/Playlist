package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String member_id = request.getParameter("member_id");
		String member_pwd = request.getParameter("member_pwd");
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(member_id, member_pwd);
		
		if(memberDTO == null)
			return "/member/loginFail.jsp";
		else {
			//세션
			HttpSession session = request.getSession(); //세션 생성
			
			session.setAttribute("memName", memberDTO.getMember_name());
			session.setAttribute("memId", member_id);
			session.setAttribute("memEmail", memberDTO.getMember_email1()+"@"+memberDTO.getMember_email2());
			
			session.setAttribute("memDTO", memberDTO);
		
			return "/member/loginOk.jsp";
		}
	}

}







