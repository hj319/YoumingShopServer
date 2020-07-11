package cn.tea.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tea.pojo.Role;
import cn.tea.pojo.User;
import cn.tea.service.UserService;
import cn.tea.util.MD5Utils;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.html") 
	  public String login() {
	
	     return "pages_login"; 
	 }
	//请求的方法
	@RequestMapping(value="/dologin.html",method=RequestMethod.POST)
	public String doLogin(@RequestParam("uname") String uname,
			@RequestParam("upassword") String upassword,
			@RequestParam("code") String code,
			HttpSession session,Model model) {
		String msg="";
		//判断验证码的值是否与保存在session中的值相同
		if(!((String)session.getAttribute("yzm")).equals(code))
		{
			msg="操作提示：验证码输入有误！";
			model.addAttribute("msg", msg);
			return "pages_login";
		}
		String passwordByMd5 = MD5Utils.MD5(upassword);
		User user=userService.loginValider(uname, passwordByMd5);
		if(user!=null) {
			session.setAttribute("loginuser", user);
			return "redirect:/index";
		}else {
			msg="操作提示：用户名或密码输入有误!";
			model.addAttribute("msg", msg);
			return "pages_login";
		}	
	}
	
	//定义一个获得验证码的请求
		@RequestMapping(value="/CodeImg",method = RequestMethod.GET)
		public void getCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			// 设置响应的格式类型
			resp.setHeader("Content-Type", "image/jpeg");
			// 定义图片的宽和高
			int w = 80;
			int h = 30;
			// 声明一个RGB格式的内存中的图片
			BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			// 创建一个绘制图像的对象
			Graphics g = img.getGraphics();
			// 把背景变白色
			g.setColor(Color.white);
			g.fillRect(0, 0, w, h);
			// 设置字体
			g.setFont(new Font("aa", Font.BOLD, 18));
			// 产生并draw出4个随机数字
			Random r = new Random();
			// 创建一个保存生成四个数的字符串
			String yzm = "";
			for (int i = 0; i < 4; i++) {
				int a = r.nextInt(10);// 生成0~9之间的随机整数
				int y = 15 + r.nextInt(10);// 产生随机的垂直位置
				// 产生随机颜色
				Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
				g.setColor(c);
				g.drawString("" + a, i * 15, y);
				// 把验证码转换为字符串追加到yzm中
				yzm += a;
			}
			// 把yzm放入session
			req.getSession().setAttribute("yzm", yzm);
			// 画几条干扰线
			for (int i = 0; i < 10; i++) {
				// 产生随机颜色
				Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
				g.setColor(c);
				g.drawLine(r.nextInt(60), r.nextInt(30), r.nextInt(60), r.nextInt(30));
			}
			g.dispose();// 类似于IO中的flush(),把图形数据刷到img中
			// 把内存图片 img 对象保存到一个 jpg 文件
			ImageIO.write(img, "JPEG", resp.getOutputStream());
		}
		
		//退出的请求
		@RequestMapping(value="/loginOut",method = RequestMethod.GET)
		public String loginOut(HttpSession session) {
			session.invalidate();
			return "pages_login";
		}
		
		//跳转到个人信息页面的请求
		@RequestMapping(value="/pages_profile",method= RequestMethod.GET)
		public String profile() {
			
			return "pages_profile";
		}
		//上传用户头像的请求
		@RequestMapping(value="/updatepages_profile",method = RequestMethod.POST)
		@ResponseBody
		public Object addProduct(@PathVariable("crowd_file") MultipartFile crowd_file,HttpSession session,HttpServletRequest request) {
			String idPicPath = null;
			Map<String, Integer> map = new HashMap<String, Integer>();
			//定义上传文件的路径
			// File.separator 就相当于/，这样写的目的是为了方便系统的迁移
	        String filePath = session.getServletContext().getRealPath("static"+File.separator+"files"+File.separator+"users");
	        //判断上传文件是否为空
	        System.out.println(filePath);
	        System.out.println(crowd_file);
	        if(!crowd_file.isEmpty()) {
	        	//获得原文件名
	        	String oldName=crowd_file.getOriginalFilename();
	        	//对文件名进行一个处理
	        	String newFileName=System.currentTimeMillis()+RandomUtils.nextInt(100000,999999)+oldName;
	        	//创建上传文件对象
	        	File saveFile = new File(filePath,newFileName);
	        	//判断文件上传对象是否存在，不存在就创建
	        	if(!saveFile.exists()) {
	        		saveFile.mkdirs();
	        	}
	        	//将文件进行上传
	        	try {
	        		crowd_file.transferTo(saveFile);
	        		map.put("result", 1);
				} catch (IllegalStateException e) {					
					e.printStackTrace();
					map.put("result", 0);
					
				} catch (IOException e) {					
					e.printStackTrace();
					map.put("result", 0);
				}
	        	// 将文件保存到本地文件夹中 D:/uploadFile/
	            try {
	                DataInputStream dis = new DataInputStream(new FileInputStream(saveFile));
	                DataOutputStream dos = new DataOutputStream(new FileOutputStream("F:/uploadFile"+"/headImage/"+newFileName));
	                int len = -1;
	                while ((len = dis.read()) != -1) {
	                    dos.write(len);
	                }
	                dos.close();
	                dis.close();
	            } catch (FileNotFoundException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        	 //将上传文件保存调session中
	             session.setAttribute("headImage",newFileName);
	             System.out.println(newFileName);
	        }
	        else {
	        	System.out.println("图片为空值");
	        }
			return JSON.toJSONString(map);
		}
		//修改个人信息的ajax请求
		@RequestMapping(value="/update",method = RequestMethod.POST)
		@ResponseBody
		public Object updatepages_profile(
				@RequestParam("uid") int uid,
				@RequestParam("img") String img,
				@RequestParam("uname") String uname,
				@RequestParam("uemail") String uemail,
				@RequestParam("uintroduce") String uintroduce,
				HttpSession session) {
			System.out.println(img);
			Map<String,Integer> map=new HashMap<String,Integer>();
			User user=new User();
			String headImage=(String) session.getAttribute("headImage");
			if(headImage!=null) {
				user.setHeadImage(headImage);
				session.removeAttribute(headImage);
			}
			else {
				user.setHeadImage(img);
			}
			user.setUid(uid);
			user.setUname(uname);
			user.setUemail(uemail);
			user.setUintroduce(uintroduce);
			user.setModifyTime(new Date());
			boolean isOk=userService.updatepages_profile(user);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			return JSON.toJSONString(map);
		}
		
		//密码修改页面的跳转请求
		@RequestMapping(value="/pages_edit_pwd",method = RequestMethod.GET)
		public String pages_edit_pwd() {
			
			return "pages_edit_pwd";
		}
		
		//首页的页面跳转请求
		@RequestMapping(value="/index",method = RequestMethod.GET)
		public String index(HttpSession session) {
			//获得今日订单收入
			int totalPrice=userService.getTotalPrice();
			//获得用户总数
			int totalUser=userService.getTotalUser();
			//System.out.println(totalUser);
			//获得昨天新增用户数
			int todayAddUser=userService.getTodayAddUser();
			//获得昨日新增留言数
			int todayAddInfo=userService.getTodayAddInfo();
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("totalUser", totalUser);
			session.setAttribute("todayAddUser", todayAddUser);
			session.setAttribute("todayAddInfo", todayAddInfo);
			return "index";
		}
		
		//显示所有数据
		@RequestMapping(value="/user-list.html",method = RequestMethod.GET)
		public String getUserList(
		@RequestParam(name="currpage",required = false,defaultValue = "1") int currpage,
		@RequestParam(name="rid",required = false,defaultValue = "0") int rid,
		@RequestParam(name="uname",required = false,defaultValue = "") String uname,
		Model model) {
			//调用pageHelp类的方法
			PageHelper.startPage(currpage,6);
			//将查询到的数据保存的model中
			List<User> list=userService.getUserList(rid, uname);
			PageInfo pageInfo=new PageInfo(list,6);
			model.addAttribute("pageInfo",pageInfo);
			return "user-list";
		}
		
		//增加用户
		@RequestMapping(value="/addUser",method=RequestMethod.POST)
		@ResponseBody
		public String addUser(User user,HttpSession session) {
			Map<String, Integer> map=new HashMap<String, Integer>();
			boolean isOk=userService.addUser(user);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			return JSON.toJSONString(map);
		}
		
		//根据id查询
		@RequestMapping(value="/findById",method=RequestMethod.GET,
				produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String findById(@RequestParam("uid") int uid) {
			User user=userService.findById(uid);
			return JSON.toJSONString(user);
		}
		
		//更新
		@RequestMapping(value="/updateUser",method=RequestMethod.POST)
		@ResponseBody
		public Object updateUser(User user,HttpSession session) {
			Map<String, Integer> map=new HashMap<String , Integer>();
			boolean isOk=userService.updateUser(user);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			return JSON.toJSONString(map);
		}
		
		//删除
		@RequestMapping(value="/deleteUser",method=RequestMethod.GET)
		@ResponseBody
		public Object deleteUser(@RequestParam("uid") int uid) {
			Map<String, Integer> map=new HashMap<String , Integer>();
			boolean isOk=userService.deleteUser(uid);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			return JSON.toJSONString(map);
		}
		
		//获取所有的角色信息的请求
		@RequestMapping(value="/getRoleList",method = RequestMethod.GET)
		@ResponseBody
		public Object getRoleList(@RequestParam(name="rid",required = false,defaultValue = "0") int rid) {
			List<Role> list=userService.getRoleList(rid);
			return JSON.toJSONString(list);
		}
		
		//批量删除的请求
		@RequestMapping(value="/deleteManyUser")
		@ResponseBody
		public Object deleteManyUser(@RequestParam("productList") String productList,Model model) {
			String[] strs=productList.split(",");
		    List<Integer> ids=new ArrayList<>();
		    for(int i=0;i<strs.length;i++){
		        ids.add(Integer.parseInt(strs[i]));
		    }
		    Map<String, Integer> map=new HashMap<String, Integer>();
			boolean isOk=userService.deleteManyUser(ids);
			if(isOk) {
				map.put("result",1);
			}else {
				map.put("result",0);
			}
			return JSON.toJSONString(map);
		}
		//修改密码的请求
		@RequestMapping(value = "/updatepassword",method = RequestMethod.POST)
	    public String  updatepassword(String account,String pwd){
	        User user=new User();
	        user.setUphone(account);
	        String passwordByMd5 = MD5Utils.MD5(pwd);
	        user.setUpassword(passwordByMd5);
	        userService.updatepassword(user);
	        return "redirect:/login.html";
	    }
		//查找是否存在该电话账号的请求
		@RequestMapping("/findPhone")
	    public @ResponseBody boolean findPhone(String uphone){
	        List<User> findPhone = userService.findPhone(uphone);
	        if(findPhone.size()!=0){
	            return true;
	        }else{
	            return false;
	        }
	    }
		
		//查询是否存在该邮箱的账户
	    @RequestMapping("/checkemail")
	    public @ResponseBody boolean checkemail(String email){
	        List<User> checkemail = userService.checkemail(email);
	        if(checkemail.size()!=0){
	            return true;
	        }else{
	            return false;
	        }
	    }
	    
	    //检查输入的验证码是否与保存在在sessin中的验证码一致
	    @RequestMapping("/checkcaptcha")
	    public @ResponseBody boolean checkcaptcha(HttpSession httpSession,@RequestParam String captcha){
	        String captcha1 = (String)httpSession.getAttribute("Captcha");
	        if(captcha.equals(captcha1)){
	            return true;
	        }else {
	            return false;
	        }
	    }
	    //清空之前保存在session中的验证码
	    @RequestMapping("/deletecaptcha")
	    public @ResponseBody void deletecaptcha(HttpSession httpSession){
	        httpSession.removeAttribute("Captcha");
	    }

			
		
}
