package cn.tea.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tea.pojo.Information;

public interface InformationDao {
	//��ʾ���� @Param("iid") int iid
	List<Information> getInforList();
	
	//����id��ѯ
	@Select("select * from tea_information where iid=#{iid}")
	Information findByIid(@Param("iid") int iid);
	
	//�ظ����Եķ���
	@Update("update tea_information set reply=#{reply} where iid=#{iid}")
	int updateInfor(Information infor);
	
	//ɾ���������Եķ���
	@Delete("delete from tea_information where iid=#{iid}")
	int deleteInfor(@Param("iid") int iid);

	//����ɾ���ͻ�������Ϣ�ķ���
	int deleteManyInfo(List<Integer> d);
}
