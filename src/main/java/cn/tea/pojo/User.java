package cn.tea.pojo;
/**
 * user��ʵ����
 * @author asus
 *@����ʱ�䣺2020��6��29������9:15:40
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int uid;//�û�id
	private String uname;//�û���
	private String headImage;//�û�ͷ��
	private int rid;//�û���ɫid
	private String uemail;//�û�����
	private String upassword;//�û�����
	private String uintroduce;//���˼��
	private String uphone;//�û��绰
	private String uaddress;//�û���ַ
	private Date createTime;//����ʱ��
	private Date modifyTime;//�޸�ʱ��
	private Role role;
}
