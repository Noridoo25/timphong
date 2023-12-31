package com.tpt.service.impl;

import java.util.List;

import com.tpt.dao.IDathenDao;
import com.tpt.dao.impl.DathenDaoImpl;
import com.tpt.model.Dathen;
import com.tpt.service.IDathenService;

public class DathenServiceImpl implements IDathenService
{
	IDathenDao dathenDao = new DathenDaoImpl();

	@Override
	public boolean editDathen(Dathen dathen)
	{
		// TODO Auto-generated method stub
		return dathenDao.editDathen(dathen);
	}

	@Override
	public boolean deleteDathen(int id_dh, int id_tk, int id_p)
	{
		// TODO Auto-generated method stub
		return dathenDao.deleteDathen(id_dh, id_tk, id_p);
	}

	@Override
	public boolean insertDathen(Dathen dathen)
	{
		// TODO Auto-generated method stub
		return dathenDao.insertDathen(dathen);
	}
	
	@Override
	public List<Dathen> findByTrangthai(int id_tk, int tt)
	{
		return dathenDao.findByTrangthai(id_tk, tt);
	}

	@Override
	public Dathen findDathen(int id_dh, int id_tk, int id_p)
	{
		// TODO Auto-generated method stub
		return dathenDao.findDathen(id_dh, id_tk, id_p);
	}

	@Override
	public List<Dathen> findBySeller(int id_tk, int tt)
	{
		// TODO Auto-generated method stub
		return dathenDao.findBySeller(id_tk, tt);
	}

	@Override
	public List<Dathen> findAll(int tt)
	{
		return dathenDao.findAll(tt);
	}

	@Override
	public List<Dathen> getAllcho() 
	{
		return dathenDao.getAllcho();
	}

	@Override
	public List<Dathen> getAllxn()
	{
		return dathenDao.getAllxn();
	}

	@Override
	public List<Dathen> getAllhuy() 
	{
		return dathenDao.getAllhuy();
	}

	@Override
	public List<Dathen> get3xn() {
		return dathenDao.get3xn();
	}

	@Override
	public List<Dathen> get3huy() {
		return dathenDao.get3huy();
	}
}
