package memberPractice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(vo.getMid() == null) {
			request.setAttribute("res", 1);
		}
		else {
			request.setAttribute("res", 0);
		}
		request.setAttribute("mid", mid);
		
	}

}
