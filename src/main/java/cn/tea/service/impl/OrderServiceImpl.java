package cn.tea.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.OrderDao;
import cn.tea.pojo.Order;
import cn.tea.pojo.Order_details;
import cn.tea.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	@Override
	public List<Order> getOrderList(String uphone) {
		// TODO Auto-generated method stub
		return orderDao.getOrderList(uphone);
	}

	@Override
	public boolean updateOrder(Order order) {
		int result=orderDao.updateOrder(order);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}

	@Override
	public Order_details findByOid(int odid) {
		// TODO Auto-generated method stub
		return orderDao.findByOid(odid);
	}

	@Override
	public boolean deleteOrder(int odid) {
		int result=orderDao.deleteOrder(odid);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}

	@Override
	public boolean deleteManyOrder(List<Integer> d) {
		int result=orderDao.deleteManyOrder(d);
		if(result > 0) {
            return true;
        }else {
            return false;
        }
	}

}
