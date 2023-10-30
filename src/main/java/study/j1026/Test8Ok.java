package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/test8Ok")
public class Test8Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		/*
		String name = request.getParameter("name");
		if(name == null) name = "";
		
		String ageStr= request.getParameter("age");
		int age;
		if(ageStr == null || ageStr.equals("")) age = 0;
		else age = Integer.parseInt(request.getParameter("age"));
		*/
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
//		String name = request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
//		int age = Integer.parseInt(request.getParameter("age"));

		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
//		String hobby = request.getParameter("hobby")==null ? "" : request.getParameter("hobby");
		String[] hobbys = request.getParameterValues("hobby");
		
//		if(age < 20) {
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert(' 미성년자는 가입하실 수 없습니다.');");
//			out.println("history.back();");
//			out.println("</script>");
//		}
		
		PrintWriter out = response.getWriter();
		if(name.equals("") || age < 20) {
			out.println("<script>");
			out.println("alert('입력자료가 잘못되었습니다. 확인 후 다시 가입하세요. ');");
			out.println("history.back();");
			out.println("</script>");
//			return;
		}
		
		else {
			// DB에 저장시키고 있다.
			System.out.println("name : " + name);
			System.out.println("age : " + age);
			System.out.println("gender : " + gender);
			String hobby = "";
			for(String h : hobbys) {
				System.out.println("hobby : " + hobby);
				hobby += h + "/";
			}
			hobby = hobby.substring(0, hobby.length()-1);
			System.out.println("hobby : " + hobby);
			
//			DB저장 완료 후 jsp로 이동처리 한다.
			out.println("<script>");
			out.println("alert('회원가입이 성공적으로 되었습니다. ');");
			out.println("location.href='"+request.getContextPath()+"/study/1026/test8.jsp';");
			out.println("</script>");
		}
	}
}
