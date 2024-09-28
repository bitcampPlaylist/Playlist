package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class UpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String name = request.getParameter("name");
		String id = request.getParameter("id"); 
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		int zipcode = Integer.parseInt(request.getParameter("zipcode"));
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_name(name);
		memberDTO.setMember_id(id);
		memberDTO.setMember_pwd(pwd);
		memberDTO.setMember_gender(gender);
		memberDTO.setMember_email1(email1);
		memberDTO.setMember_email2(email2);
		memberDTO.setMember_tel1(tel1);
		memberDTO.setMember_tel2(tel2);
		memberDTO.setMember_tel3(tel3);
		memberDTO.setMember_zipcode(zipcode);
		memberDTO.setMember_addr1(addr1);
		memberDTO.setMember_addr2(addr2);
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.update(memberDTO);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "none";
	}

}







