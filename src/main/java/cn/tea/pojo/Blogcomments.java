package cn.tea.pojo;
/**
 * 博客评论表实体类
 * @author asus
 *@创建时间：2020年7月3日上午11:27:14
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blogcomments {
	private int cid;//博客评论id
	private int bid;//博客id
	private int uid;//用户id
	private String ucontent;//评论内容
	private Date utime;//评论时间
	private Blog blog;
	private User user;
}
