package study.j1026;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/Test4")
public class Test4 extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
		
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String flag = request.getParameter("flag");
	
	System.out.println("name : " + name);
	System.out.println("age : " + age);
	System.out.println("flag : " + flag);
	
	}
}