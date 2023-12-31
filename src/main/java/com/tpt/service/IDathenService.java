package com.tpt.service;

import java.util.List;

import com.tpt.model.Dathen;

public interface IDathenService
{
	boolean editDathen(Dathen dathen);

	boolean deleteDathen(int id_dh, int id_tk, int id_p);

	boolean insertDathen(Dathen dathen);

	List<Dathen> findByTrangthai(int id_tk, int tt);
	
	Dathen findDathen(int id_dh, int id_tk, int id_p);
	List<Dathen> findBySeller(int id_tk, int tt);

	List<Dathen> findAll(int tt);
	
	List<Dathen> getAllcho();
	
	List<Dathen> getAllxn();
	
	List<Dathen> getAllhuy();
	
	List<Dathen> get3xn();
	
	List<Dathen> get3huy();
}
