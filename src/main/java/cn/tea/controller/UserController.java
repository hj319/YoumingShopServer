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
	//����ķ���
	@RequestMapping(value="/dologin.html",method=RequestMethod.POST)
	public String doLogin(@RequestParam("uname") String uname,
			@RequestParam("upassword") String upassword,
			@RequestParam("code") String code,
			HttpSession session,Model model) {
		String msg="";
		//�ж���֤���ֵ�Ƿ��뱣����session�е�ֵ��ͬ
		if(!((String)session.getAttribute("yzm")).equals(code))
		{
			msg="������ʾ����֤����������";
			model.addAttribute("msg", msg);
			return "pages_login";
		}
		String passwordByMd5 = MD5Utils.MD5(upassword);
		User user=userService.loginValider(uname, passwordByMd5);
		if(user!=null) {
			session.setAttribute("loginuser", user);
			return "redirect:/index";
		}else {
			msg="������ʾ���û�����������������!";
			model.addAttribute("msg", msg);
			return "pages_login";
		}	
	}
	
	//����һ�������֤�������
		@RequestMapping(value="/CodeImg",method = RequestMethod.GET)
		public void getCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			// ������Ӧ�ĸ�ʽ����
			resp.setHeader("Content-Type", "image/jpeg");
			// ����ͼƬ�Ŀ�͸�
			int w = 80;
			int h = 30;
			// ����һ��RGB��ʽ���ڴ��е�ͼƬ
			BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			// ����һ������ͼ��Ķ���
			Graphics g = img.getGraphics();
			// �ѱ������ɫ
			g.setColor(Color.white);
			g.fillRect(0, 0, w, h);
			// ��������
			g.setFont(new Font("aa", Font.BOLD, 18));
			// ������draw��4���������
			Random r = new Random();
			// ����һ�����������ĸ������ַ���
			String yzm = "";
			for (int i = 0; i < 4; i++) {
				int a = r.nextInt(10);// ����0~9֮����������
				int y = 15 + r.nextInt(10);// ��������Ĵ�ֱλ��
				// ���������ɫ
				Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
				g.setColor(c);
				g.drawString("" + a, i * 15, y);
				// ����֤��ת��Ϊ�ַ���׷�ӵ�yzm��
				yzm += a;
			}
			// ��yzm����session
			req.getSession().setAttribute("yzm", yzm);
			// ������������
			for (int i = 0; i < 10; i++) {
				// ���������ɫ
				Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
				g.setColor(c);
				g.drawLine(r.nextInt(60), r.nextInt(30), r.nextInt(60), r.nextInt(30));
			}
			g.dispose();// ������IO�е�flush(),��ͼ������ˢ��img��
			// ���ڴ�ͼƬ img ���󱣴浽һ�� jpg �ļ�
			ImageIO.write(img, "JPEG", resp.getOutputStream());
		}
		
		//�˳�������
		@RequestMapping(value="/loginOut",method = RequestMethod.GET)
		public String loginOut(HttpSession session) {
			session.invalidate();
			return "pages_login";
		}
		
		//��ת��������Ϣҳ�������
		@RequestMapping(value="/pages_profile",method= RequestMethod.GET)
		public String profile() {
			
			return "pages_profile";
		}
		//�ϴ��û�ͷ�������
		@RequestMapping(value="/updatepages_profile",method = RequestMethod.POST)
		@ResponseBody
		public Object addProduct(@PathVariable("crowd_file") MultipartFile crowd_file,HttpSession session,HttpServletRequest request) {
			String idPicPath = null;
			Map<String, Integer> map = new HashMap<String, Integer>();
			//�����ϴ��ļ���·��
			// File.separator ���൱��/������д��Ŀ����Ϊ�˷���ϵͳ��Ǩ��
	        String filePath = session.getServletContext().getRealPath("static"+File.separator+"files"+File.separator+"users");
	        //�ж��ϴ��ļ��Ƿ�Ϊ��
	        System.out.println(filePath);
	        System.out.println(crowd_file);
	        if(!crowd_file.isEmpty()) {
	        	//���ԭ�ļ���
	        	String oldName=crowd_file.getOriginalFilename();
	        	//���ļ�������һ������
	        	String newFileName=System.currentTimeMillis()+RandomUtils.nextInt(100000,999999)+oldName;
	        	//�����ϴ��ļ�����
	        	File saveFile = new File(filePath,newFileName);
	        	//�ж��ļ��ϴ������Ƿ���ڣ������ھʹ���
	        	if(!saveFile.exists()) {
	        		saveFile.mkdirs();
	        	}
	        	//���ļ������ϴ�
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
	        	// ���ļ����浽�����ļ����� D:/uploadFile/
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
	        	 //���ϴ��ļ������session��
	             session.setAttribute("headImage",newFileName);
	             System.out.println(newFileName);
	        }
	        else {
	        	System.out.println("ͼƬΪ��ֵ");
	        }
			return JSON.toJSONString(map);
		}
		//�޸ĸ�����Ϣ��ajax����
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
		
		//�����޸�ҳ�����ת����
		@RequestMapping(value="/pages_edit_pwd",method = RequestMethod.GET)
		public String pages_edit_pwd() {
			
			return "pages_edit_pwd";
		}
		
		//��ҳ��ҳ����ת����
		@RequestMapping(value="/index",method = RequestMethod.GET)
		public String index(HttpSession session) {
			//��ý��ն�������
			int totalPrice=userService.getTotalPrice();
			//����û�����
			int totalUser=userService.getTotalUser();
			//System.out.println(totalUser);
			//������������û���
			int todayAddUser=userService.getTodayAddUser();
			//�����������������
			int todayAddInfo=userService.getTodayAddInfo();
			session.setAttribute("totalPrice", totalPrice);
			session.setAttribute("totalUser", totalUser);
			session.setAttribute("todayAddUser", todayAddUser);
			session.setAttribute("todayAddInfo", todayAddInfo);
			return "index";
		}
		
		//��ʾ��������
		@RequestMapping(value="/user-list.html",method = RequestMethod.GET)
		public String getUserList(
		@RequestParam(name="currpage",required = false,defaultValue = "1") int currpage,
		@RequestParam(name="rid",required = false,defaultValue = "0") int rid,
		@RequestParam(name="uname",required = false,defaultValue = "") String uname,
		Model model) {
			//����pageHelp��ķ���
			PageHelper.startPage(currpage,6);
			//����ѯ�������ݱ����model��
			List<User> list=userService.getUserList(rid, uname);
			PageInfo pageInfo=new PageInfo(list,6);
			model.addAttribute("pageInfo",pageInfo);
			return "user-list";
		}
		
		//�����û�
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
		
		//����id��ѯ
		@RequestMapping(value="/findById",method=RequestMethod.GET,
				produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String findById(@RequestParam("uid") int uid) {
			User user=userService.findById(uid);
			return JSON.toJSONString(user);
		}
		
		//����
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
		
		//ɾ��
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
		
		//��ȡ���еĽ�ɫ��Ϣ������
		@RequestMapping(value="/getRoleList",method = RequestMethod.GET)
		@ResponseBody
		public Object getRoleList(@RequestParam(name="rid",required = false,defaultValue = "0") int rid) {
			List<Role> list=userService.getRoleList(rid);
			return JSON.toJSONString(list);
		}
		
		//����ɾ��������
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
		//�޸����������
		@RequestMapping(value = "/updatepassword",method = RequestMethod.POST)
	    public String  updatepassword(String account,String pwd){
	        User user=new User();
	        user.setUphone(account);
	        String passwordByMd5 = MD5Utils.MD5(pwd);
	        user.setUpassword(passwordByMd5);
	        userService.updatepassword(user);
	        return "redirect:/login.html";
	    }
		//�����Ƿ���ڸõ绰�˺ŵ�����
		@RequestMapping("/findPhone")
	    public @ResponseBody boolean findPhone(String uphone){
	        List<User> findPhone = userService.findPhone(uphone);
	        if(findPhone.size()!=0){
	            return true;
	        }else{
	            return false;
	        }
	    }
		
		//��ѯ�Ƿ���ڸ�������˻�
	    @RequestMapping("/checkemail")
	    public @ResponseBody boolean checkemail(String email){
	        List<User> checkemail = userService.checkemail(email);
	        if(checkemail.size()!=0){
	            return true;
	        }else{
	            return false;
	        }
	    }
	    
	    //����������֤���Ƿ��뱣������sessin�е���֤��һ��
	    @RequestMapping("/checkcaptcha")
	    public @ResponseBody boolean checkcaptcha(HttpSession httpSession,@RequestParam String captcha){
	        String captcha1 = (String)httpSession.getAttribute("Captcha");
	        if(captcha.equals(captcha1)){
	            return true;
	        }else {
	            return false;
	        }
	    }
	    //���֮ǰ������session�е���֤��
	    @RequestMapping("/deletecaptcha")
	    public @ResponseBody void deletecaptcha(HttpSession httpSession){
	        httpSession.removeAttribute("Captcha");
	    }

			
		
}
