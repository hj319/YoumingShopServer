package cn.tea.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Order;
import cn.tea.pojo.Order_details;
@Repository
public interface OrderDao {

	//��ѯ���ж�����Ϣ��ģ����ѯ���������飬��ҳ��
	/* @Select("select * from tea_order") */
	List<Order> getOrderList(@Param("uphone") String uphone);
	
	//�޸ĵ���������Ϣ�ķ���
		@Update("update tea_order set uname=#{uname},uphone=#{uphone},uaddress=#{uaddress},orderStatus=#{orderStatus},"
		  + "payStatus=#{payStatus},courier=#{courier},modifyTime=#{modifyTime}"
		  +"where oid=#{oid}")
		int updateOrder(Order order);
		
		//����id��ѯ
		//@Select("select * from tea_order where oid=#{oid}")
		Order_details findByOid(@Param("odid") int odid);
		
		//ɾ������������Ϣ�ķ���
		@Delete("delete from tea_order_details where odid=#{odid}")
		int deleteOrder(@Param("odid") int odid);
	
	//����ɾ��������Ϣ�ķ���
	int deleteManyOrder(List<Integer> d);
}
