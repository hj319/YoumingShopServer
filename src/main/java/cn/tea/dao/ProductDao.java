package cn.tea.dao;
/**
 * ��Ʒ�����dao�ӿ�
 * @author asus
 *@����ʱ�䣺2020��6��29������7:07:59
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
	
	//�����ɾ���������ݵķ���
	@Delete("delete from tea_product where pid=#{pid}")
	int deleteProduct(@Param("pid") int pid);
	
	@Update("update tea_product set pname=#{pname},img=#{img},originalPrice=#{originalPrice},discountPrice=#{discountPrice},tid=#{tid},"
			+ "`describe`=#{describe},modifyTime=#{modifyTime},modifyBy=#{modifyBy} where pid=#{pid}")
	int updateProduct(Product product);
	
	//@Select("select * from tea_product where pid=#{pid}")
	Product findById(@Param("pid") int pid);
	
	//����ǲ�ѯ������Ʒ������Ϣ�ķ���
	List<Producttype> getProductTypeList(@Param("typeName")String typeName);

	//����ɾ����Ʒ��Ϣ�ķ���
	int deleteMany(List<Integer> d);
	
	//���������Ʒ������Ϣ�ķ���(�������)
	List<Productcomment> getProductCommentList(@Param("pname")String pname);

	//������Ʒ������Ϣ�ķ���
	@Insert("insert into tea_producttype(typeName,typeNotes,createBy,createTime)"
			+ "values(#{typeName},#{typeNotes},#{createBy},#{createTime})")
	int saveProductType(Producttype type);
	
	//����ɾ����Ʒ������Ϣ�ķ���
	int deleteManyOfCategory(List<Integer> d);
	
	//����ɾ����Ʒ������Ϣ�ķ���
	int deleteManyOfComment(List<Integer> d);
	
	//����tid��ѯ��Ʒ������Ϣ�ķ���
	@Select("select * from tea_producttype where tid=#{tid}")
	Producttype getProductTypeById(int tid);
	
	//�޸���Ʒ������Ϣ�ķ���
	@Update("update tea_producttype set typeName=#{typeName},typeNotes=#{typeNotes},modifyBy=#{modifyBy},"
			+ "modifyTime=#{modifyTime} where tid=#{tid}")
	int updateProductType(Producttype type);

	//ɾ��������Ʒ������Ϣ�ķ���
	@Delete("delete from tea_producttype where tid=#{tid}")
	int deleteProductType(int tid);
	
	//����mid��ѯ��Ʒ������Ϣ�ķ���(�������)
	Productcomment getProductCommentById(@Param("mid")int mid);
	
	//ɾ��������Ʒ�������ݵķ���
	@Delete("delete from tea_productmessage where mid=#{mid}")
	int deleteProductComment(int mid);
	
	
}
