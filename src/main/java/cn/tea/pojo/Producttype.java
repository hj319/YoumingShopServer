package cn.tea.pojo;
/**
 * ��Ʒ�����ʵ����
 * @author asus
 *@����ʱ�䣺2020��6��30������11:14:38
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Producttype {
	private int tid;//��Ʒ����id
	private String typeName;//��������
	private String typeNotes;//���౸ע
	private int createBy;//������
	private Date createTime;//����ʱ��
	private int modifyBy;//�޸���
	private Date modifyTime;//�޸�ʱ��
	
}
