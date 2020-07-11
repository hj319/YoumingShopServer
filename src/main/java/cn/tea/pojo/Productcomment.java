package cn.tea.pojo;
/**
 * 商品评论表的实体类
 * @author asus
 *@创建时间：2020年7月1日下午1:32:37
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Productcomment {
	private int mid;//评论id
	private int pid;//商品id
	private int uid;//用户id
	private String mcontent;//评论内容
	private Date mtime;//评论日期
	private Product product;
	private User user;
}
