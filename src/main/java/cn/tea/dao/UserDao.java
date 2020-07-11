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
 * 用户接口
 * @author asus
 *@创建时间：2020年6月29日上午9:37:57
 */
@Repository
public interface UserDao {
		//登录验证用户名和密码的方法
		
		User loginValider(@Param("uname") String uname, @Param("upassword") String upassword);
		
		//个人信息页面修改信息的方法
		@Update("update tea_user set uname=#{uname},headImage=#{headImage},uemail=#{uemail},uintroduce=#{uintroduce},modifyTime=#{modifyTime}"
				+ "where uid=#{uid}")
		int updatePages_profile(User user);
		
		//显示所有
		//@Select("select * from tea_user")
		List<User> getUserList(@Param("rid") int rid,@Param("uname") String uname);
		
		//添加用户
		@Insert("insert into tea_user(uname,rid,uemail,upassword,uintroduce,uphone,uaddress)"
				+ "values(#{uname},#{rid},#{uemail},#{upassword},#{uintroduce},#{uphone},#{uaddress})")
		int addUser(User user);
		
		//修改信息
		@Update("update tea_user set uname=#{uname},rid=#{rid},uemail=#{uemail}"
				+ ",upassword=#{upassword},uintroduce=#{uintroduce},uphone=#{uphone},uaddress=#{uaddress}"
				+ "where uid=#{uid}")
		int updateUser(User user);

		//根据id查询
		@Select("select * from tea_user where uid=#{uid}")
		User findById(@Param("uid") int uid);
		
		//删除
		@Delete("delete from tea_user where uid=#{uid}")
		int deleteUser(@Param("uid") int uid);
		
		//获得所有角色信息的方法，包括角色分类的查询
		List<Role> getRoleList(@Param("rid")int rid);
		
		//批量删除用户的方法
		int deleteManyUser(List<Integer> d);

		//修改密码的方法
		@Update("update tea_user set upassword=#{upassword} where uphone=#{uphone}")
		void updatepassword(User user);
		
		//查找否存在当前账号信息
		@Select("select * from tea_user where uphone=#{uphone}")
		List<User> findPhone(String uphone);
		
		//查找是否存在该邮箱信息
		@Select("select * from tea_user where uemail=#{email}")
		List<User> checkemail(String email);
		
		//获得当天订单收入总金额
		@Select("SELECT DATE(creatTime) AS DATE,SUM(totalPrice)  AS num\r\n" + 
				"FROM tea_order")
		int getTotalPrice();
		
		//获得总共用户数量
		@Select("SELECT COUNT(1) FROM tea_user")
		int getTotalUser();
		
	  //获得昨天增长的用户数
	  @Select("SELECT COUNT(*) AS COUNT FROM tea_user WHERE TO_DAYS( NOW( ) ) - TO_DAYS( creatTime) <= 1") 
	  int getTodayAddUser();
	  
	  //获得昨天增加的留言数量
	  @Select("SELECT COUNT(*) AS COUNT FROM tea_information WHERE TO_DAYS( NOW( ) ) - TO_DAYS( sendTime) <= 1") 
	  int getTodayAddInfo();
	 
}
