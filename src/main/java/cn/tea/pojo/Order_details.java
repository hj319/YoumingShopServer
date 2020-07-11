package cn.tea.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 数据库表order_details实体类
 * @author asus
 *@创建时间：2020年7月6日下午3:43:07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order_details {
	private int odid;//详情订单id
	private int pid;//商品id
	private int oid;//订单id
	private int comAmount;//商品数量
	private String comName;//商品名称
	private int comPrice;//商品价格
	private String comImage;//商品图片
	private Product product;
	private Order order;
}
