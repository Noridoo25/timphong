package com.tpt.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.model.Phong;
import com.tpt.service.IPhongService;
import com.tpt.service.impl.PhongServiceImpl;
import com.tpt.util.Constant;

@WebServlet(urlPatterns = { "/more" })
public class PagingAjaxPhongController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	IPhongService phongService = new PhongServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		String thutuReq = req.getParameter("thutu");
		int tt = 0;
		if(thutuReq != null)
		{
			tt = Integer.parseInt(thutuReq);
		}
		String coutString = req.getParameter("exits");
		String keyword = req.getParameter("key");
		if(keyword == null)
		{
			keyword = "";
		}
		int cout = Integer.parseInt(coutString);
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
		}
//		List<Phong> phongs = ConstantFunction.locPhong(phongService.pagingPhong(cout, keyword), loc);
		List<Phong> phongs = phongService.pagingPhong(cout, keyword, loc, Constant.thutu[tt], 0);
		PrintWriter out = resp.getWriter();
		for (Phong p : phongs) {
			out.println("				<div class=\"phong col-md-6 col-lg-4 mb-5 mb-lg-5 \">\r\n"
					+ "					<div class=\"ftco-media-1\">\r\n"
					+ "						<div class=\"ftco-media-1-inner\">\r\n"
					+ "							<a href=\"/timphong/detail-phong?id_p=" + p.getId_p() + "\"\r\n"
					+ "								class=\"d-inline-block mb-4\"> <img\r\n"
					+ "								src=\"/timphong/hinhanh?fname=" + p.getAnhchinh() + "\"\r\n"
					+ "								alt=\"Image\" class=\"img-fluid\">\r\n"
					+ "								<div class=\"ftco-media-details text-dark\">\r\n"
					+ "									<h3 class=\"mt-3 mb-1\" style=\"font-weight: 400!important\">" + p.getTen() + "</h3>\r\n"
					+ "									<strong>Giá: " + p.getGia() + " VNĐ</strong>\r\n"
					+ "									<p class=\"pr-3\">Đ/c: "+ p.getXa().getTenxa() + ",\r\n"
					+ "										" + p.getXa().getHuyen().getTenhuyen() + ",\r\n"
					+ "										" + p.getXa().getHuyen().getTinh().getTentinh() + "</p>\r\n"
					+ "									<p>Số người ở tối đa: " + p.getSonguoi()+ "</p>\r\n"
					+ "									<p>Đánh giá: " + danhgia(p.getDanhgia()) + "</p>\r\n"
					+ "									<p>Có " + p.getQuantam() + " người quan</p>\r\n"
					+ "								</div>\r\n"
					+ "							</a>\r\n"
					+ "						</div>\r\n"
					+ "					</div>\r\n"
					+ "				</div>");
		}
		
	}
	String danhgia(float dg)
	{
		
		if(dg == 0)
		{
			return "Chưa có đánh giá";
		}
		else 
		{
			return String.valueOf(dg) + "/5.0";
		}
	}

}
