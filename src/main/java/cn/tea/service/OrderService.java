package cn.tea.service;

import java.util.List;


import cn.tea.pojo.Order;
import cn.tea.pojo.Order_details;

public interface OrderService {

		//查询所有
		List<Order> getOrderList(String uphone);
		
		//修改
		boolean updateOrder(Order order);
		
		//根据id查询
		Order_details findByOid(int odid);
		
		//删除
		boolean deleteOrder(int odid);

		boolean deleteManyOrder(List<Integer> ids);
}
