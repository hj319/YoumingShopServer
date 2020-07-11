package cn.tea.pojo;
/**
 * user表实体类
 * @author asus
 *@创建时间：2020年6月29日上午9:15:40
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int uid;//用户id
	private String uname;//用户名
	private String headImage;//用户头像
	private int rid;//用户角色id
	private String uemail;//用户邮箱
	private String upassword;//用户密码
	private String uintroduce;//个人简介
	private String uphone;//用户电话
	private String uaddress;//用户地址
	private Date createTime;//创建时间
	private Date modifyTime;//修改时间
	private Role role;
}
