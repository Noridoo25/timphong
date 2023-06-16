package com.tpt.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpt.model.Phong;
import com.tpt.model.Taikhoan;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.util.Constant;

@WebServlet(urlPatterns = {"/filter", "/timkiem", "/next"})
public class Ajax extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IPhongService phongService = new PhongServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		Object object = session.getAttribute("account");
		Taikhoan taikhoan = (Taikhoan)object;
		int id_tk = 0;
		if(taikhoan != null)
		{
			if(taikhoan.getQuyen() == 3)
			{
				id_tk = taikhoan.getId_tk();
			}
		}
		String url = req.getRequestURI().toString();
		if(url.contains("next"))
		{
			LoadMore(id_tk, req, resp);
		}
		else 
		{
			LocOrSearch(id_tk, req, resp);
		}
	}
	protected void LocOrSearch(int id_tk, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String thutuReq = req.getParameter("thutu");
		int tt = 0;
		if(thutuReq != null)
		{
			tt = Integer.parseInt(thutuReq);
		}
		String keyword = req.getParameter("key");
		String[] locString= new String[Constant.BoLoc];
		int[] loc = new int[Constant.BoLoc];
		locString[0] = req.getParameter("loaiphong");
		locString[1] = req.getParameter("tinh");
		locString[2] = req.getParameter("huyen");
		locString[3] = req.getParameter("xa");
		locString[4] = req.getParameter("songuoi");
		for(int i = 0; i < Constant.BoLoc; i++)
		{
			if(locString[i] != null)
			{
				loc[i] = Integer.parseInt(locString[i]);
			}
			else 
			{
				loc[i] = 0;
			}
		}
		List<Phong> phongs = phongService.locPhong(keyword, loc, Constant.thutu[tt], id_tk);
		PrintWriter out = resp.getWriter();
		for (Phong p : phongs) {
			out.println("											<tr class=\"phong\">\r\n"
					+ "											<td class=\"col-1\">"+p.getId_p()+"</td>\r\n"
					+ "												<td class=\"col-4\">"
					+ "													<img style = \"height:120px; width:160px\" class=\"img-thumbnail\"\r\n"
					+ "													src=\"/timphong/hinhanh?fname=" + p.getAnhchinh() +"\" /></td>\r\n"
					+ "												<td class=\"col-2\">"+p.getTen()+"</td>\r\n"
					+ "												<td class=\"col-1\">"+p.getGia()+"</td>\r\n"
					+ "												<td class=\"col-2\">"+p.getXa().getTenxa()+","+p.getXa().getHuyen().getTenhuyen()+", "+p.getXa().getHuyen().getTinh().getTentinh()+"</td>\r\n"
					+ "												<td class=\"col-2 p-5\"><a class=\"main-name-object\"\r\n"
					+ "													href=\"<c:url value=\"/timphong/admin/taikhoan?id_tk="+p.getTaikhoan().getId_tk()+"\">"
					+                                                  p.getTaikhoan().getTentk()+"</a></td>\r\n"
					+ "												<td class=\"col-1\"><a class=\"d-inline-block mb-3 mr-3\"\r\n"
					+ "													href=\"/timphong/admin/phong?id_p="+p.getId_p()+"&id_taikhoan="+p.getTaikhoan().getId_tk()+"\"/\"><button\r\n"
					+ "															class=\"btn btn-success btn-sm rounded-0\" type=\"button\"\r\n"
					+ "															data-toggle=\"tooltip\" data-placement=\"top\" title=\"Edit\">\r\n"
					+ "															<i class=\"bi bi-pencil-square\"></i>\r\n"
					+ "														</button></a><a\r\n"
					+ "													href=\"/timphong/admin/xoa-phong?id_p="+p.getId_p()+"\"/\"><button\r\n"
					+ "															class=\"btn btn-danger btn-sm rounded-0\" type=\"button\"\r\n"
					+ "															data-toggle=\"tooltip\" data-placement=\"top\" title=\"Delete\">\r\n"
					+ "															<i class=\"bi bi-trash\"></i>\r\n"
					+ "														</button></a></td>\r\n"
					+ "											</tr>");
		}
	}

	protected void LoadMore(int id_tk, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String thutuReq = req.getParameter("thutu");
		int tt = 0;
		if (thutuReq != null) {
			tt = Integer.parseInt(thutuReq);
		}
		String coutString = req.getParameter("exits");
		String keyword = req.getParameter("key");
		if (keyword == null) {
			keyword = "";
		}
		int cout = Integer.parseInt(coutString);
		String[] locString = new String[Constant.BoLoc];
		int[] loc = new int[Constant.BoLoc];
		locString[0] = req.getParameter("loaiphong");
		locString[1] = req.getParameter("tinh");
		locString[2] = req.getParameter("huyen");
		locString[3] = req.getParameter("xa");
		locString[4] = req.getParameter("thutu");
		for (int i = 0; i < Constant.BoLoc; i++) {
			if (locString[i] != null) {
				loc[i] = Integer.parseInt(locString[i]);
			} else {
				loc[i] = 0;
			}
		}
		List<Phong> phongs = phongService.pagingPhong(cout, keyword, loc, Constant.thutu[tt], id_tk);
		PrintWriter out = resp.getWriter();
		for (Phong p : phongs) {
			out.println("											<tr class=\"phong\">\r\n"
					+ "											<td class=\"col-1\">"+p.getId_p()+"</td>\r\n"
					+ "												<td class=\"col-4\">"
					+ "													<img style = \"height:120px; width:160px\" class=\"img-thumbnail\"\r\n"
					+ "													src=\"/timphong/hinhanh?fname=" + p.getAnhchinh() +"\" /></td>\r\n"
					+ "												<td class=\"col-2\">"+p.getTen()+"</td>\r\n"
					+ "												<td class=\"col-1\">"+p.getGia()+"</td>\r\n"
					+ "												<td class=\"col-2\">"+p.getXa().getTenxa()+","+p.getXa().getHuyen().getTenhuyen()+", "+p.getXa().getHuyen().getTinh().getTentinh()+"</td>\r\n"
					+ "												<td class=\"col-2 p-5\"><a class=\"main-name-object\"\r\n"
					+ "													href=\"/timphong/admin/taikhoan?id_tk="+p.getTaikhoan().getId_tk()+"\">" + p.getTaikhoan().getTentk()+"</a></td>\r\n"
					+ "												<td class=\"col-1\"><a class=\"d-inline-block mb-3 mr-3\"\r\n"
					+ "													href=\"/timphong/admin/phong?id_p="+p.getId_p()+"&id_taikhoan="+p.getTaikhoan().getId_tk()+"\"/\"><button\r\n"
					+ "															class=\"btn btn-success btn-sm rounded-0\" type=\"button\"\r\n"
					+ "															data-toggle=\"tooltip\" data-placement=\"top\" title=\"Edit\">\r\n"
					+ "															<i class=\"bi bi-pencil-square\"></i>\r\n"
					+ "														</button></a><a\r\n"
					+ "													href=\"/timphong/admin/xoa-phong?id_p="+p.getId_p()+"\"/\"><button\r\n"
					+ "															class=\"btn btn-danger btn-sm rounded-0\" type=\"button\"\r\n"
					+ "															data-toggle=\"tooltip\" data-placement=\"top\" title=\"Delete\">\r\n"
					+ "															<i class=\"bi bi-trash\"></i>\r\n"
					+ "														</button></a></td>\r\n"
					+ "											</tr>");
		}
	}

}
