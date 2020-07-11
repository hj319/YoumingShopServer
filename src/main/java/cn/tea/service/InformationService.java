package cn.tea.service;

import java.util.List;


import cn.tea.pojo.Information;

public interface InformationService {

	//int iid
	List<Information> getInforList();
	
	//ÐÞ¸Ä
	boolean updateInfor(Information infor);
	
	//¸ù¾Ýid
	Information findByIid(int iid);
	
	//É¾³ý
	boolean deleteInfor(int iid);

	boolean deleteManyInfo(List<Integer> ids);
}
