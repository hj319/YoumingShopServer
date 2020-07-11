package cn.tea.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
	private int bid;//博客id
	private int uid;//用户id
	private int tid;//博客类型
	private String btitle;//博客标题
	private String bimg;//博客图片
	private String bcontent;//博客内容
	private String bmajor;//内容摘要
	private int blike;//点赞数
	private int bview;//浏览数
	private int bshare;//分享数
	private int cid;
	private Date createTime;
	private Date modifyTime;
	private Blogtype blogtype;
	private User user;
}
