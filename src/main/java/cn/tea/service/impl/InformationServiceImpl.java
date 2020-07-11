package cn.tea.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.InformationDao;
import cn.tea.pojo.Information;
import cn.tea.service.InformationService;
@Service
public class InformationServiceImpl implements InformationService {

	@Autowired
	private InformationDao inforDao;
	@Override
	public List<Information> getInforList() {
		// int iid      iid
		return inforDao.getInforList();
	}
	@Override
	public boolean updateInfor(Information infor) {
		int result=inforDao.updateInfor(infor);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}
	@Override
	public Information findByIid(int iid) {
		// TODO Auto-generated method stub
		return inforDao.findByIid(iid);
	}
	@Override
	public boolean deleteInfor(int iid) {
		int result=inforDao.deleteInfor(iid);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}
	@Override
	public boolean deleteManyInfo(List<Integer> d) {
		int result=inforDao.deleteManyInfo(d);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}

}
