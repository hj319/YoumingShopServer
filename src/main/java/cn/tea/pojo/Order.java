package cn.tea.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ���ݿ�order���ʵ����
 * @author asus
 *@����ʱ�䣺2020��7��6������3:54:54
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
