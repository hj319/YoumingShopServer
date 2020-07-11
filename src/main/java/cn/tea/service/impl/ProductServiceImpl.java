package cn.tea.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.ProductDao;
import cn.tea.pojo.Product;
import cn.tea.pojo.Productcomment;
import cn.tea.pojo.Producttype;
import cn.tea.service.ProductService;
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<Product> getProductList(int tid,String pname) {
		
		return productDao.getProductList(tid,pname);
	}

	@Override
	public boolean addProduct(Product product) {
		int result=productDao.addProduct(product);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteProduct(int pid) {
		int result=productDao.deleteProduct(pid);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean updateProduct(Product product) {
		int result=productDao.updateProduct(product);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Product findById(int pid) {
		
		return productDao.findById(pid);
	}

	@Override
	public List<Producttype> getProductTypeList(String typeName) {
		
		return productDao.getProductTypeList(typeName);
	}

	@Override
	public boolean deleteMany(List<Integer> d) {
		int result=productDao.deleteMany(d);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<Productcomment> getProductCommentList(String pname) {
		
		return productDao.getProductCommentList(pname);
	}

	@Override
	public boolean saveProductType(Producttype type) {
		int result=productDao.saveProductType(type);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteManyOfCategory(List<Integer> d) {
		int result=productDao.deleteManyOfCategory(d);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteManyOfComment(List<Integer> d) {
		int result=productDao.deleteManyOfComment(d);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Producttype getProductTypeById(int tid) {
		
		return productDao.getProductTypeById(tid);
	}

	@Override
	public boolean updateProductType(Producttype type) {
		int result=productDao.updateProductType(type);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteProductType(int tid) {
		int result=productDao.deleteProductType(tid);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Productcomment getProductCommentById(int mid) {
		
		return productDao.getProductCommentById(mid);
	}

	@Override
	public boolean deleteProductComment(int mid) {
		int result=productDao.deleteProductComment(mid);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

}
