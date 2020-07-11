package cn.tea.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blogtype {
	private int tid;//博客分类id
	private String tname;//博客分类名称
	private int createBy;//创建者
	private Date createTime;//创建时间
	private int modifyBy;//修改者
	private Date modifyTime;//修改时间
}
