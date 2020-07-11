package cn.tea.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tea.pojo.Information;

public interface InformationDao {
	//显示所有 @Param("iid") int iid
	List<Information> getInforList();
	
	//根据id查询
	@Select("select * from tea_information where iid=#{iid}")
	Information findByIid(@Param("iid") int iid);
	
	//回复留言的方法
	@Update("update tea_information set reply=#{reply} where iid=#{iid}")
	int updateInfor(Information infor);
	
	//删除单条留言的方法
	@Delete("delete from tea_information where iid=#{iid}")
	int deleteInfor(@Param("iid") int iid);

	//批量删除客户留言信息的方法
	int deleteManyInfo(List<Integer> d);
}
