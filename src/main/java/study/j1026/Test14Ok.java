package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/test14Ok")
public class Test14Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job");
		
		PrintWriter out = response.getWriter();
		if(name.equals("") || age < 20) {
			response.sendRedirect(request.getContextPath()+"/study/1026/test14.jsp?flag=no");
		}
		
		else {
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
			System.out.println("job : " + job);
			
			Test13VO vo = new Test13VO();
			
			vo.setName(name);
			vo.setAge(age);
			vo.setGender(gender);
			vo.setHobby(hobby);
			vo.setJob(job);
			
//			DB저장 완료 후 jsp로 이동처리 한다.
			
//			request저장소에 전송하려고 하는 자료들을 모두 담아준다. : request("변수명", 전송값)
			request.setAttribute("vo", vo);
			
			String viewPage = "/study/1026/test14Res.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
