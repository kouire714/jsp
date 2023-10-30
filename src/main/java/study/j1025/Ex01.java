package study.j1025;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/Ex01", "/ex01" })
public class Ex01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<div align=center>");
		out.println("<h2>1~9 숫자정렬</h2>");
		
		int su = 0;
		
		for(int i=1; i<=3; i++)
		{
			for(int j=1; j<=3; j++)
			{
				su++;
				out.print(su + " ");
			}
			out.println("<br/>");
		}
		out.println("</div>");
	}
}
