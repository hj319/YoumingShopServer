package cn.tea.service;

import java.util.List;


import cn.tea.pojo.Information;

public interface InformationService {

	//int iid
	List<Information> getInforList();
	
	//�޸�
	boolean updateInfor(Information infor);
	
	//����id
	Information findByIid(int iid);
	
	//ɾ��
	boolean deleteInfor(int iid);

	boolean deleteManyInfo(List<Integer> ids);
}
