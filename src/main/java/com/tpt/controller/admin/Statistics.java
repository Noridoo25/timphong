package com.tpt.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.RepaintManager;

import com.tpt.model.Dathen;
import com.tpt.model.Loaiphong;
import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.service.IDanhgiaService;
import com.tpt.service.IDathenService;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.IPhongService;
import com.tpt.service.ITaikhoanService;
import com.tpt.service.impl.DanhgiaServiceImpl;
import com.tpt.service.impl.DathenServiceImpl;
import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.service.impl.TaikhoanServiceImpl;

@MultipartConfig()
@WebServlet(urlPatterns = {"/admin/statistics"})
public class Statistics extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	IPhongService phongService = new PhongServiceImpl();
	ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
	IDathenService dathenService = new DathenServiceImpl();
	IDanhgiaService danhgiaService = new DanhgiaServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		ITaikhoanService taikhoanService = new TaikhoanServiceImpl();
		List<Taikhoan> sellers = taikhoanService.getAllSeller();
		List<Taikhoan> users = taikhoanService.getAllUser();
		List<Phong> phonghiens = phongService.getAllhien();
		List<Phong> phongans = phongService.getAllan();
		List<Dathen> dathenchos = dathenService.getAllcho();
		List<Dathen> dathenxns = dathenService.getAllxn();
		List<Dathen> dathenhuys = dathenService.getAllhuy();
		List<Loaiphong> loaiphongs = loaiphongService.getAll();
		int doanhthu = dathenxns.size() * 50000;
		req.setAttribute("sellers", sellers);
		req.setAttribute("users", users);
		req.setAttribute("phonghiens", phonghiens);
		req.setAttribute("phongans", phongans);
		req.setAttribute("dathenchos", dathenchos);
		req.setAttribute("dathenxns", dathenxns);
		req.setAttribute("dathenhuys", dathenhuys);
		req.setAttribute("loaiphongs", loaiphongs);
		req.setAttribute("doanhthu", doanhthu);
		
		
		req.getRequestDispatcher("/views/admin/index-admin.jsp").forward(req, resp);
	}
}
