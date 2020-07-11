package cn.tea.service;

import java.util.List;

import cn.tea.pojo.Role;
import cn.tea.pojo.User;

public interface UserService {
	User loginValider( String uname,  String upassword);

	boolean updatepages_profile(User user);
	
	List<User> getUserList(int rid,String uname);
	
	boolean addUser(User user);
	
	boolean updateUser(User user);
	
	User findById(int uid);
	
	boolean deleteUser(int uid);

	List<Role> getRoleList(int rid);

	boolean deleteManyUser(List<Integer> ids);

	void updatepassword(User user);

	List<User> findPhone(String uphone);

	List<User> checkemail(String email);

	int getTotalPrice();

	int getTotalUser();
	
    int getTodayAddUser();
  
    int getTodayAddInfo();
	 
}
