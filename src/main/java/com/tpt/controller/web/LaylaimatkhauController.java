package com.tpt.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Taikhoan;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.TaikhoanServiceImpl;
import com.tpt.util.SendMail;

@WebServlet(urlPatterns = {"/quen-mk"})
public class LaylaimatkhauController extends HttpServlet
{

	/**
	 * 
	 */
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/views/web/forgotpassword.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		
		String tentk = req.getParameter("tentk");
		String email = req.getParameter("email");
		
		Taikhoan taikhoan = taikhoanService.getTaikhoan(tentk);
		if(taikhoan == null)
		{
			req.setAttribute("error", "Tên tài khoản hoặc email không đúng");
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		}
		else if(taikhoan.getEmail().equals(email))
		{
			String subject = "Lấy lại mật khẩu";
			String text = "Bạn đang yêu cầu lấy lại mật khẩu, mật khẩu của bạn là: " 
			+ taikhoan.getMatkhau() + "\nNếu không phải bạn đã yêu cầu hãy cẩn thận\n"
			+"Cảm ơn đã sử dụng dịch vụ";
			SendMail.sendEmail(taikhoan.getEmail(), subject, text);
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		}
		else 
		{
			req.setAttribute("error", "Tên tài khoản hoặc email không đúng");
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		}
	}
}
