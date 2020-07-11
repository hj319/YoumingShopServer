package cn.tea.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tea.pojo.Information;
import cn.tea.service.InformationService;

@Controller
public class InformationController {

	@Autowired 
	private InformationService inforService;
	
	//��ʾ��������
	@RequestMapping(value="/information-list.html",method=RequestMethod.GET)
	public String getInforList(
	@RequestParam(name="currpage",required = false,defaultValue = "1") int currpage,
	//@RequestParam(name="iid",required = false,defaultValue = "1") int iid,
	Model model) {
		//����pageHelp��ķ���
		PageHelper.startPage(currpage,6);
		//����ѯ�������ݱ����model��
		List<Information> list=inforService.getInforList();
		PageInfo pageInfo=new PageInfo(list,6);
		model.addAttribute("pageInfo",pageInfo);
		return "information-list";
	}
	
	//����id��ѯ
	@RequestMapping(value="/findByIid",method=RequestMethod.GET,
			produces = "application/json;charst=UTF-8")
	@ResponseBody
	public String FindByIid(@RequestParam("iid") int iid) {
		//System.out.println("��õ�iddֵ��"+iid);
		Information infor=inforService.findByIid(iid);
		return JSON.toJSONString(infor);
	}
	
	@RequestMapping(value="/updateInfor",method=RequestMethod.POST)
	@ResponseBody
	public Object updateInfor(Information infor,HttpSession session) {
		Map<String, Integer> map=new HashMap<String , Integer>();
		boolean isOk=inforService.updateInfor(infor);
		if(isOk) {
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	
	//ɾ��
	@RequestMapping(value="/deleteInfor",method=RequestMethod.GET)
	@ResponseBody
	public Object deleteInfor(@RequestParam("iid") int iid) {
		Map<String, Integer> map=new HashMap<String , Integer>();
		boolean isOk=inforService.deleteInfor(iid);
		if(isOk) {
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	//����ɾ���ͻ�������Ϣ������
		@RequestMapping(value="/deleteManyInfo")
		@ResponseBody
		public Object deleteManyInfo(@RequestParam("productList") String productList,Model model) {
			String[] strs=productList.split(",");
		    List<Integer> ids=new ArrayList<>();
		    for(int i=0;i<strs.length;i++){
		        ids.add(Integer.parseInt(strs[i]));
		    }
		    Map<String, Integer> map=new HashMap<String, Integer>();
			boolean isOk=inforService.deleteManyInfo(ids);
			if(isOk) {
				map.put("result",1);
			}else {
				map.put("result",0);
			}
			return JSON.toJSONString(map);
		}
}
