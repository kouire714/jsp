package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) {
			// 회원 인증 성공....
			// 1. 자주 사용하는 변수(객체) 세션에 저장(아이디, 성명, 닉네임), 2.쿠키에 아이디 저장 또는 제거,
			// 3. DB에 처리할 내용들(최종방문일, 포인터누적, 오늘 방문일수 누적...)
			
			// 방문 포인트 처리하기?(최종접속일/방문카운트도 함께 업데이트 처리)
			// 하루의 방문 포인트는 매번 10포인트씩 주기로 한다. 단, 최대 50포인트까지만 인정한다.
			
			// 1. 세션처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("stodayCount", vo.getTodayCount());
			
			// 2. 쿠키저장
			
			
			// 3. DB작업
			
			// 정상 로그인 체크 이후에 모든 처리가 끝나면 정상처리 메세지 출력후 memberMain.jsp로 보낸다.
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/memberMain.jsp';");
			out.println("</script>");
		}
		else {
			// 회원 인증 실패시는 다시 로그인 창으로 보낸다.
			out.println("<script>");
			out.println("alert('로그인 실패~~');");
			out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.println("</script>");
		}
	}
}
