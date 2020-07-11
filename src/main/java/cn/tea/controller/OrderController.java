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

import cn.tea.pojo.Order;
import cn.tea.pojo.Order_details;
import cn.tea.service.OrderService;

@Controller
public class OrderController {

	@Autowired OrderService orderService;
	
	//显示所有数据
	@RequestMapping(value="/order-list.html",method=RequestMethod.GET)
	public String getOrderList(
	@RequestParam(name="currpage",required = false,defaultValue = "1") int currpage,
	@RequestParam(name="uphone" ,required = false,defaultValue = "") String uphone,
	Model model) {
		//调用pageHelp类的方法
		PageHelper.startPage(currpage,6);
		//将查询到的数据保存的model中
		List<Order> list=orderService.getOrderList(uphone);
		PageInfo pageInfo=new PageInfo(list,6);
		model.addAttribute("pageInfo",pageInfo);
		return "order-list";
	}
	
	//根据id查询
		@RequestMapping(value="findByOid",method=RequestMethod.GET,
				produces = "application/json;charset=UTF-8")
		@ResponseBody
		public Object findById(@RequestParam("odid") int odid) {
			Order_details order=orderService.findByOid(odid);
			return JSON.toJSONString(order);
		}
		
		//修改
		@RequestMapping(value="/updateOrder",method=RequestMethod.POST)
		@ResponseBody
		public Object updateUser(Order order,HttpSession session) {
			Map<String, Integer> map=new HashMap<String , Integer>();
			order.setModifyTime(new Date());
			boolean isOk=orderService.updateOrder(order);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			return JSON.toJSONString(map);
		}
		
		//删除
		@RequestMapping(value="/deleteOrder",method=RequestMethod.GET)
		@ResponseBody
		public Object deleteUser(@RequestParam("odid") int odid) {
			Map<String, Integer> map=new HashMap<String , Integer>();
			boolean isOk=orderService.deleteOrder(odid);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			return JSON.toJSONString(map);
		}
	
	//批量删除的请求
	@RequestMapping(value="/deleteManyOrder")
	@ResponseBody
	public Object deleteManyOrder(@RequestParam("productList") String productList,Model model) {
		String[] strs=productList.split(",");
	    List<Integer> ids=new ArrayList<>();
	    for(int i=0;i<strs.length;i++){
	        ids.add(Integer.parseInt(strs[i]));
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=orderService.deleteManyOrder(ids);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}
	
	
}
