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

	//查询所有订单信息（模糊查询，三表联查，分页）
	/* @Select("select * from tea_order") */
	List<Order> getOrderList(@Param("uphone") String uphone);
	
	//修改单条订单信息的方法
		@Update("update tea_order set uname=#{uname},uphone=#{uphone},uaddress=#{uaddress},orderStatus=#{orderStatus},"
		  + "payStatus=#{payStatus},courier=#{courier},modifyTime=#{modifyTime}"
		  +"where oid=#{oid}")
		int updateOrder(Order order);
		
		//根据id查询
		//@Select("select * from tea_order where oid=#{oid}")
		Order_details findByOid(@Param("odid") int odid);
		
		//删除单个订单信息的方法
		@Delete("delete from tea_order_details where odid=#{odid}")
		int deleteOrder(@Param("odid") int odid);
	
	//批量删除订单信息的方法
	int deleteManyOrder(List<Integer> d);
}
