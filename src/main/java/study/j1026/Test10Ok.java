package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/test10Ok")
public class Test10Ok extends HttpServlet {
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
			response.sendRedirect(request.getContextPath()+"/study/1026/test10.jsp?flag=no");
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
//			out.println("<script>");
//			out.println("alert('회원가입이 성공적으로 되었습니다. ');");
//			out.println("location.href='"+request.getContextPath()+"/study/1026/test8.jsp';");
//			out.println("</script>");
			
//			response.sendRedirect(request.getContextPath()+"/study/1026/test9.jsp?flag=ok");	// Front의 location.href방식과 같은 방식이다.
			
			// 한글인 경우는 인코딩 문제로 브라우저에서 에러로 체크된다.
			name = URLEncoder.encode(name, "utf-8");
			// response 방식 location.href방식과 같은 방식이다. get 방식, 잠시 세우고.. query문으로 자료 추가, 보안이 안되고 누락 가능성
			response.sendRedirect(request.getContextPath()+"/study/1026/test10Res.jsp?name="+name+"&age="+age+"&gender=&hobbys&job="+name);
		}
	}
}
