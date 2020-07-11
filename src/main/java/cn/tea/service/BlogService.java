package cn.tea.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tea.pojo.Blog;
import cn.tea.pojo.Blogcomments;
import cn.tea.pojo.Blogtype;

public interface BlogService {
	
	List<Blog> getBlogList(int tid, String btitle);
	
	List<Blogtype> getBlogTypeList(String tname);
	
	List<Blogcomments> getBlogCommentsList(String btitle);
	
	boolean deleteBlog(int bid);
		
	Blog findById(int bid);
		
	boolean addBlogtype(Blogtype blogtype);
	
	boolean deleteBlogtype(int tid);
	
	boolean updateBlogtype(Blogtype type);
	
	Blogtype findBytypeId(int tid);

	boolean deleteManyBlog(List<Integer> ids);

	boolean deleteManyOfBlogType(List<Integer> ids);

	boolean deleteManyOfBlogComment(List<Integer> ids);

	Blogcomments getBlogCommentById(int cid);

	boolean deleteBlogComment(int cid);

	
}
