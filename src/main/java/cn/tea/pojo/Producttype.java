package cn.tea.pojo;
/**
 * 商品分类的实体类
 * @author asus
 *@创建时间：2020年6月30日上午11:14:38
 */

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Producttype {
	private int tid;//商品分类id
	private String typeName;//分类名称
	private String typeNotes;//分类备注
	private int createBy;//创建者
	private Date createTime;//创建时间
	private int modifyBy;//修改者
	private Date modifyTime;//修改时间
	
}
