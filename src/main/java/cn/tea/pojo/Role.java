package cn.tea.pojo;
/**
 * �û���ɫ���ʵ����
 * @author asus
 *@����ʱ�䣺2020��6��29������9:32:19
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {
	private int rid;//��ɫid
	private String rname;//��ɫ����
	private int createBy;//������
	private Date createTime;//����ʱ��
	private int modifyBy;//�޸���
	private Date modifyTime;//�޸�ʱ��
}
