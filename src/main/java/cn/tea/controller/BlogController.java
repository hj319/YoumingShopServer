package cn.tea.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tea.pojo.Blog;
import cn.tea.pojo.Blogcomments;
import cn.tea.pojo.Blogtype;
import cn.tea.pojo.Producttype;
import cn.tea.pojo.User;
import cn.tea.service.BlogService;

@Controller
public class BlogController {
	@Autowired
	private BlogService blogService;
	
	//获得所有博客信息的请求，包括分页，模糊查询等
	@RequestMapping(value="/blog-list.html",method = RequestMethod.GET)
	public String getBlogList(@RequestParam(name="currpage",required = false,defaultValue = "1") int currpage,
			@RequestParam(name="tid",required = false,defaultValue = "0") int tid,
			@RequestParam(name="btitle",required = false,defaultValue = "") String btitle,
			Model model) {
		PageHelper.startPage(currpage,5);
		List<Blog> list=blogService.getBlogList(tid,btitle);
		//创建一个分页类实体
		PageInfo pageInfo=new PageInfo(list,5);
		model.addAttribute("pageInfo",pageInfo);
		return "blog-list";
	}
	//获取所有的分类信息的请求
		@RequestMapping(value="/getBlogTypeList",method = RequestMethod.GET)
		@ResponseBody
		public Object getBlogTypeList(@RequestParam(name="tname",required = false) String tname) {
			List<Blogtype> list=blogService.getBlogTypeList(tname);
			return JSON.toJSONString(list);
	}
	//获取所有分类信息分页展示，模糊查询请求
		@RequestMapping(value="/blog-category.html",method = RequestMethod.GET)
		public String getBlogTypeListToJsp(@RequestParam(name="currpage",required = false,defaultValue = "1") 
		int currpage,@RequestParam(name="tname",required = false) String tname,Model model) {
			PageHelper.startPage(currpage,5);
			List<Blogtype> list=blogService.getBlogTypeList(tname);
			PageInfo pageInfo=new PageInfo(list,5);
			//将查询到的数据保存到model中
			model.addAttribute("pageInfo",pageInfo);
			return "blog-category";
		}
		
	//获取所有博客评论信息分页展示，模糊查询的请求
		@RequestMapping(value="/blog-comment.html",method = RequestMethod.GET)
		public String getBlogCommentsList(@RequestParam(name="currpage",required = false,defaultValue = "1") 
		int currpage,@RequestParam(name="btitle",required = false,defaultValue = "") String btitle,Model model) {
			PageHelper.startPage(currpage,5);
			List<Blogcomments> list=blogService.getBlogCommentsList(btitle);
			PageInfo pageInfo=new PageInfo(list,5);
			//将查询到的数据保存到model中
			model.addAttribute("pageInfo",pageInfo);
			return "blog-comment";
		}
		
	//根据id获得博客数据的请求
	@RequestMapping(value="/getBlogById",method=RequestMethod.GET)
	@ResponseBody
	public Object getBlogById(@RequestParam("bid") int bid) {
		Blog blog=blogService.findById(bid);
		return JSON.toJSONString(blog);
	}
	
	//根据id获得博客评论数据的请求
	@RequestMapping(value="/getBlogCommentById",method=RequestMethod.GET)
	@ResponseBody
	public Object getBlogCommentById(@RequestParam("cid") int cid) {
		Blogcomments blogcomments=blogService.getBlogCommentById(cid);
		return JSON.toJSONString(blogcomments);
	}
		
	//根据id获得博客分类数据的请求
	@RequestMapping(value="/getBlogTypeById",method=RequestMethod.GET)
	@ResponseBody
	public Object getBlogTypeById(@RequestParam("tid") int tid) {
		Blogtype blogType=blogService.findBytypeId(tid);
		return JSON.toJSONString(blogType);
	}	
	
	//删除单个博客数据的请求
	@RequestMapping(value="/deleteBlog",method = RequestMethod.GET)
	@ResponseBody
	public Object deleteBlog(@RequestParam("bid") int bid) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=blogService.deleteBlog(bid);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}	
	//删除单个博客分类数据的请求
	@RequestMapping(value="/deleteBlogType",method = RequestMethod.GET)
	@ResponseBody
	public Object deleteBlogType(@RequestParam("tid") int tid) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=blogService.deleteBlogtype(tid);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	
	//删除单个博客评论数据的请求
	@RequestMapping(value="/deleteBlogComment",method = RequestMethod.GET)
	@ResponseBody
	public Object deleteBlogComment(@RequestParam("cid") int cid) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=blogService.deleteBlogComment(cid);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
		
	//增加博客分类信息的请求
	@RequestMapping(value="/saveBlogType",method = RequestMethod.POST)
	@ResponseBody
	public Object saveBlogType(Blogtype type,HttpSession session) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		//需要一个创建者
		int createBy=((User) session.getAttribute("loginuser")).getUid();
		type.setCreateBy(createBy);
		type.setCreateTime(new Date());
		
		boolean isOk=blogService.addBlogtype(type);
		if(isOk) {
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
	
	//修改博客分类信息的请求
	@RequestMapping(value="/updateBlogType",method=RequestMethod.POST)
	@ResponseBody
	public Object updateBlogType(Blogtype type,HttpSession session) {
		
		Map<String,Integer> map=new HashMap<String,Integer>();
		int uid=((User)session.getAttribute("loginuser")).getUid();
		type.setModifyBy(uid);
		type.setModifyTime(new Date());
		boolean isOk=blogService.updateBlogtype(type);
		if(isOk)
		{
			map.put("result",1);
		}
		else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}	
		
	//批量删除博客信息的请求
	@RequestMapping(value="/deleteManyBlog")
	@ResponseBody
	public Object deleteManyBlog(@RequestParam("productList") String productList,Model model) {
		String[] strs=productList.split(",");
	    List<Integer> ids=new ArrayList<>();
	    for(int i=0;i<strs.length;i++){
	        ids.add(Integer.parseInt(strs[i]));
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=blogService.deleteManyBlog(ids);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}
		
	//批量删除博客分类信息的请求
	@RequestMapping(value="/deleteManyOfBlogType")
	@ResponseBody
	public Object deleteManyOfBlogType(@RequestParam("productList") String productList,Model model) {
		String[] strs=productList.split(",");
	    List<Integer> ids=new ArrayList<>();
	    for(int i=0;i<strs.length;i++){
	        ids.add(Integer.parseInt(strs[i]));
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=blogService.deleteManyOfBlogType(ids);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}
	
	//批量删除博客分类信息的请求
	@RequestMapping(value="/deleteManyOfBlogComment")
	@ResponseBody
	public Object deleteManyOfBlogComment(@RequestParam("productList") String productList,Model model) {
		String[] strs=productList.split(",");
	    List<Integer> ids=new ArrayList<>();
	    for(int i=0;i<strs.length;i++){
	        ids.add(Integer.parseInt(strs[i]));
	    }
	    Map<String, Integer> map=new HashMap<String, Integer>();
		boolean isOk=blogService.deleteManyOfBlogComment(ids);
		if(isOk) {
			map.put("result",1);
		}else {
			map.put("result",0);
		}
		return JSON.toJSONString(map);
	}
}
