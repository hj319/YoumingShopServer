package cn.tea.pojo;
/**
 * 用户角色表的实体类
 * @author asus
 *@创建时间：2020年6月29日上午9:32:19
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {
	private int rid;//角色id
	private String rname;//角色名称
	private int createBy;//创建者
	private Date createTime;//创建时间
	private int modifyBy;//修改者
	private Date modifyTime;//修改时间
}
