package cn.tea.service;
/**
 * 商品表业务类接口
 * @author asus
 *@创建时间：2020年6月30日上午9:00:13
 */

import java.util.List;

import cn.tea.pojo.Product;
import cn.tea.pojo.Productcomment;
import cn.tea.pojo.Producttype;

public interface ProductService {
	
	List<Product> getProductList(int tid, String pname);
	
	boolean addProduct(Product product);
	
	boolean deleteProduct(int pid);
	
	boolean updateProduct(Product product);
	
	Product findById(int pid);

	List<Producttype> getProductTypeList(String typeName);

	boolean deleteMany(List<Integer> ids);

	List<Productcomment> getProductCommentList(String pname);

	boolean saveProductType(Producttype type);

	boolean deleteManyOfCategory(List<Integer> ids);

	boolean deleteManyOfComment(List<Integer> ids);

	Producttype getProductTypeById(int tid);

	boolean updateProductType(Producttype type);

	boolean deleteProductType(int tid);

	Productcomment getProductCommentById(int mid);

	boolean deleteProductComment(int mid);


}
