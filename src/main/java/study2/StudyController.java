package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.apiTest.SaveCrimeDataCommand;
//import study2.ajax1.AjaxTest1OkCommand;
import study2.pdsTest.FileUpload1OkCommand;
import study2.pdsTest.FileUpload2OkCommand;
import study2.pdsTest.FileUpload3OkCommand;
import study2.pdsTest.FileUpload4OkCommand;
import study2.pdsTest.fileDownloadCommand;
import study2.pdsTest.javaFileDownloadCommand;
import study2.pdsTest.tempFileDeleteCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		if(com.equals("/ajaxTest1")) {
			viewPage += "/ajax1/ajaxTest1.jsp";
		}
//		else if(com.equals("/ajaxTest1Ok")) {
//			command = new AjaxTest1OkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}
		else if(com.equals("/uuidProcess")) {
			viewPage += "/uuid/uuidForm.jsp";
		}
		else if(com.equals("/fileUpload1")) {
			viewPage += "/pdsTest/fileUpload1.jsp";
		}
		else if(com.equals("/fileUpload1Ok")) {
			command = new FileUpload1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/fileUpload2")) {
			viewPage += "/pdsTest/fileUpload2.jsp";
		}
		else if(com.equals("/fileUpload2Ok")) {
			command = new FileUpload2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/fileUpload3")) {
			viewPage += "/pdsTest/fileUpload3.jsp";
		}
		else if(com.equals("/fileUpload3Ok")) {
			command = new FileUpload3OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/fileUpload4")) {
			viewPage += "/pdsTest/fileUpload4.jsp";
		}
		else if(com.equals("/fileUpload4Ok")) {
			command = new FileUpload4OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/fileDownload")) {
			command = new fileDownloadCommand();
			command.execute(request, response);
			viewPage += "/pdsTest/fileDownload.jsp";
		}
		else if(com.equals("/tempFileDelete")) {
			command = new tempFileDeleteCommand();
			command.execute(request, response);
			viewPage += "/pdsTest/fileDownload.jsp";
			return;
		}
		else if(com.equals("/javaFileDownload")) {
			command = new javaFileDownloadCommand();
			command.execute(request, response);
			viewPage += "/pdsTest/fileDownload.jsp";
			return;
		}
		else if(com.equals("/calendar1")) {
			command = new Calendar1Command();
			command.execute(request, response);
			viewPage += "/calendar/calendar1.jsp";
		}
		else if(com.equals("/calendar2")) {
			command = new Calendar2Command();
			command.execute(request, response);
			viewPage += "/calendar/calendar2.jsp";
		}
		else if(com.equals("/api1")) {
			viewPage += "/apiTest/api1.jsp";
		}
		else if(com.equals("/apiFetch")) {
			viewPage += "/apiTest/apiFetch.jsp";
		}
		else if(com.equals("/apiTest")) {
			viewPage += "/apiTest/apiTest.jsp";
		}
		else if(com.equals("/saveCrimeData")) {
			command = new SaveCrimeDataCommand();
			command.execute(request, response);		
			viewPage += "/apiTest/apiTest.jsp";
		}
		else if(com.equals("/deleteCrimeData")) {
			command = new DeleteCrimeDataCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/listCrimeData")) {
			command = new ListCrimeDataCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/policeCheckData")) {
			command = new PoliceCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/yearPoliceCheck")) {
			command = new YearPoliceCheckCommand();
			command.execute(request, response);
			return;
		}
	
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
