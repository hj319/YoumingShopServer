package cn.tea.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Role;
import cn.tea.pojo.User;

/**
 * �û��ӿ�
 * @author asus
 *@����ʱ�䣺2020��6��29������9:37:57
 */
@Repository
public interface UserDao {
		//��¼��֤�û���������ķ���
		
		User loginValider(@Param("uname") String uname, @Param("upassword") String upassword);
		
		//������Ϣҳ���޸���Ϣ�ķ���
		@Update("update tea_user set uname=#{uname},headImage=#{headImage},uemail=#{uemail},uintroduce=#{uintroduce},modifyTime=#{modifyTime}"
				+ "where uid=#{uid}")
		int updatePages_profile(User user);
		
		//��ʾ����
		//@Select("select * from tea_user")
		List<User> getUserList(@Param("rid") int rid,@Param("uname") String uname);
		
		//����û�
		@Insert("insert into tea_user(uname,rid,uemail,upassword,uintroduce,uphone,uaddress)"
				+ "values(#{uname},#{rid},#{uemail},#{upassword},#{uintroduce},#{uphone},#{uaddress})")
		int addUser(User user);
		
		//�޸���Ϣ
		@Update("update tea_user set uname=#{uname},rid=#{rid},uemail=#{uemail}"
				+ ",upassword=#{upassword},uintroduce=#{uintroduce},uphone=#{uphone},uaddress=#{uaddress}"
				+ "where uid=#{uid}")
		int updateUser(User user);

		//����id��ѯ
		@Select("select * from tea_user where uid=#{uid}")
		User findById(@Param("uid") int uid);
		
		//ɾ��
		@Delete("delete from tea_user where uid=#{uid}")
		int deleteUser(@Param("uid") int uid);
		
		//������н�ɫ��Ϣ�ķ�����������ɫ����Ĳ�ѯ
		List<Role> getRoleList(@Param("rid")int rid);
		
		//����ɾ���û��ķ���
		int deleteManyUser(List<Integer> d);

		//�޸�����ķ���
		@Update("update tea_user set upassword=#{upassword} where uphone=#{uphone}")
		void updatepassword(User user);
		
		//���ҷ���ڵ�ǰ�˺���Ϣ
		@Select("select * from tea_user where uphone=#{uphone}")
		List<User> findPhone(String uphone);
		
		//�����Ƿ���ڸ�������Ϣ
		@Select("select * from tea_user where uemail=#{email}")
		List<User> checkemail(String email);
		
		//��õ��충�������ܽ��
		@Select("SELECT DATE(creatTime) AS DATE,SUM(totalPrice)  AS num\r\n" + 
				"FROM tea_order")
		int getTotalPrice();
		
		//����ܹ��û�����
		@Select("SELECT COUNT(1) FROM tea_user")
		int getTotalUser();
		
	  //��������������û���
	  @Select("SELECT COUNT(*) AS COUNT FROM tea_user WHERE TO_DAYS( NOW( ) ) - TO_DAYS( creatTime) <= 1") 
	  int getTodayAddUser();
	  
	  //����������ӵ���������
	  @Select("SELECT COUNT(*) AS COUNT FROM tea_information WHERE TO_DAYS( NOW( ) ) - TO_DAYS( sendTime) <= 1") 
	  int getTodayAddInfo();
	 
}
