package cn.tea.service;

import java.util.List;


import cn.tea.pojo.Order;
import cn.tea.pojo.Order_details;

public interface OrderService {

		//��ѯ����
		List<Order> getOrderList(String uphone);
		
		//�޸�
		boolean updateOrder(Order order);
		
		//����id��ѯ
		Order_details findByOid(int odid);
		
		//ɾ��
		boolean deleteOrder(int odid);

		boolean deleteManyOrder(List<Integer> ids);
}
