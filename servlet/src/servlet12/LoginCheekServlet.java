package servlet12;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginCheekServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	  throws IOException,ServletException{
		String userName=request.getParameter("username");
		String userpwd = request.getParameter("username");
		String info="";
		if("abc".equals(userName)&&"123".equals(userpwd)){
			info="欢迎你"+userName+"!";
		}else{
			info="用户名或密码不正确！";
		}
		request.setAttribute("outputMessage", info);
		request.getRequestDispatcher("/info.jsp").forward(request,response);
			
		}
	}

