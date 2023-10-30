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

@WebServlet("/j1026/test11Ok")
public class Test11Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// Front에서 넘어온 값을 변수에 담아준다.
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "남자" : request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job");
		
		// 기본적으로 다시 체크해야할 것들을 체크해 준다. (잘못된 자료는 다시 돌려보낸다. 정상적인 자료는 DB에 저장시켜준다. )
		PrintWriter out = response.getWriter();
		if(name.equals("") || age < 20) {
			// 가입조건을 만족하지 않았기에 다시 가입창으로 전송시켜준다.
			response.sendRedirect(request.getContextPath()+"/study/1026/test11.jsp?flag=no");
		}
		
		else {
			// 가입조건을 만족하였기에, DB에 저장시키고 회원 메인창(test10Res.jsp)으로 이동시킨다.
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
			
//			DB저장 완료 후 jsp로 이동처리 한다.

//			response.sendRedirect(request.getContextPath()+"/study/1026/test11Res.jsp?name="+name+"&age="+age+"&gender=&hobbys&job="+name);
			
//			request저장소에 전송하려고 하는 자료들을 모두 담아준다. : request("변수명", 전송값)
			request.setAttribute("name", name);
			request.setAttribute("age", age);
			request.setAttribute("gender", gender);
			request.setAttribute("hobby", hobby);
			request.setAttribute("job", job);
			
			// 첫번째 / = webapp
			String viewPage = "/study/1026/test11Res.jsp";
			
			// 직렬화 멈추지 않고 진행 처음변경 주소만 노출됨 sendRedirect를 다시 사용하면 주소가 다시 설정됨
			// package는 주소에 표시되지 않음 지금은 WebServlet 이름이 표기된것
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
