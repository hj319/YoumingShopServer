package cn.tea.pojo;
/**
 * �������۱�ʵ����
 * @author asus
 *@����ʱ�䣺2020��7��3������11:27:14
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blogcomments {
	private int cid;//��������id
	private int bid;//����id
	private int uid;//�û�id
	private String ucontent;//��������
	private Date utime;//����ʱ��
	private Blog blog;
	private User user;
}
