package cn.tea.pojo;
/**
 * ��Ʒ���۱��ʵ����
 * @author asus
 *@����ʱ�䣺2020��7��1������1:32:37
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Productcomment {
	private int mid;//����id
	private int pid;//��Ʒid
	private int uid;//�û�id
	private String mcontent;//��������
	private Date mtime;//��������
	private Product product;
	private User user;
}
