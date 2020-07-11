package cn.tea.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.BlogDao;
import cn.tea.pojo.Blog;
import cn.tea.pojo.Blogcomments;
import cn.tea.pojo.Blogtype;
import cn.tea.service.BlogService;
@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
	private BlogDao blogDao;
	@Override
	public List<Blog> getBlogList(int tid,String btitle) {
		
		return blogDao.getBlogList(tid,btitle);
	}
	
	@Override
	public List<Blogtype> getBlogTypeList(String tname) {
		
		return blogDao.getBlogtypeList(tname);
	}
	
	@Override
	public List<Blogcomments> getBlogCommentsList(String btitle) {
		
		return blogDao.getBlogCommentsList(btitle);
	}
	
	@Override
	public boolean deleteBlog(int bid) {
		int result=blogDao.deleteBlog(bid);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}


	@Override
	public Blog findById(int bid) {
		
		return blogDao.findById(bid);
	}

	@Override
	public boolean addBlogtype(Blogtype blogtype) {
		int result=blogDao.addBlogtype(blogtype);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteBlogtype(int tid) {
		int result=blogDao.deleteBlogtype(tid);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean updateBlogtype(Blogtype type) {
		int result=blogDao.updateBlogtype(type);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Blogtype findBytypeId(int tid) {
		
		return blogDao.findBytypeId(tid);
	}

	@Override
	public boolean deleteManyBlog(List<Integer> d) {
		int result=blogDao.deleteManyBlog(d);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteManyOfBlogType(List<Integer> d) {
		int result=blogDao.deleteManyOfBlogType(d);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteManyOfBlogComment(List<Integer> d) {
		int result=blogDao.deleteManyOfBlogComment(d);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Blogcomments getBlogCommentById(int cid) {
		
		return blogDao.getBlogCommentById(cid);
	}

	@Override
	public boolean deleteBlogComment(int cid) {
		int result=blogDao.deleteBlogComment(cid);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	

	

}
