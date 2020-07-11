package cn.tea.dao;
/**
 * 商品管理的dao接口
 * @author asus
 *@创建时间：2020年6月29日下午7:07:59
 */

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.tea.pojo.Product;
import cn.tea.pojo.Productcomment;
import cn.tea.pojo.Producttype;
@Repository
public interface ProductDao {
	
	List<Product> getProductList(@Param("tid")int tid, @Param("pname") String pname);
	
	@Insert("insert into tea_product(pname,img,originalPrice,discountPrice,tid,`describe`,"
			+ "createTime,createBy)"
			+ "values(#{pname},#{img},#{originalPrice},#{discountPrice},#{tid},#{describe},#{createTime},#{createBy})")
	int addProduct(Product product);
	
	//这个是删除单个数据的方法
	@Delete("delete from tea_product where pid=#{pid}")
	int deleteProduct(@Param("pid") int pid);
	
	@Update("update tea_product set pname=#{pname},img=#{img},originalPrice=#{originalPrice},discountPrice=#{discountPrice},tid=#{tid},"
			+ "`describe`=#{describe},modifyTime=#{modifyTime},modifyBy=#{modifyBy} where pid=#{pid}")
	int updateProduct(Product product);
	
	//@Select("select * from tea_product where pid=#{pid}")
	Product findById(@Param("pid") int pid);
	
	//这个是查询所有商品分类信息的方法
	List<Producttype> getProductTypeList(@Param("typeName")String typeName);

	//批量删除商品信息的方法
	int deleteMany(List<Integer> d);
	
	//获得所有商品评论信息的方法(多表联查)
	List<Productcomment> getProductCommentList(@Param("pname")String pname);

	//增加商品分类信息的方法
	@Insert("insert into tea_producttype(typeName,typeNotes,createBy,createTime)"
			+ "values(#{typeName},#{typeNotes},#{createBy},#{createTime})")
	int saveProductType(Producttype type);
	
	//批量删除商品分类信息的方法
	int deleteManyOfCategory(List<Integer> d);
	
	//批量删除商品评论信息的方法
	int deleteManyOfComment(List<Integer> d);
	
	//根据tid查询商品分类信息的方法
	@Select("select * from tea_producttype where tid=#{tid}")
	Producttype getProductTypeById(int tid);
	
	//修改商品分类信息的方法
	@Update("update tea_producttype set typeName=#{typeName},typeNotes=#{typeNotes},modifyBy=#{modifyBy},"
			+ "modifyTime=#{modifyTime} where tid=#{tid}")
	int updateProductType(Producttype type);

	//删除单个商品分类信息的方法
	@Delete("delete from tea_producttype where tid=#{tid}")
	int deleteProductType(int tid);
	
	//根据mid查询商品评论信息的方法(多表联查)
	Productcomment getProductCommentById(@Param("mid")int mid);
	
	//删除单条商品评论数据的方法
	@Delete("delete from tea_productmessage where mid=#{mid}")
	int deleteProductComment(int mid);
	
	
}
