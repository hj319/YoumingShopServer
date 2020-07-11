package cn.tea.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.UserDao;
import cn.tea.pojo.Role;
import cn.tea.pojo.User;
import cn.tea.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public User loginValider(String uname, String upassword) {
		
		return userDao.loginValider(uname, upassword);
	}
	@Override
	public boolean updatepages_profile(User user) {
		int result=userDao.updatePages_profile(user);
		if(result>0) {
			return true;
		}else {
			return false;
		}	
	}
	@Override
	public List<User> getUserList(int rid,String uname) {
		// TODO Auto-generated method stub
		return userDao.getUserList(rid, uname);
	}
	@Override
	public boolean addUser(User user) {
		int result=userDao.addUser(user);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}
	@Override
	public boolean updateUser(User user) {
		int result=userDao.updateUser(user);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}
	@Override
	public User findById(int uid) {
		// TODO Auto-generated method stub
		return userDao.findById(uid);
	}
	@Override
	public boolean deleteUser(int uid) {
		int result=userDao.deleteUser(uid);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}
	@Override
	public List<Role> getRoleList(int rid) {
		
		return userDao.getRoleList(rid);
	}
	@Override
	public boolean deleteManyUser(List<Integer> d) {
		int result=userDao.deleteManyUser(d);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}
	@Override
	public void updatepassword(User user) {
		userDao.updatepassword(user);
		
	}
	@Override
	public List<User> findPhone(String uphone) {
		
		return userDao.findPhone(uphone);
	}
	@Override
	public List<User> checkemail(String email) {
		
		return userDao.checkemail(email);
	}
	@Override
	public int getTotalPrice() {
		
		return userDao.getTotalPrice();
	}
	@Override
	public int getTotalUser() {
		
		return userDao.getTotalUser();
	}
	
   @Override 
   public int getTodayAddUser() {
  
   return userDao.getTodayAddUser();
   }
  
   @Override 
   public int getTodayAddInfo() {
  
   return userDao.getTodayAddInfo(); 
   }
	 

}
