package cn.tea.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
	private int bid;//����id
	private int uid;//�û�id
	private int tid;//��������
	private String btitle;//���ͱ���
	private String bimg;//����ͼƬ
	private String bcontent;//��������
	private String bmajor;//����ժҪ
	private int blike;//������
	private int bview;//�����
	private int bshare;//������
	private int cid;
	private Date createTime;
	private Date modifyTime;
	private Blogtype blogtype;
	private User user;
}
