package cn.tea.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 数据库order表的实体类
 * @author asus
 *@创建时间：2020年7月6日下午3:54:54
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	private int oid;
	private int uid;
	private String uname;
	private String uphone;
	private String uaddress;
	private String orderStatus;
	private String payStatus;
	private String courier;
	private String trackNum;
	private double totalPrice;
	private Date creatTime;
	private Date modifyTime;
}
