package cn.tea.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ���ݿ��order_detailsʵ����
 * @author asus
 *@����ʱ�䣺2020��7��6������3:43:07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order_details {
	private int odid;//���鶩��id
	private int pid;//��Ʒid
	private int oid;//����id
	private int comAmount;//��Ʒ����
	private String comName;//��Ʒ����
	private int comPrice;//��Ʒ�۸�
	private String comImage;//��ƷͼƬ
	private Product product;
	private Order order;
}
