package cn.tea.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tea.pojo.Product;
import cn.tea.pojo.Productcomment;
import cn.tea.pojo.Producttype;
import cn.tea.pojo.User;
import cn.tea.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//分页查询商品数据的请求
	@RequestMapping(value="/product-list.html",method = RequestMethod.GET)
	public String getProductList(@RequestParam(name="currpage",required = false,defaultValue = "1") 
	int currpage,@RequestParam(name="tid",required = false,defaultValue="0") int tid,@RequestParam(name="pname",required = false) String pname,Model model) {
		//调用PageHelp类的方法，startPage就是去获取分页的数据
		
		PageHelper.startPage(currpage,5);
		List<Product> list=productService.getProductList(tid,pname);
		//创建一个分页类的实列
		PageInfo pageInfo=new PageInfo(list,5);
		//将查询到的数据保存到model中去
		model.addAttribute("pageInfo",pageInfo);
		return "product-list";
	}
	
	//获取所有的分类信息的请求
	@RequestMapping(value="/getProductTypeList",method = RequestMethod.GET)
	@ResponseBody
	public Object getProductTypeList(@RequestParam(name="typeName",required = false) String typeName) {
		List<Producttype> list=productService.getProductTypeList(typeName);
		return JSON.toJSONString(list);
	}
	//分页查询所有的分类信息然后跳转到分类页面的请求
		@RequestMapping(value="/product-category.html",method = RequestMethod.GET)
		public String getProductTypeListToJsp(@RequestParam(name="currpage",required = false,defaultValue = "1") 
		int currpage,@RequestParam(name="typeName",required = false) String typeName,Model model) {
			PageHelper.startPage(currpage,5);
			List<Producttype> list=productService.getProductTypeList(typeName);
			PageInfo pageInfo=new PageInfo(list,5);
			//将查询到的数据保存到model中
			model.addAttribute("pageInfo",pageInfo);
			return "product-category";
		}
	//分页查询商品评论信息的请求
		@RequestMapping(value="/product-comment.html",method = RequestMethod.GET)
		public String getProductCommentList(@RequestParam(name="currpage",required = false,defaultValue = "1") 
		int currpage,@RequestParam(name="pname",required = false) String pname,Model model) {
			PageHelper.startPage(currpage,5);
			List<Productcomment> list=productService.getProductCommentList(pname);
			PageInfo pageInfo=new PageInfo(list,5);
			//将查询到的数据保存到model中
			model.addAttribute("pageInfo",pageInfo);
			return "product-comment";
		}
	//上传商品图片的请求
	@RequestMapping(value="/uploadFile",method = RequestMethod.POST)
	@ResponseBody
	public Object addProduct(@RequestParam("crowd_file") MultipartFile crowd_file,HttpSession session) {
		String idPicPath = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		//定义上传文件的路径
		// File.separator 就相当于/，这样写的目的是为了方便系统的迁移
        String filePath = session.getServletContext().getRealPath("static"+File.separator+"files"+File.separator+"product-images");
        //判断上传文件是否为空
		/*
		 * System.out.println(filePath); System.out.println(crowd_file);
		 */
        if(!crowd_file.isEmpty()) {
        	//获得原文件名
        	String oldName=crowd_file.getOriginalFilename();
        	//对文件名进行一个处理
        	String newFileName=System.currentTimeMillis()+RandomUtils.nextInt(100000,999999)+oldName;
        	//创建上传文件对象
        	File saveFile = new File(filePath,newFileName);
        	//判断文件上传对象是否存在，不存在就创建
        	if(!saveFile.exists()) {
        		saveFile.mkdirs();
        	}
        	//将文件进行上传
        	try {
        		crowd_file.transferTo(saveFile);
        		map.put("result", 1);
				
			} catch (IllegalStateException e) {
				map.put("result", 0);
				e.printStackTrace();
				
			} catch (IOException e) {
				map.put("result", 0);
				e.printStackTrace();
				
			}
        	// 将文件保存到本地文件夹中 D:/uploadFile/
            try {
                DataInputStream dis = new DataInputStream(new FileInputStream(saveFile));
                DataOutputStream dos = new DataOutputStream(new FileOutputStream("F:/uploadFile"+"/product/"+newFileName));
                int len = -1;
                while ((len = dis.read()) != -1) {
                    dos.write(len);
                }
                dos.close();
                dis.close();
             //String  picPath = newFileName;
             //将上传文件保存调session中
             session.setAttribute("productImage",newFileName);
             System.out.println(newFileName);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		return JSON.toJSONString(map);
	}
	
	//增加商品数据的请求
	
	  @RequestMapping(value="/addProductList",method = RequestMethod.POST)
	  @ResponseBody 
	  public Object addProduct(Product product,HttpSession session) {
	  Map<String, Integer> map = new HashMap<String, Integer>(); 
	  //需要有创建者 
	 int createdBy=((User) session.getAttribute("loginuser")).getUid();
	 String productImage=(String) session.getAttribute("productImage");
	product.setImg(productImage);
	session.removeAttribute(productImage);
	  //需要创建时间,获得系统的当前时间 
	 product.setCreateBy(createdBy); 
	 product.setCreateTime(new Date()); 
	 boolean isOk=productService.addProduct(product); 
	 if(isOk) { 
		 map.put("result", 1);
	  }else 
	  { 
		  map.put("result", 0);
	  
	  } 
	 return JSON.toJSONString(map);
}
	  
	 
	//批量删除的请求
	@RequestMapping(value="/deleteMany")
	@ResponseBody
	public Object deleteSelect(@RequestParam("productList") String productList,Model model) {
		String[] strs=productList.split(",");
	    List<Integer> ids=new ArrayList<>();
	    for(int i=0;i<strs.length;i++){
	        ids.add(Integer.parseInt(strs[i]));
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=productService.deleteMany(ids);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}
	//批量删除商品分类的请求
	@RequestMapping(value="/deleteManyOfCategory")
	@ResponseBody
	public Object deleteManyOfCategory(@RequestParam("productList") String productList,Model model) {
		String[] strs=productList.split(",");
	    List<Integer> ids=new ArrayList<>();
	    for(int i=0;i<strs.length;i++){
	        ids.add(Integer.parseInt(strs[i]));
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=productService.deleteManyOfCategory(ids);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}
	//批量删除商品评论信息的请求
	@RequestMapping(value="/deleteManyOfComment")
	@ResponseBody
	public Object deleteManyOfComment(@RequestParam("productList") String productList,Model model) {
		String[] strs=productList.split(",");
	    List<Integer> ids=new ArrayList<>();
	    for(int i=0;i<strs.length;i++){
	        ids.add(Integer.parseInt(strs[i]));
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=productService.deleteManyOfComment(ids);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}
	//删除单个商品数据的请求
	@RequestMapping(value="/deleteProduct",method = RequestMethod.GET)
	@ResponseBody
	public Object deleteProduct(@RequestParam("pid") int pid) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=productService.deleteProduct(pid);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	
	//删除单个商品分类数据的请求
	@RequestMapping(value="/deleteProductType",method = RequestMethod.GET)
	@ResponseBody
	public Object deleteProductType(@RequestParam("tid") int tid) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=productService.deleteProductType(tid);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	
	//删除单个商品分类数据的请求
	@RequestMapping(value="/deleteProductComment",method = RequestMethod.GET)
	@ResponseBody
	public Object deleteProductComment(@RequestParam("mid") int mid) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=productService.deleteProductComment(mid);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
		
	//增加商品分类信息的请求
	@RequestMapping(value="/saveProductType",method = RequestMethod.POST)
	@ResponseBody
	public Object saveProductType(Producttype type,HttpSession session) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		//需要一个创建者
		int createBy=((User) session.getAttribute("loginuser")).getUid();
		type.setCreateBy(createBy);
		type.setCreateTime(new Date());
		
		boolean isOk=productService.saveProductType(type);
		if(isOk) {
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	
	//根据id获得商品信息的方请求
	@RequestMapping(value="/getProductById",method=RequestMethod.GET)
	@ResponseBody
	public Object getProductById(@RequestParam("pid") int pid) {
		Product product=productService.findById(pid);
		return JSON.toJSONString(product);
	}
		
	//根据id获得商品分类信息的请求	
	@RequestMapping(value="/getProductTypeById",method=RequestMethod.GET)
	@ResponseBody
	public Object getProductTypeById(@RequestParam("tid") int tid) {
		Producttype productType=productService.getProductTypeById(tid);
		return JSON.toJSONString(productType);
	}
	
	//根据id获得商品评论信息的方请求
	@RequestMapping(value="/getProductCommentById",method=RequestMethod.GET)
	@ResponseBody
	public Object getProductCommentById(@RequestParam("mid") int mid) {
		Productcomment productcomment=productService.getProductCommentById(mid);
		return JSON.toJSONString(productcomment);
	}
	//修改商品信息的请求
	@RequestMapping(value="/updateProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object updateProduct(Product product,HttpSession session) {
		
		Map<String,Integer> map=new HashMap<String,Integer>();
		String productImage=(String) session.getAttribute("productImage");
		if(productImage!=null) {
			product.setImg(productImage);
			session.removeAttribute(productImage);
		}
		int uid=((User)session.getAttribute("loginuser")).getUid();
		product.setModifyBy(uid);
		product.setModifyTime(new Date());
		boolean isOk=productService.updateProduct(product);
		if(isOk)
		{
			map.put("result",1);
		}
		else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}	
	
	//修改商品分类信息的请求
	@RequestMapping(value="/updateProductType",method=RequestMethod.POST)
	@ResponseBody
	public Object updateProductType(Producttype type,HttpSession session) {
		
		Map<String,Integer> map=new HashMap<String,Integer>();
		int uid=((User)session.getAttribute("loginuser")).getUid();
		type.setModifyBy(uid);
		type.setModifyTime(new Date());
		boolean isOk=productService.updateProductType(type);
		if(isOk)
		{
			map.put("result",1);
		}
		else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}	
	
	

	
}	
