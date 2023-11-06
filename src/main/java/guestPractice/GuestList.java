package guestPractice;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestDAO;

@WebServlet("/guestPractice/GuestList")
public class GuestList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		guestPractice.GuestDAO dao = new guestPractice.GuestDAO();
		
		ArrayList<GuestVO> vos = dao.getGuestList();
		
		request.setAttribute("vos", vos);
		
		String viewPage = "/guestPractice/guestList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
