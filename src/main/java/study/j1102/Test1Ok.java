package study.j1102;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/j1102/test1Ok")
public class Test1Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String introduce = request.getParameter("introduce")==null ? "" : request.getParameter("introduce");
		
		System.out.println("이곳은/j1102/Test10k.jva 입니다. ");
		System.out.println("content : " + content );
		System.out.println("introduce : " + introduce );
		
		PrintWriter out = response.getWriter();
		out.println("이곳은 Test10k 컨트롤러 입니다.");
		
		request.setAttribute("msg", "Test1Ok.java에서 보냅니다.");
		
		String viewPage = "/study/1102_web_xml/test1Res.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}