package cn.tea.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blogtype {
	private int tid;//���ͷ���id
	private String tname;//���ͷ�������
	private int createBy;//������
	private Date createTime;//����ʱ��
	private int modifyBy;//�޸���
	private Date modifyTime;//�޸�ʱ��
}
